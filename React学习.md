# React 学习

## 安装

```shell
npm i -D react react-dom
```

## 初始化一个项目

```shell
npm init react-app my-app
cd my-app
npm strat
npm run build
```

## 安装babel
```shell
npm i -D @bable/core @babel/preset-env @babel/preset-react babel-loader
```

配置babel
```js
module: {
    rules: [
      {
        test: /\.js|jsx$/, 
        exclude: /node_modules/,
        use: {
          loader: 'babel-loader',
          options: {
            presets: ['@babel/preset-env', '@babel/preset-react']
          }
        }
      }
    ]
  }
```

## 使用
index.js

```js
import React from 'react'
import ReactDOM from 'react-dom'
const mydiv = <div>my div</div>
const app = document.getElementById('app')
ReactDOM.render(mydiv, app)
```