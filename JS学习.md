# JS学习

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

`delete Attribute`

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
函数节流是间隔时间执行

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

b.setAttribute("name", "helloButton");
b.setAttribute("disabled", "");
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



