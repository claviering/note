# Vuex学习

## Actions
异步操作
```
export default {
    updateCointSync (store, data) {
        setTimeout()
    }
}
```
触发用dispatch
## Getter 计算属性

相当于vue中的computed
```
const store = new Vuex.Store({
  state: {
    todos: [
      { id: 1, text: '...', done: true },
      { id: 2, text: '...', done: false }
    ]
  },
  getters: {
    doneTodos: state => {
      return state.todos.filter(todo => todo.done)
    }
  }
})
```

### 通过属性访问

Getter 会暴露为 store.getters 对象，你可以以属性的形式访问这些值：
```
store.getters.doneTodos // -> [{ id: 1, text: '...', done: true }]
```

## Mutation

只能接受2个参数，第一个是state，第二个是对象
`increment(state, {one, two})`
函数的第一个参数一定要是state

更改 Vuex 的 store 中的状态的唯一方法是提交 mutation。
```
const store = new Vuex.Store({
  state: {
    count: 1
  },
  mutations: {
    increment (state) {
      // 变更状态
      state.count++
    }
  }
})
```

组件中使用
```
this.$store.commit(increment)
```
## dispatch
异步

## commit
同步

## vuex使用
npm install vuex --save
Vue.use(Vuex)



