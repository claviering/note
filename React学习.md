# React 学习

## 全家桶

- Mobx 状态管理

## 安装

```shell
npm i -D react react-dom
```

## 初始化一个项目

```shell
npx create-react my-app
cd my-app
npm start
npm run build
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