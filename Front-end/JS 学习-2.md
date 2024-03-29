# js 学习

## 实在丝滑！原生视图转换动画 View Transitions API 了解一下~

document.startViewTransition

https://mp.weixin.qq.com/s/Xs143ON1nEiEYr6kt3fnXg

```js
if (document.startViewTransition) { // 如果支持就视图变换
  document.startViewTransition(() => { // 开始视图变换
    ev.target.remove()
  });
} else { // 不支持就执行原来的逻辑
  ev.target.remove()
}
```

为了让每个元素都有自己的过渡状态，这里需要给每个元素都指定名称

```css
.item {
  view-transition-name: item-1;
}
```

## 监听画布尺寸发生变化时，更新可视区域的位置

ResizeObserver

## canvas 性能优化

1. 绘制的图形的数量和大小会影响canvas的性能
2. 图形数量过多，但是只刷新部分 可以使用局部渲染
3. 逻辑层和背景图层分离 可以使用分层渲染
4. 某些长时间的逻辑影响主线程的， 可以使用离屏渲染 和webworker 来解决问题

另外补充下：

1. 减少canvas指令的调用可以提高性能，减少状态机的更新一样可以的，比如绘制1000个点，假设1000个点有10中颜色，可以根据颜色对图形进行分组，减少fillStyle等状态的变更（先把同一种颜色的绘制完，接着另一种颜色绘制），而不是每次都去改变fillStyle,当然其他的状态(strokeStyle等)也是一样的
2. 坐标可以取整，浮点坐标会导致canvas进行抗锯齿处理
3. clip最好少用，clip是个很昂贵的操作，局部渲染用bbox擦除和重绘即可

bbox: BoundingBox包围盒

## cdn jsdelivr 被墙

cdn.jsdelivr.net 换成了 fastly.jsdelivr.net

## 获取屏幕高宽
  
```js
  var width = window.innerWidth
  || document.documentElement.clientWidth
  || document.body.clientWidth;

  var height = window.innerHeight
  || document.documentElement.clientHeight
  || document.body.clientHeight;
```

## rem 适配

```js
  var html = document.getElementsByTagName('html')[0]; 
  //屏幕的宽度（兼容处理）
  var w = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth;
  //750这个数字是根据你的设计图的实际大小来的，所以值具体根据设计图的大小
  html.style.fontSize = w / 750 + "px";
```

## 获取浏览器存储空间

```js
setInterval(async () => {
  if (navigator.storage && navigator.storage.estimate) {
    const quota = await navigator.storage.estimate();
    const percentageUsed = (quota.usage / quota.quota) * 100;
    console.log(`You've used ${percentageUsed}% of the available storage.`);
    const remaining = quota.quota - quota.usage;
    console.warn('use: ', `${quota.usage / 1024 /1024}`);
    console.warn('remaining: ', `${remaining / 1024 /1024}`);
  }
}, 2000)
```

## 判断是否可以 JSON.parse

```js
function isJsonString(str: string) {
  try {
    if (typeof JSON.parse(str) == 'object') {
      return true
    }
  } catch (e) {
    return false
  }
}
```

## 高级 API 

1. MutationObserver 可以监听 DOM 结构变化
2. IntersectionObserver 了解某个元素是否进入了"视口"（viewport）
3. getComputedStyle 返回的都是 CSSStyleDeclaration 对象，和 element.style 不一样
4. getBoundingClientRect 返回元素的大小及其相对于视口的位置
5. requestAnimationFrame 告诉浏览器——你希望执行一个动画，并且要求浏览器在下次重绘之前调用指定的回调函数更新动画。

## 国际化时间

`new Date(Date.UTC(year, month - 1, date))`

## 事件委托

可以用到 svg 元素上

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
  return (args) => {
    clearTimeout(timer);
    let _args = args
    timer = setTimeout(()=> {
      func.apply(this, _args)
    }, time);
  }
}
// 节流
function throtte(func, time){
  let activeTime = 0;
  return (args) => {
    const current = Date.now();
    let _args = args
    if(current - activeTime > time) {
      func.apply(this, _args);
      activeTime = Date.now();
    }
  }
}
```