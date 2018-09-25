# ES7学习.md

## Object
### Object.values()

```js
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