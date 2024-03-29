# React 学习

## 高级前端开发工程师

高级前端开发工程师：

1、使用react开发带给你哪些开发模式上的变化？
2、react组件中，数据如何在子父／兄弟节点中传输？
3、对于react通用组件设计中，如何设计能增加组件的通用性和灵活性？
4、基于react开发的项目，怎么做性能优化？用过light house吗？（怎么避免大量的dom渲染）
5、明白redux的工作原理么？能不能手写一个简单的redux
6、如何做react的工程化和自动化测试？

资深前端开发工程师：
1、如何根据业务逻辑合理构建应用数据结构，进而定制 状态机制 ？
2、如何在react项目工中，合理分配lib资源？

作者：柳丁Jason Chen
链接：https://www.zhihu.com/question/60548673/answer/179289819
来源：知乎
著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。

## Diff 算法

1. 对比不同类型的元素。当根节点为不同类型的元素时，React 会拆卸原有的树并且建立起新的树
2. 对比同一类型的元素。当对比两个相同类型的 React 元素时，React 会保留 DOM 节点，仅比对及更新有改变的属性
3. 对比同类型的组件元素。当一个组件更新时，组件实例保持不变
4. 对子节点进行递归。在子元素列表末尾新增元素时，更新开销比较小。如果只是简单的将新增元素插入到表头，那么更新开销会比较大。使用 Key 解决这个问题

## 在React中使用Context的两点注意事项

好好梳理Context的上下关系，把那些理论上不会变的放到最外面，把频繁会变的往里放。

## 多选select组件有多个时onChange如何知道是哪一个呢 

```js
<Select onChange={this.handleChange.bind(this, 'fieldname1')}> ... </Select>
<Select onChange={this.handleChange.bind(this, 'fieldname2')}> ... </Select>
```

## 强制更新

`this.forceUpdate();`

## Hook

函数组件有自己的 state, 同时还可以更新自己的 state

## react 生命周期

[Blog](https://github.com/YvetteLau/Blog/issues/3)

## Redux

当 React 有 Context 和 Hooks 时, 你真的还需要 Redux 吗

## 函数组件

    一个函数就是一个组件，return一份DOM解构
    特点：
    1. 没有生命周期，也会被更新并挂载，但是没有生命周期函数
    2. 没有this(组件实例）
    3. 没有内部状态（state）
    优点 ：轻量，如果你的组件没有涉及到内部状态，只是用来渲染数据，那么就用函数式组件，性能较好。

```js
// functional component
function Welcome(props) {
    return <h1>Hello, {props.name}</h1>;
}
```

## 代码分割

[参考](https://reactjs.org/docs/code-splitting.html)

```js
import("./math").then(math => {
  console.log(math.add(16, 26));
});
```

```js
React.lazy()
```

## react 中使用 函数防抖

```js
import react, { Component } from 'react';
import _ from 'lodash';

export default class Debounce extends Component {
  construtor() {
    super();
    this.callAjax = _.debounce(this.callAjax, 300);
  }
  
  callAjax = (value) => {
    console.log('value :: ', value);
    // call ajax
  }
  printChange(e) {
    e.persist();
    this.callAjax(e.target.value);
  }
  render() {
    return (
      <div>
        <input onChange={this.printChange} />
      </div>
    );
  }
}
```

## React.PureComponent VS React.Component

PureComponent: 纯组件, 调用 setState() 会调用 shouldComponentUpdate() 做浅比较, 性能更好

array数组的引用发生变化 PureComponent 才会 re-render

```js
const newArray = [].concat(array)
this.setState({array:newArray})
```

Component: 在调用 setState() 都会去 re-render 组件


## 表格大小
ant-design 大小设置 width

3个中文 170
6个中文 270
11个数字英文 160


## 16.6 版本更新

### lazy

```js
import React, {lazy, Suspense} from 'react';
const OtherComponent = lazy(() => import('./OtherComponent'));

function MyComponent() {
  return (
    <Suspense fallback={<div>Loading...</div>}>
      <OtherComponent />
    </Suspense>
  );
}
```

### React.memo

即浅比较props是否有变化，如果没有变化，就不重新渲染当前组件

```js
const FunctionalComponent = React.memo((props) => {
  // only render if props change
})

```

### getDerivedStateFromError()

组价出现错误时执行

componentDidCatch() 错误发生时的生命周期

意味着以后出现错误的时候，修改state应该放在这里去做，而后续收集错误信息之类的放到
componentDidCatch里面

## 添加环境变量

目录: 

`src/utils`

`export const api = process.env.REACT_APP_URL || http://example.com/api`

`src/`

开发环境

文件
`.env.development.local`
添加变量

process.env.REACT_APP_URL =  http://example.com/api

生产环境

`.env.production.local`
process.env.REACT_APP_URL =  http://example.com/api


## Prop 类型检测

`import PropTypes from 'prop-types'`

```js
Records.propTypes = {
  id: PropTypes.number
}
```

## 懒加载

`react-loadable`

```js
import { BrowserRouter as Router, Route, Switch } from 'react-router-dom';
import Loadable from 'react-loadable';

const Loading = () => <div>Loading...</div>;

const Home = Loadable({
  loader: () => import('./routes/Home'),
  loading: Loading,
});

const About = Loadable({
  loader: () => import('./routes/About'),
  loading: Loading,
});

const App = () => (
  <Router>
    <Switch>
      <Route exact path="/" component={Home}/>
      <Route path="/about" component={About}/>
    </Switch>
  </Router>
);
```

## 动画

`react-transition-group`

## 条件渲染

```js
{this.props.loginstate !== 1 && <Login />}	
{this.props.loginstate === 1 && <UserInfo />}
```

```js
function Greeting(props) {
  const isLoggedIn = props.isLoggedIn;
  if (isLoggedIn) {
    return <UserGreeting />;
  }
  return <GuestGreeting />;
}

ReactDOM.render(
  // 修改为 isLoggedIn={true} 试试:
  <Greeting isLoggedIn={false} />,
  document.getElementById('root')
);
```

## 组件中的函数

```js
onClick = { this.handleClick.bind(this) }
// 绑定 this, 函数中才能用到 this
```





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

或者
```js
const numbers = [1, 2, 3, 4, 5];
const listItems = numbers.map((number) =>
  <li key={number.toString()}>{number}</li>
);

ReactDOM.render(
  <ul>{listItems}</ul>,
  document.getElementById('root')
);
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
3. UNSAFE_componentWillMount() componentWillMount() 组件即将被渲染到页面之前触发，此时可以进行开启定时器、向服务器发送请求等操作
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