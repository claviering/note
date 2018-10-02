# Redux 学习

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