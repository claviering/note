# node.js学习

## 配置 https

### 安装 openssl
下载 openssl 解压 VSCode 打开
`./config --prefix=/Users/linweiye/Documents/openssl-1-1-1 --openssldir=/Users/linweiye/Documents/openssl-1-1-1 enable-ec_nistp_64_gcc_128`

```
$ make depend
$ make
$ sudo make install
```
在 `/Users/linweiye/Documents/openssl-1-1-1 ` 目录下 

`private/` 目录 私钥
`certs/` 目录 根证书

## 操作 xlsx 文件

node-xlsx

## 文件上传

multer

文件属性

```js
exports.uploadFile = (req, res) => {
  var file = req.file;
  console.log('文件类型：%s', file.mimetype);
  console.log('原始文件名：%s', file.originalname);
  console.log('文件大小：%s', file.size);
  console.log('文件保存路径：%s', file.path);
  res.send('upload success')
}
```

保存原文件名的
```js
const multer = require('multer');
const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, 'uploads')
  },
  filename: function (req, file, cb) {
    cb(null, file.originalname)
  }
})

const upload = multer({ storage: storage });
app.post('/upload', upload.single('file'), controller.uploadFile);
```

没有保存文件名的
```js
const express = require('express');
const multer = require('multer');
const upload = multer({
  dest: 'uploads/' // this saves your file into a directory called "uploads"
}); 

const app = express();

app.get('/', (req, res) => {
  res.sendFile(__dirname + '/index.html');
});

// It's very crucial that the file name matches the name attribute in your html
app.post('/', upload.single('file-to-upload'), (req, res) => {
  res.redirect('/');
});

app.listen(3000);
```

```html
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Simple Multer Upload Example</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
  </head>
  <body>
    <form action="/" enctype="multipart/form-data" method="post">
      <input type="file" name="file-to-upload">
      <input type="submit" value="Upload">
    </form>  
  </body>
</html>
```

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
### serve-static
在给定的目录插件服务

### vhost
域名请求过滤
`npm install -S vhost`
### connect-timeout

请求超时
`npm install connect-timeout`

### express-session

### response-time
响应时间

`npm install -S response-time`
```js
app.use(responseTime((req, res, time) => {
  console.log(time)
}))
```
### Multer

多文件上传

`npm install --save multer`

### morgan

HTTP request logger

HTTP 请求日志记录

`npm i -S morgan`

### errorhandler
错误处理
`npm install errorhandler`

### cors
跨域中间件
`npm install cors`

### cookie-session
`npm install cookie-session`

### cookie-parser

`npm install -S cookie-parser`

```js
var express = require('express')
var cookieParser = require('cookie-parser')

var app = express()
app.use(cookieParser())

app.get('/', function (req, res) {
  // Cookies that have not been signed
  console.log('Cookies: ', req.cookies)

  // Cookies that have been signed
  console.log('Signed Cookies: ', req.signedCookies)
})

app.listen(8080)
```

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
app.engine('html', require('express-art-template'));
app.set('view options', {
    debug: process.env.NODE_ENV !== 'production'
});

app.get('/', function (req, res) {
    res.render('index.html', {
        user: {
            name: 'aui',
            tags: ['art', 'template', 'nodejs']
        }
    });
});
```
## express

[中间件说明](https://juejin.im/post/5b9a23a45188255c9c751b07)


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

使用 Promise 
fs.promised
```js
fs.promised
```

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




