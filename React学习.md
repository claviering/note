# React 学习

## Redux

1. 状态管理的 js 库
2. 集中管理组件共享状态

## UI 库

1. ant-design
2. material-ui

`babel-loader-import` 按需打包

## 类似 vue 的 v-for
```js
return (
  this.state.list.map((item, index) => (
    <ul>
    {
      <li>
        {item}{index}
      </li>
    }
    </ul>
  ))
)
```
## 组件传值

1. props
2. 使用消息订阅 subscribe -发布 publish 机制
3. redux

### 组件传值 使用 redux

### 组件传值 使用 PubSubJS

[github](https://github.com/mroderick/PubSubJS)

兄弟组件 search.jsx
```js
import PubSub from 'pubsub-js'

// 发布消息 消息名, 发送的数据
PubSub.publish('search', searchName)
```

兄弟组件 main.jsx
```js
import PubSub from 'pubsub-js'

// 订阅消息 消息名, 接收的数据
PubSub.subscribe('search', (msg, searchName) => {
  console.log(msg, searchName)
})
```


### 组件传值 使用 props

### 子组件传给父组件 父组件传给子组件

子组件 Search.jsx -> 父组件 App.jsx -> 子组件 Main.jsx

子组件 Search.jsx
```js
import PropTypes from 'prop-types'

state propTypes = {
  setSearchName: PropTypes.func.isRequired
}

search = () => {
  const searchName = this.input.value.trim()
  if (searchName) {
    this.props.setSearchName(searchName)
  }
}

render () {
  return (
    <input ref={input => this.input = input}></input>
    <button onClick={this.search}></button>
  )
}
```

父组件 App.jsx
```js
state = {
  searchName: ''
}

setSearchName = (searchName) => {
  this.setState({searchName})
}

render () {
  return (
    <div>
      <Search setSearchName={this.setSearchName}></Search>
      <Main searchName={this.state.searchName}></Main>
    </div>
  )
}
```

子组件 Main.jsx
```js
import PropTypes from 'prop-types'
state propTypes = {
  searchName: PropTypes.string.isRequired
}

render () {
  const {searchName} = this.props
  return (
    <h1>{searchName}<h1>
  )
}
```

## 添加 alias

`'@': path.resolve(__dirname, '../src'),`

## 配置 sass

1. 创建项目
2. npm run eject
3. npm i -D sass-loader node-sass

edit the webpack.config.dev.js

Also don’t forget to replicate the same in webpack.config.prod.js for production builds.

`file-loader` 前面添加
```js
{
  test: /\.scss|sass$/,
  use: ["style-loader", "css-loader", "sass-loader"]
}
```

## react Router

```sh
npm install --save react-router-dom
```

### 路由转跳2种方法

1. 路由组件
2. 函数

#### 函数转跳

```js
function show () {
  this.props.history.push(url)
}
```

### 路由组件

```js
<BrowserRouter></BrowserRouter> // 包含着<App /> 接管应用 <BrowserRouter><App /></BrowserRouter> 
<HashRouter></HashRouter>
<Router></Router> // 路由显示组件
<Redirct></Redirct> // 路由重定向
<Link></Link> // 路由链接
<NavLink></NavLink>
<Switch></Switch> // 只匹配一个路由
```

### 重新封装路由组件
```js
render () {
  reutrn (
    <NavLink {..this.props} mysetting></NavLink>
  )
}
```

### 路由传值
父组件
 ```js
 <Route path={'/home/:id'}>
 ```
 子组件
 ```js
 const id = this.props.match.params.id
 ```

## Adding Bootstrap

```sh
npm install --save reactstrap
```

```js
import React from 'react';
import 'bootstrap/dist/css/bootstrap.min.css'; // Import Bootstrap CSS in the src/index.js file:
import { Button } from 'reactstrap';

export default (props) => {
  return (
    <Button color="danger">Danger!</Button>
  );
};
```

## 组件

`Button.js`
```js
import React, { Component } from 'react';

class Button extends Component {
  render() {
    // ...
  }
}

export default Button; // Don’t forget to use export default!
```
`DangerButton.js`
```js
import React, { Component } from 'react';
import Button from './Button'; // Import a component from another file

class DangerButton extends Component {
  render() {
    return <Button color="red" />;
  }
}

export default DangerButton;
```

## 虚拟DOM
1. DOM的本质: 浏览器中的js对象,用js对象表示页面上的元素,提供操作DOM的API
2. React中的虚拟DOM，框架中的概念，用js模拟页面上的DOM
3. 为什么用DOM: 实现页面上DOM元素的高效更新
4. 浏览器获取服务器html，在内存中解析DOM结构，渲染一颗DOM数，呈现到页面上
5. 用js对象模拟DOM树

## Diff算法
- tree diff 一层一层对比
- component diff 组件组件对比
- element diff 元素元素对比

##  React 与 Vue 对比

### 组件化
1. 什么是模块化: 代码角度,复用代码
2. 什么是组件化: UI界面的角度, 复用UI元素
3. vue实现组件化: .vue文件 template script style
4. react实现组件化: 一切都是js实现

### 开发团队
1. react facebook
2. vue 尤雨溪为主

### 社区方面
1. react 开源早
2. vue 进两年

## 生命周期
React生命周期主要包括三个阶段：初始化阶段、运行中阶段和销毁阶段，在React不同的生命周期里，会依次触发不同的钩子函数
### 组件的生命周期
- Mounting: 已插入真实 DOM
- Updating: 正在重新渲染
- Unmounting 已移除真实 DOM

### 初始化阶段

1. 设置组件的默认属性
2. 设置组件的初始化状态
3. componentWillMount() 组件即将被渲染到页面之前触发，此时可以进行开启定时器、向服务器发送请求等操作
4. render() 组件渲染
5. componentDidMount() 组件已经被渲染到页面中后触发：此时页面中有了真正的DOM的元素，可以进行DOM相关的操作

### 运行中阶段
1. componentWillReceiveProps() 组件接收到属性时触发
2. shouldComponentUpdate() 当组件接收到新属性，或者组件的状态发生改变时触发。组件首次渲染时并不会触发,一般我们通过该函数来优化性能：一个React项目需要更新一个小组件时，很可能需要父组件更新自己的状态。而一个父组件的重新更新会造成它旗下所有的子组件重新执行render()方法，形成新的虚拟DOM，再用diff算法对新旧虚拟DOM进行结构和属性的比较，决定组件是否需要重新渲染，无疑这样的操作会造成很多的性能浪费，所以我们开发者可以根据项目的业务逻辑，在shouldComponentUpdate()中加入条件判断，从而优化性能
3. componentWillUpdate() 组件即将被更新时触发
4. componentDidUpdate() 组件被更新完成后触发。页面中产生了新的DOM的元素，可以进行DOM操作

### 销毁阶段
1. componentWillUnmount() 组件被销毁时触发。这里我们可以进行一些清理操作，例如清理定时器，取消Redux的订阅事件等等。

## 全家桶

- Mobx 状态管理

## 安装

```shell
npm i -D react react-dom
```

## 初始化一个项目

```shell
npx create-react-app my-app
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