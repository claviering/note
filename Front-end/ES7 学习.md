# ES7学习.md

## weakset

WeakSet 与 Set 的区别：

WeakSet 只能储存对象引用，不能存放值，而 Set 对象都可以

WeakSet 对象中储存的对象值都是被弱引用的，即垃圾回收机制不考虑 WeakSet 对该对象的应用，如果没有其他的变量或属性引用这个对象值，则这个对象将会被垃圾回收掉（不考虑该对象还存在于 WeakSet 中），所以，WeakSet 对象里有多少个成员元素，取决于垃圾回收机制有没有运行，运行前后成员个数可能不一致，遍历结束之后，有的成员可能取不到了（被垃圾回收了），WeakSet 对象是无法被遍历的（ES6 规定 WeakSet 不可遍历），也没有办法拿到它包含的所有元素


## await 并行执行

```js
let a1 = await p1
let a2 = await p2
let res1 = await a1
let res2 = await a2
```
```js
Promise.all([p1, p2])
```

在循环中并行 `await`

循环的是 `Promise` 数组

`for (promise of promises)`

## async await

```js
let p = new Promise((resolve, reject) => {
    resolve('ok')
})

// async 函数默认返回一个promise对象
async function getA () {
    // await 相当是一个语法糖，不用通过then方法
    await p; 
    console.log('ok 2') // 等待 await p 执行完再执行这行,将异步变成同步
}

getA().then((res) => {
    console.log(res)
    }).catch((err) => {
    console.log(err)
    })
```

## array
```js
array.includes()
for..in.. // (循环的是下标)
for..of.. // (循环的是值)
```
## Object
```js
const obj = { a: 5, b: 7, c: 9 };
for (const [key, value] of Object.entries(obj)) {
  console.log(`${key} ${value}`); // "a 5", "b 7", "c 9"
}

var string1 = "";
var object1 = {a: 1, b: 2, c: 3};

for (var property1 in object1) {
  string1 += object1[property1];
}

console.log(string1);
// expected output: "123"
```
### Object.values()

```js
for..in.. // (循环的是下标)
const cars = {BMW: 3, Tesla: 2, Toy: 1}
const vals = Object.values(cars)
console.log(vals) // [3,2,1]
for (const value of Object.values(obj)) {
  console.log(value); // 3 2 1
}
```

### Object.entries()
```js
for (const [key, value] of Object.entries(obj)) {
  console.log(`${key} ${value}`); // "a 5", "b 7", "c 9"
}
```

返回 `key` 和 `values`

## String
 
### String padding

字符填充
```js
'someString'.padStart(numberOfCharcters [,stringForPadding]); 
'5'.padStart(10) // '          5'
'5'.padStart(10, '=*') //'=*=*=*=*=5'
'5'.padEnd(10) // '5         '
'5'.padEnd(10, '=*') //'5=*=*=*=*='
```