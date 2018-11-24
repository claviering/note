# TypeScript学习

## 安装
```
npm i -g typescripe
tsc helloworld.ts
```

## CSCode配置自动编译

1. `tsc --init` 生成`tsconfig.json` 改 `"outDir": ".js"`
2. Terminal -> Run Task -> tes: watch tsconfig.json

## 数据类型

- boolean
- number
- string
- array
- tuple
- enum
- any
- null undefined
- void
- never

let app: any = document.getElementBy('app') // 没有Object类型
let num: number | undefined // 定义变量没赋值
function run():void {} // 函数没返回值

## 函数

```js
function run(name:string, age:number): number {
    return 12
}
```

### 可选参数
参数后面加?,并且在参数列表的最后
```js
function run(name:string, age?:number): number {
    return 12
}
```

### 默认参数

```js
function run(name:string, age:number = 20): number {
    return 12
}
```

## 类

ES6中类似

### 定义属性的修饰符

- public
- private
- protected

```js
class Person{
    public name:string
}
```
### 多态

### 抽象类
```js
abstract class Animal{
    abstract eat():any
}
```
## 接口
```js
interface FullName(
    firstName:string;
    secondName?:string; // 可选接口
)
function printName(name:FullName){
    console.log(name.firstName)
}
```

## 函数接口
```js
interface encrypt {
    (key:string, value:string):string
}

var sha1:encrypt = function(){}
```
## 数组接口

```js
interface Arr{
    [index:number]:string
}
var myarr:Arr=['aa', 'bb']
myarr[0]
```
## 类接口
```js
interface Animal{
    name:string
    eat():void
}
class Dog implements Animal{}
```

## 接口拓展

```js
interface Animal{
    eat():void
}

interface Person extends Animal{
    work():string
}

class Web implements Person{
    eat()
    work()
}
```

## 泛型
```js
function getData<T>(value:T):T{
    return valur
}
getData<number>(123)
getData<string>('hello world')
```

泛型类
```js
class MinClass<T>{
    public list:T
}
```

泛型接口
```js
interface Config<T> {
    (value:T):T
}
function getData<T>(value:T):T{
    return valur
}
var myGetData:Config<string> = getData
```