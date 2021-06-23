# js 学习


## 控制台输出控制样式

```js
console.log("%c%s",
            "color: red; background: yellow; font-size: 24px;",
            "警告！");
```

## 简单的发布/订阅模式

```js
const createEventHub = () => ({
  hub: Object.create(null),
  emit(event, data) {
    (this.hub[event] || []).forEach(handler => handler(data));
  },
  on(event, handler) {
    if (!this.hub[event]) this.hub[event] = [];
    this.hub[event].push(handler);
  },
  off(event, handler) {
    const i = (this.hub[event] || []).findIndex(h => h === handler);
    if (i > -1) this.hub[event].splice(i, 1);
    if (this.hub[event].length === 0) delete this.hub[event];
  }
});
```

用法

```js
const handler = data => console.log(data);
const hub = createEventHub();
let increment = 0;

// 订阅，监听不同事件
hub.on('message', handler);
hub.on('message', () => console.log('Message event fired'));
hub.on('increment', () => increment++);

// 发布：发出事件以调用所有订阅给它们的处理程序，并将数据作为参数传递给它们
hub.emit('message', 'hello world'); // 打印 'hello world' 和 'Message event fired'
hub.emit('message', { hello: 'world' }); // 打印 对象 和 'Message event fired'
hub.emit('increment'); // increment = 1

// 停止订阅
hub.off('message', handler);
```

## 交集，并集，差集

```js
    
// 并集
let union = [...new Set([...a, ...b])]; // [1,2,3,4]
    
// 交集
let intersect = [...new Set([...a].filter(x => b.has(x)))]; [2,3]
    
// 差集
let difference = Array.from(new Set([...a].filter(x => !b.has(x)))); [1]
```

## 监听键盘事件

```js
const node = document.getElementsByClassName("input1")[0];
node.addEventListener("keyup", function(event) {
    if (event.key === "Enter") {
        // Do work
    }
});
```

```js
<input type="text" placeholder="some text" class="search" onkeydown="search(this)"/>
function search(ele) {
    if(event.key === 'Enter') {
        alert(ele.value);        
    }
}
```

## 以指定的精度返回该数值对象的字符串表示

```js
// 以指定的精度返回该数值对象的字符串表示
(0.1 + 0.2).toPrecision(21)
=> "0.300000000000000044409"
(0.3).toPrecision(21)
=> "0.299999999999999988898"
```

## 函数柯里化

```js
// segmentfault 的@大笑平 补充的高颜值写法：
var curry = fn =>
    judge = (...args) =>
        args.length === fn.length
            ? fn(...args)
            : (arg) => judge(...args, arg)
```


## 删除 url 上面的参数

`history.replaceState(null, "", location.href.split("?")[0]);`

## 扁平一个多维数组

```js
var arr = [[1, 2, 8], [3, 4, 9], [5, 6, 10]];
var res = arr.reduce((x, y) => x.concat(y), []);

```

## 防抖, 节流

```js
// 防抖
function debounce(func, time) {
  let timer = null;
  return () => {
    clearTimeout(timer);
    timer = setTimeout(()=> {
      func.apply(this, arguments)
    }, time);
  }
}
// 节流
function throtte(func, time){
  let activeTime = 0;
  return () => {
    const current = Date.now();
    if(current - activeTime > time) {
      func.apply(this, arguments);
      activeTime = Date.now();
    }
  }
}
```