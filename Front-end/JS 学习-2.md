# js 学习

## 国际化时间

`new Date(Date.UTC(year, month - 1, date))`

## 事件委托

Element.matches() API

## 禁止网页滚动

```js
function preventPageScroll(active: boolean): void {
  if (active) {
    window.addEventListener('DOMMouseScroll', scrollingPreventDefault, false);
    window.addEventListener('wheel', scrollingPreventDefault, {
      passive: false,
    });
    window.addEventListener('mousewheel', scrollingPreventDefault, {
      passive: false,
    });
  } else {
    window.removeEventListener('DOMMouseScroll', scrollingPreventDefault);
    window.removeEventListener('wheel', scrollingPreventDefault);
    window.removeEventListener('mousewheel', scrollingPreventDefault);
  }
}

function scrollingPreventDefault(e: Event): void {
  e.preventDefault();
}
```

## 事件委托

```js
function delegate(element, eventType, selector, fn) {
  element.addEventListener(eventType, e => {
    let el = e.target
    while (!el.matches(selector)) {
      if (element === el) {
        el = null
        break
      }
      el = el.parentNode
    }
    el && fn.call(el, e, el)
  })
  return element
}
// 简化下, 不用递归, 直接通过li.contains(e.target);判断触点是否在li上(或内).
```

## curry

```js
// 主要思路是什么呢，要判断当前传入函数的参数个数 (args.length) 是否大于等于原函数所需参数个数 (fn.length) ，如果是，则执行当前函数；如果是小于，则返回一个函数。
const curry = (fn, ...args) => 
    // 函数的参数个数可以直接通过函数的.length属性来访问
    args.length >= fn.length // 这个判断很关键！！！
    // 传入的参数大于等于原始函数fn的参数个数，则直接执行该函数
    ? fn(...args)
    /**
     * 传入的参数小于原始函数fn的参数个数时
     * 则继续对当前函数进行柯里化，返回一个接受所有参数（当前参数和剩余参数） 的函数
    */
    : (..._args) => curry(fn, ...args, ..._args);

function add1(x, y, z) {
    return x + y + z;
}
const add = curry(add1);
console.log(add(1, 2, 3));
console.log(add(1)(2)(3));
console.log(add(1, 2)(3));
console.log(add(1)(2, 3));
```

## for of 和 for in

`for (variable of iterable)` of 遍历 Array String Map Set, 有迭代器对象的

in 遍历可枚举的, 循环的是下标, object.key


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