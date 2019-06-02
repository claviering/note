# Flask

Python 服务器框架

## 快速开始

```py
#!/usr/bin/env python
#-*- coding: utf-8 -*-
# 运行 FLASK_APP=flask/main.py flask run
from flask import Flask
app = Flask(__name__)

@app.route("/")
def hello():
    return "Hello World!"
```

## 其他参数

`flask run --host=0.0.0.0` 允许公网访问

## 调试

```shell
$ export FLASK_ENV=development
$ flask run
```

## 路由

route()

```py
@app.route('/')
def index():
    return 'Index Page'

@app.route('/hello')
def hello():
    return 'Hello, World'
```

动态路由

```py
@app.route('/user/<username>')
@app.route('/post/<int:post_id>')
@app.route('/path/<path:subpath>')
```

## 请求方式

`@app.route('/login', methods=['GET', 'POST'])`

## 静态资源

`url_for('static', filename='style.css')`