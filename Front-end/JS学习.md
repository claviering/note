# JS学习

## createObjectURL, revokeObjectURL

```js
var blob = new Blob([arrayBufferWithPNG], {type: "image/png"}),
    url = URL.createObjectURL(blob),
    img = new Image();

img.onload = function() {
    URL.revokeObjectURL(this.src);     // clean-up memory
    document.body.appendChild(this);   // add image to DOM
}

img.src = url;                         // can now "stream" the bytes
```

## MutationObserver 监听DOM节点变化

https://segmentfault.com/a/1190000023707760

## 如何判断图片是否在可视区域中？

原生js判断元素是否在可视区域内，这里的可视区域的距离都是以垂直距离为准

方法一：

A: document.documentElement.clientHeight 可视窗口的高度

B: element.offsetTop dom相对于文档顶部的距离

C: document.documentElement.scrollTop 滚动条滚动的距离

B - C < A 即说明元素在可视区域内

方法二：getBoundingClientRect

const domObj = element.getBoundingClientRect();

domObj.top：元素上边到视窗上边的距离;

domObj.right：元素右边到视窗左边的距离;

domObj.bottom：元素下边到视窗上边的距离;

domObj.left：元素左边到视窗左边的距离;

const clientHeight = window.innerHeight;

当 domObj.top < clientHeight 表示dom在可视区域内了

链接：https://juejin.im/post/6844903760695656455

## wx.agentConfig is not a function

1. html 中引入 https://res.wx.qq.com/open/js/jweixin-1.2.0.js
2. html 中引入 https://res.wx.qq.com/wwopen/js/jsapi/jweixin-1.0.0.js
3. config的时候jsApiList包含agentConfig，使用wx.invoke('agentConfig')进行调用即可

```js
wx.config({
    beta: true, // 这个官方文档说要为true
    debug: true,
    appId: '',
    timestamp: '',
    nonceStr: '',
    signature: '',
    jsApiList: ['agentConfig', ....]
});

wx.ready(function(res: any) {
    wx.checkJsApi({
        jsApiList: [],
       success: function (res: any) {
          return;
       },
    });

    wx.invoke(
        'agentConfig',
        {
          agentid:  '',  // 这个格式为字符串
          corpid: '',
          timestamp:'',
          nonceStr: '',
          signature: '',
          jsApiList: [],
        },
        function (res: any) {
          return;
        },
     );
})
```


## 键盘

```js
// 判断设备类型
var judgeDeviceType = function () {
  var ua = window.navigator.userAgent.toLocaleLowerCase();
  var isIOS = /iphone|ipad|ipod/.test(ua);
  var isAndroid = /android/.test(ua);

  return {
    isIOS: isIOS,
    isAndroid: isAndroid
  }
}()

// 监听输入框的软键盘弹起和收起事件
function listenKeybord($input) {
  if (judgeDeviceType.isIOS) {
    // IOS 键盘弹起：IOS 和 Android 输入框获取焦点键盘弹起
    $input.addEventListener('focus', function () {
      console.log('IOS 键盘弹起啦！');
      // IOS 键盘弹起后操作
    }, false)

    // IOS 键盘收起：IOS 点击输入框以外区域或点击收起按钮，输入框都会失去焦点，键盘会收起，
    $input.addEventListener('blur', () => {
      console.log('IOS 键盘收起啦！');
      // IOS 键盘收起后操作
    })
  }

  // Andriod 键盘收起：Andriod 键盘弹起或收起页面高度会发生变化，以此为依据获知键盘收起
  if (judgeDeviceType.isAndroid) {
    var originHeight = document.documentElement.clientHeight || document.body.clientHeight;

    window.addEventListener('resize', function () {
      var resizeHeight = document.documentElement.clientHeight || document.body.clientHeight;
      if (originHeight < resizeHeight) {
        console.log('Android 键盘收起啦！');
        // Android 键盘收起后操作
      } else {
        console.log('Android 键盘弹起啦！');
        // Android 键盘弹起后操作
      }

      originHeight = resizeHeight;
    }, false)
  }
}

var $inputs = document.querySelectorAll('.input');

for (var i = 0; i < $inputs.length; i++) {
  listenKeybord($inputs[i]);
}

```

## cssText 操作 css

```js
var head= document.getElementById("head");
head.style.cssText="width:200px;height:70px;display:bolck";
```

## 在解构中使用别名

```js
const object = { number: 10 }

const { number } = object

// 使用别名
const { number: otherNumber } = object

console.log(otherNumber) //10
```

## 免费 CDN

