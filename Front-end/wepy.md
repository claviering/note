# wepy

微信小程序框架使用

安装，直接看官网

入口 app.wpy

## 引入外部样式 wxss
不能用 alias @ 符号, 使用相对路径
```less
<style lang="less">
@import './style/weui.wxss';
</style>
```

## 路由

函数试路由转跳, 默认从 pages 开始

```js
wepy.navigateTo({
  url: '/pages/router1'
})
```

config 中配置路由

```js
config = {
  // 定义路由
  pages: [
    // 'pages/index',
    'pages/router1',
    'pages/router2',
    'pages/me',
    'pages/example'
  ]
}
```


## store
设置 store 里的值

方法一:

```js
import { connect } from 'wepy-redux'
@connect({
  userInfo (state) {
    return state.userInfo
  }
}, {
  setInfo: SETINFO
})
// 组件内部
onLaunch() {
  this.methods.setInfo(res)
}
```

方法二:

```js
import { setStore } from 'wepy-redux'
import configStore from './store'
import { SETINFO } from '@/store/types/userInfo'

const store = configStore()
setStore(store)
// 组件内部
onLaunch() {
  store.dispatch({ type: SETINFO, payload: res })
}
```