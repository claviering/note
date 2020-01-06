# xlsx 库

[xlsx](https://scarletsky.github.io/2016/01/30/nodejs-process-excel/)

## 一些概念
- workbook 对象，指的是整份 Excel 文档。我们在使用 js-xlsx 读取 Excel 文档之后就会获得 workbook 对象。
- worksheet 对象，指的是 Excel 文档中的表。我们知道一份 Excel 文档中可以包含很多张表，而每张表对应的就是 worksheet 对象。
- cell 对象，指的就是 worksheet 中的单元格，一个单元格就是一个 cell 对象。

它们的关系如下
```json
// workbook
{
    SheetNames: ['sheet1', 'sheet2'],
    Sheets: {
        // worksheet
        'sheet1': {
            // cell
            'A1': { ... },
            // cell
            'A2': { ... },
            ...
        },
        // worksheet
        'sheet2': {
            // cell
            'A1': { ... },
            // cell
            'A2': { ... },
            ...
        }
    }
}
```

## 具体用法

### 读取 Excel 文件

```js
import XLSX from 'xlsx';
const workbook = XLSX.readFile('someExcel.xlsx', opts);
let SheetName = 'resources' // 表名称
// 解析为数组对象
let dataList = XLSX.utils.sheet_to_json(workbook.Sheets[SheetName])
```

### 导出表格

步骤

1. 构建特定的数据结构，如下
2. 调用 XLSX.writeFile(workbook, filename) 即可

```js
// workbook
{
  SheetNames: ['mySheet'],
  Sheets: {
    'mySheet': {
      '!ref': 'A1:E4', // 必须要有这个范围才能输出，否则导出的 excel 会是一个空表
      A1: { v: 'id'},
    }
  }
}
```


```js
var _headers = ['id', 'name', 'age', 'country', 'remark']
var _data = [{
  id: '1',
  name: 'test1',
  age: '30',
  country: 'China',
  remark: 'hello'
},
{
  id: '2',
  name: 'test2',
  age: '20',
  country: 'America',
  remark: 'world'
},
{
  id: '3',
  name: 'test3',
  age: '18',
  country: 'Unkonw',
  remark: '???'
}];

var headers = _headers
  // 为 _headers 添加对应的单元格位置
  // [ { v: 'id', position: 'A1' },
  //   { v: 'name', position: 'B1' },
  //   { v: 'age', position: 'C1' },
  //   { v: 'country', position: 'D1' },
  //   { v: 'remark', position: 'E1' } ]
  .map((v, i) => Object.assign({}, { v: v, position: String.fromCharCode(65 + i) + 1 }))
  // 转换成 worksheet 需要的结构
  // { A1: { v: 'id' },
  //   B1: { v: 'name' },
  //   C1: { v: 'age' },
  //   D1: { v: 'country' },
  //   E1: { v: 'remark' } }
  .reduce((prev, next) => Object.assign({}, prev, { [next.position]: { v: next.v } }), {});

var data = _data
  // 匹配 headers 的位置，生成对应的单元格数据
  // [ [ { v: '1', position: 'A2' },
  //     { v: 'test1', position: 'B2' },
  //     { v: '30', position: 'C2' },
  //     { v: 'China', position: 'D2' },
  //     { v: 'hello', position: 'E2' } ],
  //   [ { v: '2', position: 'A3' },
  //     { v: 'test2', position: 'B3' },
  //     { v: '20', position: 'C3' },
  //     { v: 'America', position: 'D3' },
  //     { v: 'world', position: 'E3' } ],
  //   [ { v: '3', position: 'A4' },
  //     { v: 'test3', position: 'B4' },
  //     { v: '18', position: 'C4' },
  //     { v: 'Unkonw', position: 'D4' },
  //     { v: '???', position: 'E4' } ] ]
  .map((v, i) => _headers.map((k, j) => Object.assign({}, { v: v[k], position: String.fromCharCode(65 + j) + (i + 2) })))
  // 对刚才的结果进行降维处理（二维数组变成一维数组）
  // [ { v: '1', position: 'A2' },
  //   { v: 'test1', position: 'B2' },
  //   { v: '30', position: 'C2' },
  //   { v: 'China', position: 'D2' },
  //   { v: 'hello', position: 'E2' },
  //   { v: '2', position: 'A3' },
  //   { v: 'test2', position: 'B3' },
  //   { v: '20', position: 'C3' },
  //   { v: 'America', position: 'D3' },
  //   { v: 'world', position: 'E3' },
  //   { v: '3', position: 'A4' },
  //   { v: 'test3', position: 'B4' },
  //   { v: '18', position: 'C4' },
  //   { v: 'Unkonw', position: 'D4' },
  //   { v: '???', position: 'E4' } ]
  .reduce((prev, next) => prev.concat(next))
  // 转换成 worksheet 需要的结构
  //   { A2: { v: '1' },
  //     B2: { v: 'test1' },
  //     C2: { v: '30' },
  //     D2: { v: 'China' },
  //     E2: { v: 'hello' },
  //     A3: { v: '2' },
  //     B3: { v: 'test2' },
  //     C3: { v: '20' },
  //     D3: { v: 'America' },
  //     E3: { v: 'world' },
  //     A4: { v: '3' },
  //     B4: { v: 'test3' },
  //     C4: { v: '18' },
  //     D4: { v: 'Unkonw' },
  //     E4: { v: '???' } }
  .reduce((prev, next) => Object.assign({}, prev, { [next.position]: { v: next.v } }), {});

// 合并 headers 和 data
var output = Object.assign({}, headers, data);
// 获取所有单元格的位置
var outputPos = Object.keys(output);
// 计算出范围
var ref = outputPos[0] + ':' + outputPos[outputPos.length - 1];

// 构建 workbook 对象
var wb = {
  SheetNames: ['mySheet'],
  Sheets: {
    'mySheet': Object.assign({}, output, { '!ref': ref })
  }
};

// 导出 Excel
XLSX.writeFile(wb, 'output.xlsx');
```