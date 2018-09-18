# vue-router学习

## beforeRouterEnter获取组件内的数据
```js
beforeRouterEnter (to ,from , next) {
    next( vm => {
        console.log(vm.data)
    })
}
```
## 动态路由
```js
path: '/app/:id'

router-link :to="/app/id"
```
## children
```js
children: {
    path: '',
    component: component
}
```
##  meta
```js
meta: {
    title: 'this is title',
    descripation: 'some descripation'
}
```
## 路由滚动保存位置
```js
scrollBehavior (to, from ,savePosition){
    if (savePosition) {
        return savePosition
    } else {
        return {x: 0, y: 0}
    }
}
```
## 路由模式
```js
new router({
    router,
    mode: 'history', // url没有#开头
    base: '/base/' // url上加上base
})
```

使用history的时候，每个url都会请求到服务器，服务器要做配置，不然会404，
webpack-dev-server里配置historyApiFallback:{
    index: '/index.html'
}

在vue-cli的webpack-dev-config.js有配置了

## 注册全局钩子用来拦截导航
```js
// 注册全局钩子用来拦截导航
router.beforeEach((to, from, next) => {
  let token = window.localStorage.getItem('token')
  if (to.meta.requiresAuth) {
    if (token) {
      next()
    } else {
      loginOut()
      next({
        path: '/login'
      })
    }
  } else {
    next()
  }
})
```


## router.replace()
和router.push()很像，但它不会向 history 添加新记录

## 路由缓存

```html
<keep-alive>      
    <router-view v-if="$route.meta.keepAlive"/>    
</keep-alive>
```
这里是根据路由中的meta源信息中的keepAlive字段来判断当前路由组件是否需要缓存。这里的meta的keepAlive是我们自定义的，当然你也可以叫别的名字。
```js
// list是我们的搜索结果页面
{      
    path: '/list',  
    name: 'List',      
    component: resolve => require(['@/pages/list'], resolve),    
    meta: {        
        isUseCache: false,  // 这个字段的意思稍后再说      
        keepAlive: true  // 通过此字段判断是否需要缓存当前组件  
    }    
},
```

## vue-router 会到上一个路由组件
```js
this.$router.go(-1);
```

## vue-router传参数
父组件
```js
    viewDetail (newsID) {
      this.$router.push({
        path: '/newsDetail',
        query: {id: newsID}
      })
      
    viewDetail (newsID) {
      this.$router.push({
        path: '/newsDetail',
        params: {id: newsID}
      })
```

子组件
```js
this.id = this.$route.query.id // url显示参数
this.id = this.$route.params.id /// url不显示参数
```



