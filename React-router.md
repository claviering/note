# React router 学习

## 给路由组件传值
```js
tmpTodoList = () => (<TodoList store={ this.store }></TodoList>) // 先封装一次
<Route exact path="/" component={ this.tmpTodoList } />
```

## React Router页面传值的三种方法

### props.params

`<Route path='/user/:name' component={UserPage}></Route>`

### query 传递参数为明文

使用
```js
var data = {id:3,name:sam,age:36};
var path = {
  pathname:'/user',
  query:data,
}

<Link to={path}>用户</Link>
```
获取数据
```js
var data = this.props.location.state;
var {id,name,age} = data;
```
### state 方式类似于 post 方式
 
使用
```js
var data = {id:3,name:sam,age:36};
var path = {
  pathname:'/user',
  state:data,
}
<Link to={path}>用户</Link>
```
获取数据
```js
var data = this.props.location.state;
var {id,name,age} = data;
```


## 404 处理

```js
<Route path="/404" component={NoFind} />
<Redirect from='*' to='/404' />
```

## 下载
```sh
npm i -S react-router-dom
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
// 组件中的路由转跳
function show () {
  this.props.history.push(url)
}
```

或者

```js
// 整个页面转跳
import { BrowserRouter } from 'react-router-dom'
import { hashHistory } from 'react-router'
handelClick(id){
  hashHistory.push(url)
  BrowserRouter.push(url)
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
