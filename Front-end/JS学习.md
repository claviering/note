# JS学习

## 获取 DOM attribute

`e.target.getAttribute("attribute")`

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

## 操作 URL

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

## 差集
```js
var a = [1,2,3,4,5]
var b = [2,4,6,8,10]
console.log("数组a：", a);
console.log("数组b：", b);
var sa = new Set(a);
var sb = new Set(b);
let minus = a.filter(x => !sb.has(x));

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



