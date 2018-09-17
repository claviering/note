# JS学习

## 使用模板字符串

```
var name = `Your name is ${first} ${last}.`
```

## string转JSON

JSON.parse(string).data

## 判断是否为chrome浏览器
```
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

global.confirm() 窗口弹出提示

可以在路由的beforeRouterLeave用,判断用户是否要离开页面

## JS中更好使用数组
- 使用 Array.includes 替代 Array.indexOf
如果我们仅需要知道数组中是否包含给定元素呢？这意味着只是是与否的区别，这是一个布尔问题（boolean question）。针对这种情况，我建议使用直接返回布尔值的 Array.includes。

- 使用 Array.find 替代 Array.filter
- 使用 Array.some 替代 Array.find
- 使用 Array.reduce 替代 Array.filter 与 Array.map 的组合

## 函数节流
函数节流是间隔时间执行

## 函数防抖

函数防抖就是法师发技能的时候要读条，技能读条没完再按技能就会重新读条。

```
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

```
drag.addEventListener('mousedown', handler = function (e) {}, false)
drag.removeEventListener('mousedown', handler, false)
```
## URL编码，解码
encodeURIComponent()
decodeURIComponent()


## DOM操作
```
var par=s.parentNode;   //得到s的父节点
document.createElement('img')
appendChild(DOM)
```

## 识别浏览器版本，操作系统
```
alert(navigator.userAgent)
```
## 操作cookie
```
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
```
var x = document.getElementById("myBtn").textContent
```

## 改变DOM元素内容
```
document.getElementById("p1").innerHTML="New text!";
```

## 先复制在添加一个DOM对象，不从原来删除
```
var itm = document.getElementById("myList2").lastChild
var cln = itm.cloneNode(true)
document.getElementById("myList1").appendChild(cln)
```

## 删除原来的DOM对象，添加到另一个的DOM对象中
```
var node = document.getElementById("myList2").lastChild
document.getElementById("myList1").appendChild(node)
```

## 数字动态增加库
[普通用法github](https://github.com/inorganik/countUp.js/)
[vue组件github](https://github.com/xlsdg/vue-countup-v2)

用法
```
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
```
<div ondragstart='return false;'></div>
```
## 选择器
```
let tmp = document.getElementsByClassName('className') // 返回的是一个对象数组
```
## 获取属性值
```
var div1 = document.getElementById("div1");
var align = div1.getAttribute("align");
```
## 设置属性值
```
var b = document.querySelector("button"); 

b.setAttribute("name", "helloButton");
b.setAttribute("disabled", "");
```

## JS 添加z-index属性
```
object.style.zIndex = 'num'
```

## 禁止div中文字选中
```
<div onselectstart="javascript:return false;">不能被选择</div>
```

## querySelector选择器
```
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

classList.add(class1, class2, ...) 添加属性

classList.contains(class) 判断是否有class

classList.item(index) 返回index位置class name

classList.remove(class1, class2, ...) 删除class

classList.toggle(class, true|false) 切换一个class

添加返回true，删除返回false,第2个参数强制添加(true)删除(false)

## 切换DOM css代码 执行一次添加，再执行一次删除

```
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
```
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
```
var reader = new FileReader();
reader.onload = function(e) {
  console.log(e.target.result); // 文件内容
}
reader.readAsText(blob);
```



