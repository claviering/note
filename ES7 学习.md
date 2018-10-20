# ES7学习.md

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
```
### Object.values()

```js
for..in.. // (循环的是下标)
const cars = {BMW: 3, Tesla: 2, Toy: 1}
const vals = Obj.values(cars)
console.log(vals) // [3,2,1]
```

### Object.entries()

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