[jsdelivr](https://www.jsdelivr.com/?docs=gh)

## 图片懒加载 JQ

```js
start()
$(window).on('scroll', function(){
 start()
})

function start(){
  //.not('[data-isLoaded]')选中已加载的图片不需要重新加载
 $('.datagrid img').not('[data-isLoaded]').each(function(){
   var $node = $(this)
   if( isShow($node) ){
     loadImg($node)
   }
 })
 }

//判断一个元素是不是出现在窗口(视野)
function isShow($node){
 return $node.offset().top <= document.body.clientHeight + document.documentElement.scrollTop
 }
//加载图片
 function loadImg($img){
//.attr(值)
//.attr(属性名称,值)
$img.attr('src', $img.attr('data-src')) //把data-src的值 赋值给src
$img.attr('data-isLoaded', 1)//已加载的图片做标记
}
```

## 还有一个更硬核点的，也是 axios 源码里所用到的，利用 promise 本身的链式调用来实现串行。

```js
const list = [1, 2, 3]
const square = num => {
  return new Promise((resolve, reject) => {
    setTimeout(() => {
      resolve(num * num)
    }, 1000)
  })
}
let promise = Promise.resolve()
function test(i = 0) {
  if (i === list.length) return
  promise = promise.then(() => square(list[i]))
  test(i + 1)
}
test()
```

## websocket 连接 pm2 负载均衡多次连接问题

配置 socket opstions

```js
opstions = {
  transports: ['websocket']
}
```

## 浏览器滚动行为

`scrollRestoration`

## this

“箭头函数”的this，总是指向**定义时所在的对象**，而不是运行时所在的对象。

所有的箭头函数都没有自己的this，都指向外层

## ie 不支持 html5 标签

使用 `document.createElement`, 再添加默认样式

## 1px

```html
<html>
  <head>
      <title>1px question</title>
      <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
      <meta name="viewport" id="WebViewport" content="initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no">        
      <style>
          html {
              font-size: 1px;
          }            
          * {
              padding: 0;
              margin: 0;
          }
          .top_b {
              border-bottom: 1px solid #E5E5E5;
          }

          .a,.b {
                      box-sizing: border-box;
              margin-top: 1rem;
              padding: 1rem;                
              font-size: 1.4rem;
          }

          .a {
              width: 100%;
          }

          .b {
              background: #f5f5f5;
              width: 100%;
          }
      </style>
      <script>
          var viewport = document.querySelector("meta[name=viewport]");
          //下面是根据设备像素设置viewport
          if (window.devicePixelRatio == 1) {
              viewport.setAttribute('content', 'width=device-width,initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no');
          }
          if (window.devicePixelRatio == 2) {
              viewport.setAttribute('content', 'width=device-width,initial-scale=0.5, maximum-scale=0.5, minimum-scale=0.5, user-scalable=no');
          }
          if (window.devicePixelRatio == 3) {
              viewport.setAttribute('content', 'width=device-width,initial-scale=0.3333333333333333, maximum-scale=0.3333333333333333, minimum-scale=0.3333333333333333, user-scalable=no');
          }
          var docEl = document.documentElement;
          var fontsize = 32* (docEl.clientWidth / 750) + 'px';
          docEl.style.fontSize = fontsize;
      </script>
  </head>
  <body>
      <div class="top_b a">下面的底边宽度是虚拟1像素的</div>
      <div class="b">上面的边框宽度是虚拟1像素的</div>
  </body>
</html>

```

## 获取页面性能指标

```js
const navTimes = performance.getEntriesByType('navigation')
```

## 元素在窗口中间

```js
// 开始动画的 scrollTop
// $('#imgWrapper') 放图片的容器，html 结构下面有
// offset 距离顶部距离
startOpen = $('#imgWrapper').offset().top - (window.innerHeight / 2 - $('#imgWrapper').height() / 2);

```

## 闭包

https://zhuanlan.zhihu.com/p/144538992

闭包是一个相对封闭的环境, 它跟外部环境隔绝, 不会被外部环境所影响, 也不会被回收.

闭包的作用就是, 读取和处理内部数据, 并使它们永远保存在内存中不被销毁.

缺点就是. 很耗内存

## 判断类型

```js
function typeOf (value) {
    return function (obj) {
        const toString = Object.prototype.toString;
        const map = {
            '[object Boolean]'	 : 'boolean',
            '[object Number]' 	 : 'number',
            '[object String]' 	 : 'string',
            '[object Function]'  : 'function',
            '[object Array]'     : 'array',
            '[object Date]'      : 'date',
            '[object RegExp]'    : 'regExp',
            '[object Undefined]' : 'undefined',
            '[object Null]'      : 'null',
            '[object Object]' 	 : 'object'
        };
        return map[toString.call(obj)] === value;
    }
}

var isNumber = typeOf('number');
var isFunction = typeOf('function');
var isRegExp = typeOf('regExp');

isNumber(0); // => true
isFunction(function () {}); // true
isRegExp({}); // => false

```

## 原型 原型链

1. 每个对象都有 __proto__ 属性，但只有函数对象才有 prototype 属性

## 刘海屏

```js
function deviceDetection() {
  const ua = navigator.userAgent
  let osVersion = ''
  let device = ''
  try {
    if (/android/i.test(ua)) {
      device = 'android'
      osVersion = ua.match(/Android\s+([\d.]+)/i)[0].replace('Android ', '')
    } else if (/ipad|iphone|ipod/i.test(ua)) {
      device = 'ios'
      osVersion = ua.match(/OS\s+([\d_]+)/i)[0].replace(/_/g, '.').replace('OS ', '')
    }
  } catch (err) {
    /* istanbul ignore next line */
    console.error(err)
  }
  return { osVersion, device }
}

// 判断是否为刘海屏
export function isFringe() {
  const { device } = deviceDetection()
  const { screen } = global
  return device === 'ios' && 
    ((screen.width === 375 && screen.height === 812) || (screen.width === 414 && screen.height === 896))
}
```

## 编辑页面上的任何文本

`document.body.contentEditable="true"`

## MutationObserver 监听 DOM 树变化

`MutationObserver`

## 事件冒泡

event.currentTarget始终是监听事件者，而event.target是事件的真正发出者

target = element that triggered event.

currentTarget = element that has the event listener.

## 慎用target="_blank"

https://juejin.im/post/5eb8ed20e51d454db55fb353

## 检测元素的可视状态或者两个元素的相对可视状态

https://juejin.im/post/5de5baf2518825235b095cbe

```js
// 观察者创建
this.observer = new IntersectionObserver(callback, options);

// 观察列表第一个以及最后一个元素
this.observer.observe(this.firstItem);
this.observer.observe(this.lastItem);
```

## 得到N天前日期
```js
function dateFormat(beforeDay){
  var t_nowDate = new Date();
  t_nowDate.setDate(t_nowDate.getDate() - beforeDay);
}
```

## 浏览器的恢复滚动行为

```js
if ('scrollRestoration' in history) {
    // 默认值为'auto'
    history.scrollRestoration = 'manual';
}
```

## 如何平滑滚动到页面顶部

```js
const scrollToTop = () => {
  const c = document.documentElement.scrollTop || document.body.scrollTop;
  if (c > 0) {
    window.requestAnimationFrame(scrollToTop);
    window.scrollTo(0, c - c / 8);
  }
}

// 事例
scrollToTop()

```

## 改变 this 的指向

- 使用 ES6 的箭头函数
- 在函数内部使用 _this = this
- 使用 apply、call、bind
- new 实例化一个对象

## 正则表达式判断日期

```js
// HH:mm:ss
var reg = new RegExp(/^(?:2[0-3]|[01][0-9]):[0-5][0-9]:[0-5][0-9]$/);
```

## 原型链解决 if else

```js
// 可以解决if...else if...简单的问题

Function.prototype.after = function (nextFn) {
  let self = this
  return function (...rest) {
    let code = self(...rest)
    if (code ==='next') {
      return nextFn(...rest)
    }
    return code
  }
}
// 重构原函数
function isAnswer1(type) {
  if (type === 1 ) {
    return '11'
  }
  return 'next'
}
function isAnswer2(type) {
  if (type === 2 ) {
    return '22'
  }
  return 'next'
}
function isAnswer3(type) {
  if (type === 3 ) {
    return '33'
  }
  return 'next'
}
let isAnswerFn = isAnswer1.after(isAnswer2).after(isAnswer3)
console.log(isAnswerFn(4));

```

## 交叉观察者 IntersectionObserver

`new IntersectionObserver(callback, options);`

子元素跟父元素发生交叉触发事件

[交叉观察者](https://mp.weixin.qq.com/s/uRMYrxaduPaMkc97Upjkqg)

[交叉观察者](https://juejin.cn/post/6844903993559220232)

### 图片懒加载

```js
let images = document.querySelectorAll("img.lazyload");

let observer = new IntersectionObserver(entries => {
  entries.forEach(item => {
    if (item.isIntersecting) {
      item.target.src = item.target.dataset.origin; // 开始加载图片
      observer.unobserve(item.target); // 停止监听已开始加载的图片
    }
  });
});

images.forEach(item => observer.observe(item));
```

### 触底

```html
<!-- 数据列表 -->
<ul>
  <li>index</li> // 多个li
</ul>

<!-- 参照元素 -->
<div class="reference"></div>
```

```js
new IntersectionObserver(entries => {
  let item = entries[0]; // 拿第一个就行，反正只有一个
  if (item.isIntersecting) console.log("滚动到了底部，开始请求数据");
}).observe(document.querySelector(".reference")); // 监听参照元素
```

### 吸顶

```html
<!-- 参照元素 -->
<div class="reference"></div>

<nav>我可以吸顶</nav>

```

```css
nav {
  &.fixed {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
  }
}

```

```js
let nav = document.querySelector("nav");
let reference = document.querySelector(".reference");

reference.style.top = nav.offsetTop + "px";

new IntersectionObserver(entries => {

  let item = entries[0];
  let top = item.boundingClientRect.top;

  // 当参照元素的的top值小于0，也就是在视窗的顶部的时候，开始吸顶，否则移除吸顶
  if (top < 0) nav.classList.add("fixed");
  else nav.classList.remove("fixed");

}).observe(reference);
```


## 检查横屏竖屏

```js
window.addEventListener("resize", ()=> {
if (window.orientation === 180 || window.orientation === 0) {
  // 正常方向或屏幕旋转180度
}
if (window.orientation === 90 || window.orientation === -90 ) {
  // 屏幕顺时钟旋转90度或屏幕逆时针旋转90度
}
});

```

## 如何将浮点数点左边的数每三位添加一个逗号，如12000000.11转化为『12,000,000.11』?

```js
function commafy(num){
  return num && num
    .toString()
    .replace(/(\d)(?=(\d{3})+\.)/g, function($1, $2){
      return $2 + ',';
  });
}
```

## 访问数组中元素

```
const colors = [];

let firstColor = 'white';
if (colors.length > 0) {
 firstColor = colors[0];
}

firstColor; // => 'white'

const colors = [];

const [firstColor = 'white'] = colors;

firstColor; // => 'white
```

## 计算2个日期相差的天数

```js
/** 
 * 计算2个日期相差的天数，不包含今天，如：2016-12-13到2016-12-15，相差2天 
 * @param startDateString 
 * @param endDateString 
 * @returns 
 */
function dateDiff(startDateString, endDateString) {
  var separator = "-"; //日期分隔符  
  var startDates = startDateString.split(separator);
  var endDates = endDateString.split(separator);
  var startDate = new Date(startDates[0], startDates[1] - 1, startDates[2]);
  var endDate = new Date(endDates[0], endDates[1] - 1, endDates[2]);
  return parseInt(Math.abs(endDate - startDate) / 1000 / 60 / 60 / 24); //把相差的毫秒数转换为天数   
}


/** 
 * 计算2个日期相差的天数，包含今天，如：2016-12-13到2016-12-15，相差3天 
 * @param startDateString 
 * @param endDateString 
 * @returns 
 */
function dateDiffIncludeToday(startDateString, endDateString) {
  var separator = "-"; //日期分隔符  
  var startDates = startDateString.split(separator);
  var endDates = endDateString.split(separator);
  var startDate = new Date(startDates[0], startDates[1] - 1, startDates[2]);
  var endDate = new Date(endDates[0], endDates[1] - 1, endDates[2]);
  return parseInt(Math.abs(endDate - startDate) / 1000 / 60 / 60 / 24) + 1; //把相差的毫秒数转换为天数   
}
```
## 计算当前日期的周数（第几周）

```js
// 计算当前日期的周数（第几周）
function getYearWeek(date) {
  date = new Date(date)
  var date2 = new Date(date.getFullYear(), 0, 1);
  var day1 = date.getDay();
  if (day1 == 0) day1 = 7;
  var day2 = date2.getDay();
  if (day2 == 0) day2 = 7;
  d = Math.round((date.getTime() - date2.getTime() + (day2 - day1) * (24 * 60 * 60 * 1000)) / 86400000);
  return Math.ceil(d / 7) + 1;
}
```

## 中文排序

```js
const arr = ["博","啊","吃","世","中","超"]
arr.sort((x,y)=>x.localeCompare(y, 'zh-CN'))
```

## JavaScript 8 种类型

## 为什么 typeof null === 'object'

null 代表的是所有引用类型的默认值

## new Data() 时区问题
```js
time = new Date()
time.setMinutes(time.getMinutes() + time.getTimezoneOffset() + 480);
```

## 可选链式调用

```js
if (db && db.user && db.user.name) 
  nameLength = db.user.name.length;

const nameLength = db?.user?.name?.length;
```

## moment 时区问题

`moment(value).utcOffset(8).format('YYYY-MM-DD HH:mm:ss')`

本地时间(北京时间) = UTC + 时区差, 时区差东为正，西为负。在此，把东八区时区差记为 +0800


## 多维数组转一维数组

```js
const deepFlatten = arr => [].concat(...arr.map(v => (Array.isArray(v) ? deepFlatten(v) : v)));
deepFlatten([1, [2], [[3], 4], 5]); // [1,2,3,4,5]
```

## 数组交集

```js
const similarity = (arr, values) => arr.filter(v => values.includes(v));
similarity([1, 2, 3], [1, 2, 4]); // [1,2]
```

## JS 对象转 url 查询字符串

```js
const objectToQueryString = (obj) => Object.keys(obj).map((key) => `${encodeURIComponent(key)}=${encodeURIComponent(obj[key])}`).join('&');
objectToQueryString({name: 'Jhon', age: 18, address: 'beijing'})
// name=Jhon&age=18&address=beijing
```

## 基于某个条件为对象设置属性, 动态属性

```js
const myObject = {... myProperty && {propName：myPoperty}};

let myProperty = 'Jhon'
const myObject = {...myProperty && {propName: myProperty}}; // {propName: "Jhon"}
let myProperty = ''
const myObject = {...myProperty && {propName: myProperty}}; // {}
```

## closest()

`document.closest()` 向上选择元素, 查询到父元素

## dataset()

获取标签上以"data-"为前缀的属性集合

```
<p data-name="蜘蛛侠" data-age="16"></p>
document.querySelector("p").dataset; // {name: "蜘蛛侠", age: "16"}
```

## contenteditable 可以使一个元素可以被用户编辑

`<p contenteditable>我是P元素，但是我也可以被编辑</p>`

## 获取元素空间信息

`getBoundingClientRect()`

## 监听网络变化

`online`

```
window.addEventListener("online", xxx);

window.addEventListener("offline", () => {
  alert("你断网啦！");
});
```

## contains()

判断指定元素是否包含了指定的子元素

## html 属性 speelcheck

拼写检查

## 获取设备的电池状态

```
navigator.getBattery().then(battery => console.log(battery));
// 返回
{
  charging, // 是否在充电
  chargingTime, // 充满电所需时间
  dischargingTime, // 当前电量可使用时间
  level, 剩余电量

  onchargingchange, // 监听充电状态变化
  onchargingtimechange, // 监听充满电所需时间变化
  ondischargingtimechange, // 监听当前电量可使用时间变化
  onlevelchange // 监听电量变化
}
```
## 使设备进行震动

```
// 震动一次
navigator.vibrate(100);

// 连续震动，震动200ms、暂停100ms、震动300ms
navigator.vibrate([200, 100, 300]);
```

## 监听页面可见性

在PC端标签栏切换、最小化会触发、在移动端程序切到后台会触发

```
document.addEventListener("visibilitychange", () => {
  console.log(`页面可见性：${document.visibilityState}`);
});
```

## 陀螺仪

deviceOrientation

陀螺仪，也就是设备的方向，又名重力感应，该API在IOS设备上失效的解决办法，将域名协议改成https；

## 视频加速

`document.getElementById("video").playbackRate = 10`

## 视频结束

`document.querySelector("video").dispatchEvent(new Event("ended"))`


## addEventListener 参数

```js
element.addEventListener('click', doSomething, {
    capture: false,
    once: true,
    passive: false
});
```

- capture：一个布尔值和useCapture参数一样
- once：一个布尔值，如果为true，表示事件只在目标元素上运行一次，然后被删除
- passive：一个布尔值，如果为true，表示函数不会调用preventDefault()，即使它包含在函数体中

## 通知控制

只能在 https 域名下使用

```
Notification.requestPermission(prem => {
  prem == "granted" // 同意
})
const notice = new Notification("通知标题", {
  body: "通知内容"
});
```

## 全屏

```
/**
 * @method launchFullScreen 开启全屏
 * @param {Object} elem = document.documentElement 作用的元素
 */
const launchFullScreen = (elem = document.documentElement) => {
  if(elem.requestFullScreen) {
    elem.requestFullScreen();
  } else if(elem.mozRequestFullScreen) {
    elem.mozRequestFullScreen();
  } else if(elem.webkitRequestFullScreen) {
    elem.webkitRequestFullScreen();
  }
}
/**
 * @method exitFullScreen 关闭全屏
 */
const exitFullScreen = () => {
  if (document.exitFullscreen) {
    document.exitFullscreen();
  } else if (document.mozCancelFullScreen) {
    document.mozCancelFullScreen();
  } else if (document.webkitCancelFullScreen) {
    document.webkitCancelFullScreen();
  }
}
```

## 监听用户手机设备的旋转方向变化

```
window.addEventListener("orientationchange", () => {
  document.body.innerHTML += `<p>屏幕旋转后的角度值：${window.orientation}</p>`;
}, false);
```

## 获取 DOM attribute

`e.target.getAttribute("attribute")`

```
window.addEventListener("deviceorientation", event => {
  let {
    alpha,
    beta,
    gamma
  } = event;

  console.log(`alpha：${alpha}`);
  console.log(`beta：${beta}`);
  console.log(`gamma：${gamma}`);
});
```

## 动态属性名

```js
const dynamic = 'email';
let user = {
    name: 'John',
    [dynamic]: 'john@doe.com'
}
console.log(user); // outputs { name: "John", email: "john@doe.com" }
```

## 有条件的对象属性

```js
nst getUser = (emailIncluded) => {
  return {
    name: 'John',
    surname: 'Doe',
    ...emailIncluded && { email : 'john@doe.com' }
  }
}

const user = getUser(true);
console.log(user); // outputs { name: "John", surname: "Doe", email: "john@doe.com" }

const userWithoutEmail = getUser(false);
console.log(userWithoutEmail); // outputs { name: "John", surname: "Doe" }
```

## 你不知道的 JSON API

[参考](https://juejin.im/post/5d15e1f4e51d45773e418abe)

JSON.stringify()

使用方法为 JSON.stringify(value, replacer?, space?)

JSON.parse()

使用方法 JSON.parse(text, reviver?)


## 日期格式化

`toLocaleDateString()` 格式化成 "2019/1/23"

## 日期比较

比较日期的前后，可以直接使用>, <, >= 和 <= 时行比较。

```js
const earlier = new Date(2019, 0, 26)
const later = new Date(2019, 0, 27)

console.log(earlier < later) // true
```

比较相等，可以getTime获取它们的时间戳，用时间戳进行比较。

```js
const isSameTime = (a, b) => {
  return a.getTime() === b.getTime()
}

const a = new Date(2019, 0, 26)
const b = new Date(2019, 0, 26)
console.log(isSameTime(a, b)) // true

```

## toFixed() 保留两位小数不要四舍五入

原来：保留 3 位，剪掉最后一位

`var clip = a => Number(parseFloat(a).toFixed(3).slice(0,-1))`

## 自动滚动元素

```js
var element = document.getElementById("box");

element.scrollIntoView();
element.scrollIntoView(false);
element.scrollIntoView({block: "end"});
element.scrollIntoView({behavior: "smooth", block: "end", inline: "nearest"});
```

## 金钱格式化

`(12345.67).toFixed(2).replace(/\d(?=(\d{3})+\.)/g, '$&,');  // 12,345.67`

## 数组对象转对象

```js
// [{key: key1, value: value1}, {key: key2, value: value2}, {key: key3, value: value3}]
// => {key1: valye, key2: value2, key3: value3}
var obj = list.reduce((obj, item) => (obj[item.key] = item.value, obj) ,{});
```

## RelativeTimeFormat

时间格式化，替代 moment.js

The Intl.RelativeTimeFormat object is a constructor for objects that enable language-sensitive relative time formatting.

## 是否为空对象

```js
const obj = {};
const flag = !Array.isArray(obj) && Object.prototype.toString.call(obj) && !Object.keys(obj).length;
// flag => true
```

## 前面补零

```js
const fillZero = (num, len) => num.toString().padStart(len, "0");
const num = fillZero(169, 5);
// num => "00169"
```

## 操作 URL 获取 url 参数

`URLSearchParams API`

```js
const paramsString = 'name=jawil&age=24';
const searchParams = new URLSearchParams(paramsString);
console.log(searchParams.get('name')); // jawil
```

## 如何阻止冒泡

冒泡型事件：事件按照从最特定的事件目标到最不特定的事件目标(document对象)的顺序触发

w3c的方法是e.stopPropagation()，IE则是使用e.cancelBubble = true

```js
//阻止冒泡行为 
function stopBubble(e) { 
//如果提供了事件对象，则这是一个非IE浏览器 
if ( e && e.stopPropagation ) 
    //因此它支持W3C的stopPropagation()方法 
    e.stopPropagation(); 
else 
    //否则，我们需要使用IE的方式来取消事件冒泡 
    window.event.cancelBubble = true; 
}

```

## 如何阻止默认事件

```js
//阻止浏览器的默认行为 
function stopDefault( e ) { 
    //阻止默认浏览器动作(W3C) 
    if ( e && e.preventDefault ) 
        e.preventDefault(); 
    //IE中阻止函数器默认动作的方式 
    else 
        window.event.returnValue = false; 
    return false; 
}

```

## JS 装逼

```js
// 创建过去七天的数组，如果将代码中的减号换成加号，你将得到未来7天的数组集合
// 创建过去七天的数组
let a = [...Array(7).keys()].map(days => new Date(Date.now() - 86400000 * days));

// 生成长度为11的随机字母数字字符串
// toString(36) 36 进制 10 个数字 + 26 个英文字母
// substring(2) 截取字符串 从位置 2 开始
let a = Math.random().toString(36).substring(2);
// 获取URL的查询参数
// ?foo=bar&baz=bing => {foo: bar, baz: bing}
// 参考 MDN replace 用法
q={};location.search.replace(/([^?&=]+)=([^&]+)/g,(_,k,v)=>q[k]=v);q;
// 随机更改数组元素顺序，混淆数组
// Math.random() - 0.5 一半几率 返回 True / False
(arr) => arr.slice().sort(() => Math.random() - 0.5)
// 生成随机十六进制代码 如：'#c618b2'
'#' + Math.floor(Math.random() * 0xffffff).toString(16).padEnd(6, '0');
// 这是一个臭名昭著的面试题，让你写出他的运行结果，受不了~
// 整除 5 输出 Buzz 整除 3 的 输出 Fizz
// 同时整除 5 和 3 的 输出 FizzBuzz 其他输出数字
for(i=0;++i<101;console.log(i%5?f||i:f+'Buzz'))f=i%3?'':'Fizz'
// 用字符串返回一个键盘图形
(_=>[..."`1234567890-=~~QWERTYUIOP[]\\~ASDFGHJKL;'~~ZXCVBNM,./~"].map(x=>(o+=`/${b='_'.repeat(w=x<y?2:' 667699'[x=["BS","TAB","CAPS","ENTER"][p++]||'SHIFT',p])}\\|`,m+=y+(x+'    ').slice(0,w)+y+y,n+=y+b+y+y,l+=' __'+b)[73]&&(k.push(l,m,n,o),l='',m=n=o=y),m=n=o=y='|',p=l=k=[])&&k.join`
`)()

```

## 数组扁平化

数组拆解: flat: [1,[2,3]] --> [1, 2, 3]

```js
Array.prototype.flat = function() {
    return this.toString().split(',').map(item => +item )
}
```

## 函数执行改变this

this 指向，其实就是要搞清楚 函数的运行环境，说人话就是，谁调用了函数
- obj.fn()，便是 obj 调用了函数，既函数中的 this === obj
- fn()，这里可以看成 window.fn()，因此 this === window

手动修改 this 指向

- call: fn.call(target, 1, 2)
- apply: fn.apply(target, [1, 2])
- bind: fn.bind(target)(1,2)

## 很稳的类型判断

```js
let class2type = {}
'Array Date RegExp Object Error'.split(' ').forEach(e => class2type[ '[object ' + e + ']' ] = e.toLowerCase()) 

function type(obj) {
    if (obj == null) return String(obj)
    return typeof obj === 'object' ? class2type[ Object.prototype.toString.call(obj) ] || 'object' : typeof obj
}
```

## assign

只是单层的深复制，多层的浅复制

深复制 JSON.parse(JSON.stringify(obj))

1. 具有循环引用的对象时，报错
2. 当值为函数、undefined、或symbol时，无法拷贝

## 柯里化（Curring, 以逻辑学家Haskell Curry命名)

[函数柯里化](https://www.codercto.com/a/54607.html)

函数柯里化在 JavaScript 中其实是高阶函数的一种应用，上篇文章我们简略介绍了高阶函数（可以作为参数传递，或作为返回值）。

理论知识太枯燥，来个生活小例子，"存款买房"（富二代绕道）。假设买房是我们存钱的终极目标。那么在买房前，存在卡里的钱（老婆本）就不能动。等到够钱买房了，钱从银行卡取出来，开始买买买。。。

函数柯里化就像我们往卡里存钱，存够了，才能执行买房操作，存不够，接着存。

## 循环

```js
//推荐
for(var i=items.length;i--;){
    //todo
}
//不推荐
for(var i=0,len=items.length;i<len;i++){
    //todo
}   
```

## Buffer

```js
let buf = Buffer.from('abc') // 61 62 63 Hex 编码
let buf = Uint8Array(buf) // 97 98 99 ASCII 编码
```

## 前端模块化

CommonJS

暴露模块：`module.exports = value` 或 `exports.xxx = value` 或 `module.exports = {}`

const xxx = require('./lib')

xxx 就等于 module.exports 或者 xxx 等于 exports

require('./lib') 就等于 module.exports 或者 require('./lib') 等于 exports

ES6

`import` 的名字代替 `export default`

```js
// 导出方式一
export default {
  name: (a, b) => a + b
}

// 导出方式二
export name = (a, b) => a + b

// 引入方式一
import module from 'moduleName'
// 引入方式二
import { name } from 'moduleName'

// 使用
module.name()
// 或者
name()
```

## 字符串转 ArrayBuffer

浏览器上直接用
```
let message = 'abc'
let enc = new TextEncoder();
return enc.encode(message) // Uint8Array(3) [97, 98, 99]
```

## 浏览器加密接口

> https://www.w3.org/TR/WebCryptoAPI/

> https://developer.mozilla.org/en-US/docs/Web/API/SubtleCrypto/verify


## 检查一个对象是否为空

`const isEmptyObj = object => !Object.getOwnPropertySymbols(object).length && !Object.getOwnPropertyNames(object).length`


## 移动端键盘出现问题

移动端底部input被弹出的键盘遮挡 `Element.scrollIntoView()` 把元素滚动到可视化区域

## 阻止事件冒泡

`e.stopPropagation()`

## 数字补零

```js
const addZero1 = (num, len = 2) => (`0${num}`).slice(-len)
const addZero2 = (num, len = 2) => (`${num}`).padStart(len , '0')
addZero1(3) // 03
addZero2(32,4)  // 0032
```

## 页面复制加版权

```js
document.addEventListener('copy', function(e) {
  setClipboardText(e);
});
```

## js 判断 iphone

```js
const isIphonex = () => {
  // X XS, XS Max, XR
  const xSeriesConfig = [
    {
      devicePixelRatio: 3,
      width: 375,
      height: 812,
    },
    {
      devicePixelRatio: 3,
      width: 414,
      height: 896,
    },
    {
      devicePixelRatio: 2,
      width: 414,
      height: 896,
    },
  ];
  // h5
  if (typeof window !== 'undefined' && window) {
    const isIOS = /iphone/gi.test(window.navigator.userAgent);
    if (!isIOS) return false;
    const { devicePixelRatio, screen } = window;
    const { width, height } = screen;
    return xSeriesConfig.some(item => item.devicePixelRatio === devicePixelRatio && item.width === width && item.height === height);
  }
  return false;
}

```

## _.get + filter

`_.get(newAdjustGrade.filter(it => it.key == status).pop(), 'value')`

## Object.create(null) 和 {} 的区别

```js
let n = Object.create(null) // 就是空
console.log(n)
let m = {}  // 继承了对象原型的空对象
console.log(m)
```

## 交换2个数
```js
let a = 1.11
let b = 2.22
[b, a] = [a, b]
```

## 虚拟列表优化长列表的原理

原理
用数组保存所有列表元素的位置, 只渲染可视区内的列表元素, 当可视区滚动时, 根据滚动的offset大小以及所有列表元素的位置, 计算在可视区应该渲染哪些元素

## 判断对象有没有属性

`Object.hasOwnProperty('key)`

## 数字格式化

`Number.toLocaleString()`

小数点后保留2位

`num.toFixed(2)`

## 正则表达式

```
验证手机号
以 1 开头，第二位数是 3/4/5/7/8 的 11 位手机号码：^1[3,4,5,7,8,9]\d{9}$
移动号码：^134[0-8]\d{7}$|^(?:13[5-9]|147|15[0-27-9]|178|1703|1705|1706|18[2-478])\d{7,8}$
电信号码：^(?:133|153|1700|1701|1702|177|173|18[019])\d{7,8}$
联通号码：^(?:13[0-2]|145|15[56]|176|1704|1707|1708|1709|171|18[56])\d{7,8}|$
```
正则.test(字符串) return true or false
字符串.search(正则) return index
字符串.match(正则) return array
字符串.replace(正则,新的字符串) return new string

## 窗口滚动到指定坐标

`window.scrollTo(x, y)`

## 排序数组对象

`objs.sort((a,b) => (a.key > b.key) ? 1 : ((b.key > a.key) ? -1 : 0))`

## 数组交集

```js
c = a ∩ b
c = a.filter(value => -1 !== b.indexOf(value));

```
## 数组补集
```js
c = a 和 b 补集 
c = a.filter(value =>  b.indexOf(value) < 0);
```
## 数组并集
```js
c = a ∪ b
c = [...new Set([...a, ...b])]
```

## 数组差集
```js
var a = [1,2,3,4,5]
var b = [2,4,6,8,10]
console.log("数组a：", a);
console.log("数组b：", b);
var sa = new Set(a);
var sb = new Set(b);
let minus = a.filter(x => !sb.has(x));

```

## 数组对象差集

```js
var a = [{key: 1}, {key: 2}];
var b = [{key: 1}];
let s = [...a].filter(x => [...b].every(y => y.key !== x.key))
console.log(s);
```

## 获取 url 参数

```js
// localhost:8080/#/?storeCode=666&storeName=name
function getUrlVars () {
    var vars = {};
    var parts = window.location.href.replace(/[?&]+([^=&]+)=([^&]*)/gi, function(m,key,value) {
        vars[key] = value;
    });
    return vars;
}
this.storeCode = getUrlVars()['storeCode']
this.storeName = decodeURI(getUrlVars()['storeName'])
```

## rem 适配

```js
function setRem () {
        let htmlRem = document.documentElement.clientWidth
        document.documentElement.style.fontSize = htmlRem/7.5 + 'px'
      }
setRem()

```

## 替换数组对象

```js
var stooges = [
            {label:1,value:1,placeCode: 'sh', stock_code: 40},
            {label:1,value:1,placeCode: 'sh', stock_code: 50},
            {label:1,value:1,placeCode: 'sz', stock_code: 60,status:1},
            {label:1,value:1,placeCode: 'sz', stock_code: 39,status:1}
        ];
var maps= new Map([['sh','沪'],['sz','深圳']]);
stooges = stooges.map(element =>{
    element.placeCode = maps.get(element.placeCode);
    return element;
});
console.log(stooges);
```

## 删除对象属性
```js
delete object.property 
delete object['property']
```

## js 深入

js 是单线程异步,多线程靠浏览器

有事件队列和执行栈

任务队列分为 macrotasks 和 microtasks, 而promise中的then方法的函数会被推入到microtasks队列中，而setTimeout函数会被推入到macrotasks

任务队列中，在每一次事件循环中，macrotask只会提取一个执行，而microtask会一直提取，直到microsoft队列为空为止,Promise的函数代码的异步任务会优先于setTimeout的延时为0的任务先执行.事件循环每次只会入栈一个macrotask,主线程执行完成该任务后又会检查microtasks队列并完成里面的所有任务后再执行macrotask的任务

```js
setTimeout(()=>{
    console.log('A');
},0);
var obj={
    func:function () {
        setTimeout(function () {
            console.log('B')
        },0);
        return new Promise(function (resolve) {
            console.log('C');
            resolve();
        })
    }
};
obj.func().then(function () {
    console.log('D')
});
console.log('E');

1. 首先 setTimeout A 被加入到事件队列中  ==>  此时macrotasks中有[‘A’]
2. obj.func()执行时，setTimeout B 被加入到事件队列中  ==> 此时macrotasks中有[‘A’，‘B’]
3. 接着return一个Promise对象，Promise 新建后立即执行 执行console.log('C'); 控制台首次打印‘C’
4. 然后，then方法指定的回调函数，被加入到microtasks队列，将在当前脚本所有同步任务执行完才会执行 ==>  此时microtasks中有[‘D’]
5. 然后继续执行当前脚本的同步任务，故控制台第二次输出‘E’
6. 此时所有同步任务执行完毕，如上所述先检查microtasks队列，完成其中所有任务，故控制台第三次输出‘D’
7. 最后再执行macrotask的任务，并且按照入队列的时间顺序，控制台第四次输出‘A’，控制台第五次输出‘B’
8. 输出 C E D A B

```

## 获取 url 参数

```js
var url_string = "http://www.example.com/t.html?a=1&b=3&c=m2-m3-m4-m5"; //window.location.href
var url = new URL(url_string);
var c = url.searchParams.get("c");
console.log(c);
```

## js 代码加上调试

代码中添加
```js
debugger
```
## 捕获，冒泡
捕获 向下

冒泡 向上

为一个web开发者，你可以选择是在捕获阶段还是冒泡阶段绑定事件处理函数，这是通过addEventListener()方法实现的，如果这个函数的最后一个参数是true，则在捕获阶段绑定函数，反之false，在冒泡阶段绑定函数
```js
element1.addEventListener('click',doSomething2,true)

element2.addEventListener('click',doSomething,false)
```

## `this`在javascript中是如何工作的

```js
var fullname = 'John Doe';
var obj = {
   fullname: 'Colin Ihrig',
   prop: {
      fullname: 'Aurelio De Rosa',
      getFullname: function() {
         return this.fullname;
      }
   }
};
console.log(obj.prop.getFullname()); // Aurelio De Rosa
var test = obj.prop.getFullname;
console.log(test()); // John Doe

// 在第一个`console.log()`调用中， `getFullname()`是作为`obj.prop`的函数被调用的。因此，这里的语境指向后者并且函数返回对象的 `fullname`属性。相反，当 `getFullname()` 被指定为test的变量，那个语境指向全局对象`(window)`。因为test相当于设置为全局对象的属性。因为这个原因，函数返回window的一个`fullname`属性，这在这个案例中是在代码片段中第一行设置的

```

## 垃圾回收

自动垃圾收集机制，它的原理其实很简单：

确定变量中有哪些还在使用，哪些已经不再使用，然后 **垃圾收集器**会按照固定的时间间隔去周期性的释放已经不再继续使用的变量所占的内存。

算法: 标记-清除 (除标记的对象外，所有对象都被删除)

## html上获取事件对象

`<li poetry='a' onclick="showDraw(this)">`

传参数 **this**

## 用变量获取对象的value

```js
function getPoetry (key) {
    let poetryList = {
        a: '1111'
    }
    return poetryList[key] // 不能用poetryList.key获取
}
```

## js类型检测
用法

`typeof(operand)` 或者 `typeof operand`

其他类型都可以正确检测，除了 `typeof null` // 返回 object

使用

`Object.prototype.toString`,都能正确返回  `[object,class]`, class是大写字母开头的类型，

用法

`Object.prototype.toString.call(operand)`

## 使用模板字符串

```
var name = `Your name is ${first} ${last}.`
```

## string转JSON

JSON.parse(string).data

## 判断是否为chrome浏览器
```js
function isChromeFirefox () {
  var isChrome = window.navigator.userAgent.indexOf('Chrome') !== -1
  var isFirefox = window.navigator.userAgent.indexOf('Firefox') !== -1
  if (!isChrome && !isFirefox) {
    alert('请使用最新版本的chrome浏览器或者Firefox浏览器打开')
    document.execCommand('stop')
  }
}
isChromeFirefox()
```

## confire

`global.confirm()` 窗口弹出提示
`result = window.confirm(message);`

可以在路由的`beforeRouterLeave`用,判断用户是否要离开页面

## JS中更好使用数组
- 使用 Array.includes 替代 Array.indexOf
如果我们仅需要知道数组中是否包含给定元素呢？这意味着只是是与否的区别，这是一个布尔问题（boolean question）。针对这种情况，我建议使用直接返回布尔值的 `Array.includes`。

- 使用 Array.find 替代 Array.filter
- 使用 Array.some 替代 Array.find
- 使用 Array.reduce 替代 Array.filter 与 Array.map 的组合

## 函数节流

函数节流是间隔时间执行，将高频操作优化成低频操作，单位时间内只触发第一次，并且计时结束后作出相应，滚动条事件 或者 resize 事件

lodash.js 的实现

```js
/**
 * 函数节流
 * @param fn 需要进行节流操作的事件函数
 * @param interval 间隔时间
 * @returns {Function}
 */
function throttle(fn, interval) {
  let enterTime = 0; //触发的时间
  let gapTime = interval || 500; //间隔时间，如果interval不传，则默认500ms
  return function () {
    let context = this;
    let backTime = new Date(); //第一次函数return即触发的时间
    if (backTime - enterTime > gapTime) {
      fn.call(context, arguments[0]); //arguments[0]是事件处理函数默认事件参数event call绑定当前page对象
      enterTime = backTime; //赋值给第一次触发的时间，这样就保存了第二次触发的时间
    }
  };
}

/**
 * 函数防抖
 * @param fn 需要进行防抖操作的事件函数
 * @param interval 间隔时间
 * @returns {Function}
 */
function debounce(fn, interval) {
  let timer;
  let gapTime = interval || 1000; //间隔时间，如果interval不传，则默认1000ms
  return function () {
    clearTimeout(timer);
    let context = this;
    let args = arguments[0]; //保存此处的arguments，因为setTimeout是全局的，arguments无法在回调函数中获取，此处为闭包。
    timer = setTimeout(function () {
      fn.call(context, args); //args是事件处理函数默认事件参数event  call绑定当前page对象
    }, gapTime);
  };
}

export default {
  throttle,
  debounce
}; //es6规范，如需CommonJS规范请自行修改
```

## 函数防抖

函数防抖就是法师发技能的时候要读条，技能读条没完再按技能就会重新读条。

```js
//模拟一段ajax请求
function ajax(content) {
  console.log('ajax request ' + content)
}

function debounce(fun, delay) {
    return function (args) {
        let that = this
        let _args = args
        clearTimeout(fun.id)
        fun.id = setTimeout(function () {
            fun.call(that, _args)
        }, delay)
    }
}
    
let inputb = document.getElementById('debounce')

let debounceAjax = debounce(ajax, 500)

inputb.addEventListener('keyup', function (e) {
        debounceAjax(e.target.value)
    })
```
## 添加，删除监听事件

```js
drag.addEventListener('mousedown', handler = function (e) {}, false)
drag.removeEventListener('mousedown', handler, false)
```
## URL编码，解码

`encodeURIComponent()`
`decodeURIComponent()`


## DOM操作
```js
var par=s.parentNode;   //得到s的父节点
document.createElement('img')
appendChild(DOM)
```

## 识别浏览器版本，操作系统
```js
alert(navigator.userAgent)
```
## 操作cookie

获取 cookie
```js
window.getCookie = function(name) {
  var match = document.cookie.match(new RegExp('(^| )' + name + '=([^;]+)'));
  if (match) return match[2];
}
```

```js
<script>
 //设置cookie
function setCookie(cname, cvalue, exdays) {
  var d = new Date()
  d.setTime(d.getTime() + (exdays*24*60*60*1000))
  var expires = "expires="+d.toUTCString()
  document.cookie = cname + "=" + cvalue + "; " + expires
}
//获取cookie
function getCookie(cname) {
  var name = cname + "="
  var ca = document.cookie.split(';')
  for(var i=0; i<ca.length; i++) {
    var c = ca[i]
     while (c.charAt(0)==' ') {
       c = c.substring(1)
     }
     if (c.indexOf(name) != -1) {
       return c.substring(name.length, c.length)
     }
  }
  return "0" // 默认是简体
}
//清除cookie  
function clearCookie(name) {  
    setCookie(name, "", -1)
}  
function checkCookie() {
    var user = getCookie("username")
    if (user != "") {
        alert("Welcome again " + user)
    } else {
        user = prompt("Please enter your name:", "")
        if (user != "" && user != null) {
            setCookie("username", user, 365)
        }
    }
}
checkCookie();
</script>
```

## 获取DOM内容
```js
var x = document.getElementById("myBtn").textContent
let num = document.getElementById('num').value
```

## 改变DOM元素内容
```js
document.getElementById("p1").innerHTML="New text!";
```

## 先复制在添加一个DOM对象，不从原来删除
```js
var itm = document.getElementById("myList2").lastChild
var cln = itm.cloneNode(true)
document.getElementById("myList1").appendChild(cln)
```

## 删除原来的DOM对象，添加到另一个的DOM对象中
```js
var node = document.getElementById("myList2").lastChild
document.getElementById("myList1").appendChild(node)
```

## 数字动态增加库
[普通用法github](https://github.com/inorganik/countUp.js/)
[vue组件github](https://github.com/xlsdg/vue-countup-v2)

用法
```js
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
</head>
<body>
    <div id="box"></div>
    <script src="https://cdn.bootcss.com/countup.js/1.9.3/countUp.js"></script>
    <script type="text/javascript">
        var options = {
            useEasing: true, 
            useGrouping: true, 
            separator: ',', 
            decimal: '.', 
        };
        var num = 100
        var demo = new CountUp('box', 0, 0, 0, 2.5, options);
        if (!demo.error) {
            // demo.start();
            demo.update(num);
        } else {
            console.error(demo.error);
        }
    </script>
</body>
</html>
```

## 禁止拖动图片
给父级元素添加
```js
<div ondragstart='return false;'></div>
```
## 选择器
```js
let tmp = document.getElementsByClassName('className') // 返回的是一个对象数组
```
## 获取属性值
```js
var div1 = document.getElementById("div1");
var align = div1.getAttribute("align");
```
## 设置属性值
```js
var b = document.querySelector("button"); 

b.style.property = new style
```
## 设置CSS
```js
var b = document.querySelector("button"); 
el.style.display = 'flex';
```

## JS 添加z-index属性
```js
object.style.zIndex = 'num'
```

## 禁止div中文字选中
```js
<div onselectstart="javascript:return false;">不能被选择</div>
```

## querySelectorAll

选择全部元素

## querySelector选择器

选择第一个元素
```js
<div id="foo\bar"></div>
<div id="foo:bar"></div>

<script>
  console.log('#foo\bar');               // "#fooar" (\b is the backspace control character)
  document.querySelector('#foo\bar');    // Does not match anything

  console.log('#foo\\bar');              // "#foo\bar"
  console.log('#foo\\\\bar');            // "#foo\\bar"
  document.querySelector('#foo\\\\bar'); // Match the first div

  document.querySelector('#foo:bar');    // Does not match anything
  document.querySelector('#foo\\:bar');  // Match the second div
  var el = document.querySelector(".myclass");
  var el = document.querySelector("#myID");
</script>
```

## classList用法
[classList用法](https://www.w3schools.com/jsref/prop_element_classlist.asp)

```js
classList.add(class1, class2, ...) 添加属性

classList.contains(class) 判断是否有class

classList.item(index) 返回index位置class name

classList.remove(class1, class2, ...) 删除class

classList.toggle(class, true|false) 切换一个class
```
添加返回true，删除返回false,第2个参数强制添加(true)删除(false)

## 切换DOM css代码 执行一次添加，再执行一次删除

```js
<style>
.mystyle {
    width: 100%;
    padding: 25px;
    background-color: coral;
    color: white;
    font-size: 25px;
    box-sizing: border-box;
}
</style>
<script>
function myFunction() {
   var element = document.getElementById("myDIV");
   element.classList.toggle("mystyle");
}
</script>
```

## 保存数据到本地,取出数据
```js
localStorage.setItem('token', token) // 保存(key,value)
const token = localStorage.getItem('token') || '' // 取出
localStorage.removeItem('token') // 删除
```

## 手机JS库
[手机js库](https://github.com/soyjavi/QuoJS)


## JS写文件库

[地址](https://github.com/eligrey/FileSaver.js/)

## JS读文件
[例子](https://jsfiddle.net/0GiS0/nDVYd/)
```js
var reader = new FileReader();
reader.onload = function(e) {
  console.log(e.target.result); // 文件内容
}
reader.readAsText(blob);
```



