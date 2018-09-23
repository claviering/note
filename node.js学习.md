# node.js学习

## 模块
每个模块都有一个自己的module对象,module对象中有一个exports成员,文件最后`return module.exports`,为了简化代码，有一句 `var exports =  module.exports`所以`exports.a = 1`是等价`module.exports.a = 1`

```js
var module = {
  exports: {}
}

return module.exports
```

### 导出多个成员
a.js
```js
exports.obj = {a:1}
```
b.js
```js
const hello = requirt('./a.js) 
// b.js文件的 hello === exports a.js文件中的exports
```
### 导出单个成员
a.js
```js
module.exports = 'hello'
```
b.js
```js
const hello = require('./a.js')
// b.js文件的 hello ===  a.js文件中的'hello'
```

## cli-color
输出颜色

## 中间件使用

### compression

[Compress HTTP responses.](http://www.expressjs.com.cn/en/resources/middleware/compression.html)

`npm install -S compression`

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




