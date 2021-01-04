# vue 3 学习

## Q: 为什么要使用 Composition API

A: 解决 VUE2 的局限性

## Q: VUE2 有什么局限性?

A: 3个方面

1. 可读性。使用 vue 2 创建组件时，随着组件越来越大，变得不易读不易维护。
2. 代码重用模式有缺点。当你夸组件重用代码片段时，在vue 2 中这些代码重用模式有它的缺点。
3. vue 2 对 typescript 的支持有限

### 深入第一个限制

逻辑、功能代码在 data 和 methods 中分离，不容易维护。props，data、computed、methods 分散。在 vue 3 中使用 Composition API，可以把逻辑代码放一起，更好维护。统一在 setup() 函数中。 setup() 函数是否很大？错。setup 中的函数可以在同一个文件中定义，但是不在 seup里面定义。也可以在外部文件定义，然后导入进来使用。

### 深入第二个限制：没有完美的方法可以夸组件重用代码

在 vue 2 里有3种方法可以重用代码

1. Mixins。优点：代码重用。缺点：命名冲突、关系不明确
2. 建立一个混合工厂。指定命名空间和配置。优点：代码重用，关系明确。缺点：弱命名空间、隐式属性添加、运行时无实例访问
3. 作用域插槽。优点：解决 Mixins 的问题。缺点：降低可读性、很多的配置、更少的灵活性、执行效率低

## Q: 在 VUE 3中如何实现代码复用

A: 使用 Compositon Function

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


