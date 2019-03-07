# wepy

微信小程序框架使用

安装，直接看官网

入口 app.wpy

开发实时编译
`wepy build --watch`

开发工具打开 dist 目录

## 跳转 tabBar

```js
wx.switchTab({
  url: '../../pages/category/category
})
```

## 组件定义

根页面
`export default class extends wepy.app {}`
普通页面
`export default class extends wepy.page {}`
自定义组件
`export default class extends wepy.component {}`

## 组件

组件的循环渲染传值 `:item="item"`

静态传值 `title="mytitle"`

动态传值 `:src="src"` 子组件 初始化 `String`

```js
props = {
  src: String,
}
```

```js
<repeat for="{{chatList}}" key="index" index="index" item="item">
  <myMessage :src="src" title="mytitle" :item="item"></myMessage>
</repeat>
```

## 列表渲染 循环渲染

```js
<repeat for="{{chatList}}" key="index" index="index" item="item">
  <navigator url="" class="weui-media-box weui-media-box_appmsg" hover-class="weui-cell_active">
      <view class="weui-media-box__hd weui-media-box__hd_in-appmsg chat-avatar">
          <image class="weui-media-box__thumb" src="{{src}}" />
      </view>
      <view class="weui-media-box__bd weui-media-box__bd_in-appmsg">
          <view class="weui-media-box__title">{{item.sender}}</view>
          <view class="weui-media-box__desc">{{item.msg}}</view>
      </view>
  </navigator>
</repeat>
```

## 条件渲染

```js
<view wx:if="{{ case01 }}"></view>
<view wx:elif="{{ case02 }}"></view>
<view wx:else></view>
```

## 点击触发的类

`hover-class="weui-cell_active"`

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

组件试转跳

设置 url 的值
```js
<navigator url="../pages/chat">
</navigator>
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