# vue 3 学习

## Q: 如何实现响应式原理

A: 使用 Proxy 劫持 get 和 set。在 get 中追踪依赖 (track)，在 set 中触发更新 (trigger). 

## Q: Proxy 只能实现一层的代理，如何实现嵌套代理

A: 在 createGetter 中的 Reflect.get() 中实现递归。因为 Reflect.get() 会返回下一层对象

```js
function createGetter(isReadonly = false, shallow = false) {
  const res = Reflect.get(target, key, receiver)
   if (isObject(res)) {
      // Convert returned value into a proxy as well. we do the isObject check
      // here to avoid invalid value warning. Also need to lazy access readonly
      // and reactive here to avoid circular dependency.
      return isReadonly ? readonly(res) : reactive(res)
    }
    return res
}
```


