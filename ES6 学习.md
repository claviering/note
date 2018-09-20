# ES6 学习
[toc]

## decorator

## ES5 模拟 ES6 Class

没使用new来调用构造函数时，也要抛出一个错误，那么我们会想到类的校验方法

```js
// * 1.声明一个类的校验方法
// *   参数一：指向的构造函数
// *   参数二：被调用时，this的指向
function _classCallCheck(constructor,instance) {
  // * 2.如果这个instance指向的不是constructor的话，意味着不是通过new来调用构造函数
  if(!(instance instanceof constructor)){
    // * 3.不满足时，则抛出异常
    throw TypeError("Class constructor Child cannot be invoked without 'new'")
  }
}

let Child = (function(){
  function Child(){
    // * 4.在调用该构造函数的时候，先执行以下类的校验方法
    _classCallCheck(Child,this)
  }
  return Child
})()

// 不通过new调用时，会报错
Child() // 报错 Class constructor Child cannot be invoked without 'new'

```

## 实现双向数据绑定

2种实现方法

### Object.defineProperty

```js
// 需要注意的是，当使用get set时，则不能使用value和writable
let obj = {}
let str
Object.defineProperty(obj,'name',{
    enumerable:true,
    configurable:true, 
    get(){ // 读，当我们读取时，则会执行到get，比如obj.name
        // return 'swr' // 当我们obj.name进行读取时，会返回'swr'
        return str
    },
    set(newValue){ // 写，当我们写入时，则会执行到set，比如obj.name = 'swr'
                   // 并且会把newValue作为参数传进去
        str = newValue
    }
})
```

### Proxy
Proxy代理也可以进行数据劫持，但是和Object.defineProperty不同的是，Proxy是在数据外层套了个壳，然后通过这层壳访问内部的数据，目前Proxy支持13种方式

Proxy，我的理解是在数据外层套了个壳，然后通过这层壳访问内部的数据

```js
let dog = {
  name:"小黄",
  firends:[{
    name:"小红"
  }]
}

// 1.首先new一个Proxy对象
let proxy = new Proxy(dog,{ // 2.参数一为需要代理的数据，参数二为上图可以代理的13种的配置对象
    get(target,property){ // 3.参数1为上面dog对象，参数2为dog的属性
        console.log('get被监控到了')
        return target[property]
    },
    set(target,property,value){ // 4.参数1为上面dog对象，参数2为dog的属性，参数3为设置的新值
                                // 有点类似Object.defineProperty
        console.log('set被监控到了')
        target[property] = value
    }
})

// 那么接下来我们设置一下这个属性
// dog.name = '小红'  // set值时，发现不会打印 'set被监控到了'
// dog.name // get值时，发现不会打印 'get被监控到了'

// 思考：为什么在set/get值的时候不会打印出来我们需要的东西呢？

// 上面说得很明白了，proxy相当于是一个壳，代理我们需要监控的数据，也就是我们要通过proxy来访问内部数据才会被监控到

proxy.name = '小红' // 打印输出 'set被监控到了'
proxy.name // 打印输出 'get被监控到了'

```

[ES6入门电子版](http://es6.ruanyifeng.com/)

## Symbol
## 对象拓展
```
属性简写
{x: x, y: y}
等价于{x, y}
方法简写
method: function () {}
method () {}
```
```js
// 那么我们该怎样实现深度的数据劫持呢？
let dog = {
  name:"小黄",
  firend:{
    name:"小红"
  }
}

// 我们首先写一个set方法，希望是通过这样来调用
set(dog.firend,funtion(obj){
    console.log(obj) // { name:"小红" }  回调函数中的obj代表的是dog.firend的对象
})
```
```js
// 实现
let dog = {
  name:"小黄",
  firend:{
    name:"小红"
  }
}

function set(obj,callback){
    let proxy = new Proxy(obj,{
        set(target,property,value){
            target[property] = value
        }
    })
    // 最后把proxy传给我们的回调函数
    callback(proxy)
}

set(dog.firend,function(obj){
    console.log(obj) // { name:"小红" } 实际就是从set函数中传出来的proxy对象
})

```


## 数组的拓展
拓展运算符...
### 合并数组
```
let arr1 = []
let arr2 = []
[...arr1, ...arr2]
```
### Array.from
将对象转为真正的数组

### Array.of()

将一组值转为数组
Array.of(1,2,3,4,5)
### copyWithin()

数组复制

### find()
找出第一个符合条件的成员，参数是一个回调函数
```
[1,2,3,3,-5].find((n) => n > 0) // -5
```

### fill()
使用给定值填充数组

### 数组实例 entries(), keys(), values()
```
for (let index of [].keys())
for (let index of [].values())
for (let [index, elem] of [].entries())
```
### includes()
数组是否包含给定值


## 函数拓展
### 默认参数
### 展开运算符

function add(...values)
  for (let val of values)
    sum += val
### 箭头函数
```
() => {}
参数 => 返回值(只有一行可以不用{})
```
箭头函数的this总是指向定义时所在的对象

## 数值拓展

### 二进制，八进制

```
0b111
0o767
```
转10进制
```
Number('0b111')
Number('0o10')
```
### Number.isFinite(),Number.isNaN()
判断是否有限，是否是NaN类型

### Number.parseInt(),Number.parseFloat()

字符串转数值

### Number.isInterger()

判断是否为整数，3和3.0被视为同一个值

### Number.EPSILON
一个极小的常数

### 安全整数和Number.isSafeinteger()
JavaScript表示的数值范围$(-2^{53}, 2^{53})$,最大最小值Number.MAX_SAFE_INTEGER,Number.MIM_SAFE_INTEGER
Number.isSafeinteger()判断一个整数是否在上面的范围中

### Math对象拓展

#### Math.trunc()

去除小叔部分

#### Math.sign()
判断一个数是正(返回1)，负(返回-1)，0(返回0)，-0(返回-0)

- Math.cbrt() 计算立方根
- Math.clz32() 返回二进制有多少个前导0
- Math.imul() 带符号的乘法
- Math.fround() 返回一个数的单精度形式
- Math.hypot($x_1$, $x_2$, ...) 返回所有参数的平方和的平方根
- Math.expm1(x) $e^{x}-1$
- Math.log1p(x) $ln(1+x)$
- Math.log10(x) $log_{10}(x)$
- Math.log2(c) $log_{2}(x)$

#### 指数运算

2 ** 4 === 16



## 字符串拓展
```
\u{20bb7} 码点放到大括号中
codePointAt() // 返回一个字符的码点
```
### 遍厉字符串
```
for (let codePoint of 'foo') {
    console.log(codePoint)
}
```

### at()
'string'.at(0)

### includes(), startsWith(), endsWith()

- includes(): 返回boolean,表示是否找到参数字符串
- startsWith(): 返回boolean,表示参数字符是否在源字符头部
- endsWith: 返回boolean,表示参数字符是否在源字符尾部

3个方法都支持第2个参数，表示搜索的开始位置

### repeat()

`'x'.repeat(3) // 'xxx'`
返回一个新字符串，重复n次

### padStart(), padEnd()

字符串补全功能
`x.padStart(5, 'ab') // ababx`
第一个参数是长度
第2个参数是用来补全的字符串
如果省略第2个参数，将会用空格补全

## 正则表达式拓展

```
var regex = /xyz/iuy
u修饰符，Unicode模式
y修饰符，粘连修饰符,和g修饰符区分开
```


## let 关键词

声明一个变量

## 块级作用域

变量在块级作用域使用let声明，不会外泄

## do表达式
```
let x = do{
    let t = f()
    t * t + 1
}
```
## const


