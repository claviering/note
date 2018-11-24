# Redux 学习

## redux 插件
redux-thunk 异步插件

`npm i -S redux-thunk`

## 文件结构

src
|--Redux
  |--actions.js // 具体 action 操作
  |--action-type.js // action 的类型
  |--store.js // 生成 store 对象
  |--reducers.js // createStore() 的参数

## 使用
```js
getState() // 获取 store 内容
subscribe() // 监听 store 变化
dispatch() // 提交修改
```
## Redux

1. 状态管理的 js 库
2. 集中管理组件共享状态

## 安装
`npm i -S redux`

## react- redux

### 调试工具

`npm i -D redux-devtool-extension`

```js
import { composeWithDevTools } from 'redux-devtool-extension'
const store = createStore(
  counter,
  composeWithDevTools(applyMiddleware(thunk))
)
```