# ES6 学习
[toc]


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


