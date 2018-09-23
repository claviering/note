# node.js学习

## cli-color
输出颜色

## 中间件使用

### body-parser

Install
`npm install -S body-parser`

Example
```js
var express = require('express')
var bodyParser = require('body-parser')

var app = express()

// 配置
// parse application/x-www-form-urlencoded
app.use(bodyParser.urlencoded({ extended: false }))

// parse application/json
app.use(bodyParser.json())

// 使用
app.use(function (req, res) {
  res.setHeader('Content-Type', 'text/plain')
  res.write('you posted:\n')
  res.end(JSON.stringify(req.body, null, 2))
})
```

## MVC设计模式

M: Model 模型 处理应用程序数据逻辑，数据库存储数据
V: View 视图，数据显现
C: Controller 控制器，处理用户交互 (包工头)

User -> Controller <-> Model -> View

## express中使用 art-template 模板引擎

**install **

```js
npm install --save art-template express-art-template
```

```js
var express = require('express');
var app = express();

// art参数要和res.render第一个参数的文件后缀名一样
app.engine('art', require('express-art-template'));
app.set('view options', {
    debug: process.env.NODE_ENV !== 'production'
});

app.get('/', function (req, res) {
    res.render('index.art', {
        user: {
            name: 'aui',
            tags: ['art', 'template', 'nodejs']
        }
    });
});
```
## express

`npm i -S express`

```js
const express = require('express')
const app = express()

app.use(express.static('public'))
app.get('/', function (req, res) {
  res.send('中国')
})

app.listen(3000, () => {
  console.log('http://127.0.0.1:3000')
})
```

获取动态url
```js
app.get('/student/:num, (req, res) => {
  console.log(req.params.num)
})
```
## fs

没有data目录要先创建目录，不然报错
```js
exports.save = (num, result) => {
  fs.writeFile('./data/' + num + '.tet', JSON.stringify(result), (err) => {
    if (err) {
      console.log('save file error')
      console.log(err)
    } else {
      console.log('save success')
    }
  })
}
```

```js
const fs = require('fs');
fs.readFile('filename', (err, data) => {
  if (err) {
    return console.log('读取失败')
  }
  data.toString() // 二进制数据转换为字符串，可以给art-template使用
})

```
## 热加载

```
node i nodemon -g
nodemon app.js
```




