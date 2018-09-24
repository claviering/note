# vue学习

## 深入响应式原理

**任何追踪变化**

当你把一个普通的 JavaScript 对象传给 Vue 实例的 data 选项，Vue 将遍历此对象所有的属性，并使用 `Object.defineProperty` 把这些属性全部转为 `getter/setter`

每个组件实例都有相应的 **watcher** 实例对象，它会在组件渲染的过程中把属性记录为依赖，之后当依赖项的 `setter` 被调用时，会通知 `watcher` 重新计算，从而致使它关联的组件得以更新。

**异步更新队列**

可能你还没有注意到，Vue **异步**执行 DOM 更新。只要观察到数据变化，Vue 将开启一个 **队列**，并缓冲在同一事件循环中发生的所有数据改变。如果同一个 watcher 被多次触发，只会被推入到队列中 **一次**。这种在缓冲时去除重复数据对于避免不必要的计算和 DOM 操作上非常重要。然后，在下一个的事件循环“tick”中，Vue 刷新队列并执行实际 (已去重的) 工作。Vue 在内部尝试对异步队列使用原生的 Promise.then 和 MessageChannel，如果执行环境不支持，会采用 setTimeout(fn, 0) 代替。

## computed 和 watch 差异

1. computed是计算一个新的属性，并且挂载到vm上, watch 是监听存在并且挂载到vm上的数据，所以watch可以监听computed计算属性的变化
2. computed是依赖变化就计算，watch是数据变化执行函数
3. 使用场景不同，computed 使用一个数据或者多个数据，watch适用一个数据影响多个数据

## tslint
Calls to 'console.log' are not allowed.

项目根目录的 tslint.json

```js
 {
    "rules": {
        "no-console": false
    }
}
```

## Vue使用TypeScript

```ts
import { Component, Prop, Vue, Watch } from 'vue-property-decorator'
import { State, Action, Mutation, namespace } from 'vuex-class'
import Toast from 'components/Toast.vue'

const userState = namespace('business/user', State)

@Component({
  components: { Toast },
})
export default class extends Vue {
  // data
  title = 'demo'

  @Prop({ default: '' })
  text: string

  // store
  @userState userId

  // computed
  get name (): boolean {
    return this.title + this.text
  }

  // watch
  @Watch('text')
  onChangeText () { }

  // hooks
  mounted() { }
}
```

### vue-property-decorator
[vue-property-decorator用法](https://github.com/kaorun343/vue-property-decorator)

Example

[github link](https://github.com/kaorun343/vue-property-decorator)

### vuex-class

[vuex-class](https://github.com/ktsn/vuex-class/)

**Example**

```js
import Vue from 'vue'
import Component from 'vue-class-component'
import {
  State,
  Getter,
  Action,
  Mutation,
  namespace
} from 'vuex-class'

const someModule = namespace('path/to/module')

@Component
export class MyComp extends Vue {
  @State('foo') stateFoo
  @State(state => state.bar) stateBar
  @Getter('foo') getterFoo
  @Action('foo') actionFoo
  @Mutation('foo') mutationFoo
  @someModule.Getter('foo') moduleGetterFoo

  // If the argument is omitted, use the property name
  // for each state/getter/action/mutation type
  @State foo
  @Getter bar
  @Action baz
  @Mutation qux

  created () {
    this.stateFoo // -> store.state.foo
    this.stateBar // -> store.state.bar
    this.getterFoo // -> store.getters.foo
    this.actionFoo({ value: true }) // -> store.dispatch('foo', { value: true })
    this.mutationFoo({ value: true }) // -> store.commit('foo', { value: true })
    this.moduleGetterFoo // -> store.getters['path/to/module/foo']
  }
}
```

## SSR

[vue-cli3](https://juejin.im/post/5b98e5875188255c8320f88a)

## vue中使用js-cookie
[js-cookie](https://github.com/js-cookie/js-cookie)
```
npm i js-cookie --save
const cookie = require('js-cookie')
cookie.set('name', 'value')
Cookies.remove('name')
```

## 跨级组件参数

provide inject关键词

## extends
继承组件
extends: components // 和data平级

## git commit前的代码规范检测
```
npm i husky -D
package.config添加
"precommit": "npm run lint-fix"
```

## eslint
`npm run lint` 语法检测
package.json文件添加
`"lint-fix": "eslint --fix --ext .js,.vue src test/unit test/e2e/specs",`
`npm run lint-fix`


## css热加载

使用vue-style-loader代替style-loader

## 异步组件，在使用的时候从服务器拿

```
const Foo from './Foo.vue'
component Foo
```
改造为
```
conponent: () => import('./Foo.vue')
```
就是导入的时候代码改变，其他不用改，还能结合[webpack的split-chunks-plugin插件使用](https://webpack.js.org/plugins/split-chunks-plugin/)


## 修改Vue上js，css代码路径问题
修改 `config -> index.js -> build ->  assetsPublicPath: '/',`

把`assetsPublicPath: '/',`改为上线中的目录`assetsPublicPath: 'app',`
在浏览器www.boo.com/app/index.html


## Vue生命周期视频详解

[Vue生命周期视频详解 P52](https://www.bilibili.com/video/av25294556/?p=52)

- beforeCreate
- created
- beforeMount
- Mounted
- beforeUpdate
- updated
- beforeDestroy
- destoryed

## vue学习
[网站](https://www.tutorialsplane.com/vue-js-close-window/)

## ES6创建模板
```html
<div id="app">
   <my-checkbox></my-checkbox>
</div>
```
```main.js
Vue.component('my-checkbox', { 
  template: ` 
    <div class="checkbox-wrapper" @click="check"> 
      <div :class="{ checkbox: true, checked: checked }"></div> 
      <div class="title">{{title}}</div> 
    </div> 
    `, 
    data () { 
      return { 
        checked: false, 
        title: 'Check me' 
      } 
    }, 
    methods: { 
      check() { 
        console.log('hello')
        this.checked = !this.checked;
      } 
    } 
  })
let app = new Vue({
  el: '#app'
})
```

## x-template创建vue组件
```html
  <body>
      <script type="text/x-template" id="checkbox-template">
      <div class="checkbox-wrapper" @click="check">
        <div :class="{ checkbox: true, checked: checked }"></div>
        <div class="title">{{title}}</div>
      </div>
    </script>
    <div id="app">
      <my-checkbox></my-checkbox>
    </div>
  </body>
  <script src="js/main.js"></script>
```
```main.js
Vue.component('my-checkbox', {
  template: '#checkbox-template',
  data() {
    return {
      checked: false,
      title: 'Check me'
    }
  },
  methods: {
    check() {
      console.log('hello')
    }
  }
})
let app = new Vue({
  el: '#app'
})
```

## 父组件传值给子组件
父组件代码
```
<son v-bind:sentToSon="sentToSon"><son>
```
子组件代码

获取数据，直接this.sentToSon
```
export default {
  pros: ['sentToSon'], // 如果要把sentToSon的值保存到子组件data中，可以在html上使用v-models:vuale="sentToSon"
}
```

## methods 中参数event(可以简写e)的使用,html中使用$event传参
|属性|描述|
|--|--|
|currentTarget|返回其事件监听器触发该事件的元素|
|target|返回触发此事件的元素（事件的目标节点）|
```
@click="selectGame(index, $event)
methods: {
    selectGame: function (id, event) {
            console.log(event.currentTarget);
            console.log(event.target);
    }
}
```

## watch

```
watch: {
    '$route': {'getMyBank', immediate: true} // 路由有变化的时候执行
    'key': 'function', // key改变的时候执行function
    data: {
        handler () {
            console.log('something')
        },
        immediate: true
        deep: true // 对象里面的值
    }
},
immediate: true // 先执行一次
```

## Axios中的this

在response中不能使用vue的this，要在axios前面用let vueThis = this,后面再用 vueThis.function 调用vue中的函数,JS的this是一个很神奇的东西,好像的调用函数的时候才会这样，用this访问vue的data数据没事

## html上函数的传参数

@click="myfunction(param)"

## 忽略错误

在vue项目根目录的.eslintignore添加忽略文件/src/jquery-mobile-1.4.5/

## vue ui
[官方组件](https://github.com/vuejs/ui)


## 在vue里添加好看的lottie动画
[参考](https://juejin.im/post/5b626f9bf265da0faa368352)
[github](https://github.com/chenqingspring/vue-lottie)
安装
```
npm install --save vue-lottie
```
全局引入vue-lottie

在main.js引入并注册全局组件即可

```
import lottie from 'vue-lottie';
Vue.component('lottie', lottie)
```
## vue-router-then
在当前组件上获取路由组件的数据，不通过vuex
安装
```
npm install vue-router-then --save
import Vue from 'vue'
import router from './router'

import routerThen from 'vue-router-then'
routerThen.initRouter(router)
Vue.use(routerThen)
```

使用
```
<!-- buySomething.vue -->
<inputSelectedAddress v-model="item.addressID" v-model-link="'/select_address'"  placeholder="选择地址" /> 

<!-- selectAddress.vue -->
<template>
    <ul>
        <li @click="selectOneAddress(1)">北京路南广场东门101</li>
        <li @click="selectOneAddress(2)">上海城下水道左边202</li>
    </ul>
</template>
<script>
    methods:{
        selectOneAddress:function(addressID){
            this.$emit('input',addressID);
            this.$router.go(-1);
        }
    }
</script>
```
在绑定v-model的元素上使用v-model-link指令指向一个新页面
在新页面里用户互动之后，使用$emit触发一个input事件将数据传递回来即可更新v-model所对应的值。


## Vue 全站缓存
将 router-view 放置到 keep-alive 中，即可粗暴的实现所有路由页的缓存功能。
[参考](https://juejin.im/post/5b610f32e51d4519115d3e66)
```
<keep-alive><router-view class="transit-view"></router-view></keep-alive>
```
我们既希望填写一半进入下一页面时能保留填写的数据，我们又希望新进入的表单是一个全新的表单页。，
换句话说，回到上一个页面时使用缓存，进入下一个页面时不使用缓存，
再换句话说，所有页面都用缓存，只在后退（回到上一页）时移除当前页缓存，这样下一次前进（进入当前页）时因为没有缓存就自然使用全新页面，
也就是说，只要实现后退（回到上一页）时移除当前页缓存这个功能，就可以了。


## 修改npm包下载地址
npm i nrm -g
nrm ls 查看npm安装地址
npm use taobao 使用taobao下载npm的包

## 项目初始化
npm install vue-cli
vue init webpack my-project -y
cd my-project
npm install
npm run dev


### state
在 Vue 组件中获得 Vuex 状态
```
this.$store.state.value
```
mapState 辅助函数

当一个组件需要获取多个状态时候,可以使用 mapState 辅助函数帮助我们生成计算属性
```
// 在单独构建的版本中辅助函数为 Vuex.mapState
import { mapState } from 'vuex'

export default {
  // ...
  computed: mapState({
    // 箭头函数可使代码更简练
    count: state => state.count,

    // 传字符串参数 'count' 等同于 `state => state.count`
    countAlias: 'count',

    // 为了能够使用 `this` 获取局部状态，必须使用常规函数
    countPlusLocalState (state) {
      return state.count + this.localCount
    }
  })
}
```


### 提交载荷（Payload）

```
// ...
mutations: {
  increment (state, n) {
    state.count += n
  }
}
```

```
store.commit('increment', 10)
```

## 动态组件
```
<!-- 组件会在 `currentTabComponent` 改变时改变 -->
<component v-bind:is="currentTabComponent"></component>
```

## .sync 修饰符

## 在动态组件上使用 keep-alive

保存组件的操作
```
<!-- 失活的组件将会被缓存！-->
<keep-alive>
  <component v-bind:is="currentTabComponent"></component>
</keep-alive>
```

## 过渡 & 动画

进入/离开 & 列表过渡
[vue官网](https://cn.vuejs.org/v2/guide/transitions.html)

### 过渡的类名
1. v-enter：定义进入过渡的开始状态。在元素被插入之前生效，在元素被插入之后的下一帧移除。

2. v-enter-active：定义进入过渡生效时的状态。在整个进入过渡的阶段中应用，在元素被插入之前生效，在过渡/动画完成之后移除。这个类可以被用来定义进入过渡的过程时间，延迟和曲线函数。

3. v-enter-to: 2.1.8版及以上 定义进入过渡的结束状态。在元素被插入之后下一帧生效 (与此同时 v-enter 被移除)，在过渡/动画完成之后移除。

4. v-leave: 定义离开过渡的开始状态。在离开过渡被触发时立刻生效，下一帧被移除。

5. v-leave-active：定义离开过渡生效时的状态。在整个离开过渡的阶段中应用，在离开过渡被触发时立刻生效，在过渡/动画完成之后移除。这个类可以被用来定义离开过渡的过程时间，延迟和曲线函数。

6. v-leave-to: 2.1.8版及以上 定义离开过渡的结束状态。在离开过渡被触发之后下一帧生效 (与此同时 v-leave 被删除)，在过渡/动画完成之后移除。

用transition标签包含过渡动画的组件，用myname替换上面的v

myname-enter,myname-leave
```
<transitaion name="myname">
</transition>
```
过渡生效时的属性是CSS属性的那些，left,opacity,width,height.color等

## 在开发环境图片现在，build之后不显示,打包app不显示

打开build/utils.js
publicPath: '../../',  添加上这个
```
    // Extract CSS when that option is specified
    // (which is the case during production build)
    if (options.extract) {
      return ExtractTextPlugin.extract({
        use: loaders,
        publicPath: '../../',  添加上这个
        fallback: 'vue-style-loader'
      })
    } else {
      return ['vue-style-loader'].concat(loaders)
    }
  }
```