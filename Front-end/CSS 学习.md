# CSS 学习

## 圆角的渐变边框

https://github.com/chokcoco/iCSS/issues/77

## 暗夜模式

```css
@media (prefers-color-scheme: dark) { 
  ... 暗夜模式下的css样式
}

@media (prefers-color-scheme: light) {
  ... 白天模式下css样式
}
```

## CSS中的混合模式，制作高级特效的必备技巧

https://github.com/qq449245884/xiaozhi/issues/231

mix-Blend-Mode

## 网站变灰

```css
html {
    -webkit-filter: grayscale(100%);
    -moz-filter: grayscale(100%);
    -ms-filter: grayscale(100%);
    -o-filter: grayscale(100%);
    filter: grayscale(100%);
    filter: progid:DXImageTransform.Microsoft.BasicImage(grayscale=1);
}
```

## :empty 伪类

`:empty` 伪类用来匹配空标签元素

```html
<div class="cs-empty"></div>
.cs-empty:empty{
    width: 120px;
    padding: 20px;
    border: 10px dashed;
}
```

隐藏空元素

```css
.cs-module:empty {
    display: none;
}
```

字段缺失智能提示

```css
dd:empty::before {
    content: '暂无';
    color: gray;
}
```


## CSS 埋点

```css
.button-1:active::after {
    content: url(./pixel.gif?action=click&id=button1);
    display: none;
}
.button-2:active::after {
    content: url(./pixel.gif?action=click&id=button2);
    display: none;
}
```

## 巧用CSS属性值正则匹配选择器

```css
[attr^="val"]
[attr$="val"]
[attr*="val"]
```
CSS属性选择器搜索过滤技术

```html
<input type="search" id="input" placeholder="输入城市名称或拼音" />
<ul>
    <li data-search="重庆市 chongqing">重庆市</li>
    <li data-search="哈尔滨市 haerbin">哈尔滨市</li>
    <li data-search="长春市 changchun">长春市</li>
    <li data-search="长沙市 changsha">长沙市</li>
    <li data-search="上海市 shanghai">上海市</li>
    <li data-search="杭州市 hangzhou">杭州市</li>
</ul>
```

```js
var eleStyle = document.createElement('style');
document.head.appendChild(eleStyle);
// 文本输入框
input.addEventListener('input', function() {
    var value = this.value.trim();
    eleStyle.innerHTML = value ? '[data-search]:not([data-search*="' + value +'"]) { display: none; } ' : '';
});

```


## 设置字体禁止缩放

```css
body {
  -webkit-text-size-adjust: 100% !important;
  text-size-adjust: 100% !important;
  -moz-text-size-adjust: 100% !important;
}

```

## 0.5px 细线

拿 2 倍屏来说，设备的物理像素要实现 1 像素，而 DPR=2，所以 css 像素只能是 0.5。

```css
/* 底边框 */
.b-border {
  position: relative;
}
.b-border:before {
  content: '';
  position: absolute;
  left: 0;
  bottom: 0;
  width: 100%;
  height: 1px;
  background: #d9d9d9;
  -webkit-transform: scaleY(0.5);
  transform: scaleY(0.5);
  -webkit-transform-origin: 0 0;
  transform-origin: 0 0;
}
/* 上边框 */
.t-border {
  position: relative;
}
.t-border:before {
  content: '';
  position: absolute;
  left: 0;
  top: 0;
  width: 100%;
  height: 1px;
  background: #d9d9d9;
  -webkit-transform: scaleY(0.5);
  transform: scaleY(0.5);
  -webkit-transform-origin: 0 0;
  transform-origin: 0 0;
}
/* 右边框 */
.r-border {
  position: relative;
}
.r-border:before {
  content: '';
  position: absolute;
  right: 0;
  bottom: 0;
  width: 1px;
  height: 100%;
  background: #d9d9d9;
  -webkit-transform: scaleX(0.5);
  transform: scaleX(0.5);
  -webkit-transform-origin: 0 0;
  transform-origin: 0 0;
}
/* 左边框 */
.l-border {
  position: relative;
}
.l-border:before {
  content: '';
  position: absolute;
  left: 0;
  bottom: 0;
  width: 1px;
  height: 100%;
  background: #d9d9d9;
  -webkit-transform: scaleX(0.5);
  transform: scaleX(0.5);
  -webkit-transform-origin: 0 0;
  transform-origin: 0 0;
}

/* 四条边 */
.setBorderAll {
  position: relative;
  &:after {
    content: ' ';
    position: absolute;
    top: 0;
    left: 0;
    width: 200%;
    height: 200%;
    transform: scale(0.5);
    transform-origin: left top;
    box-sizing: border-box;
    border: 1px solid #e5e5e5;
    border-radius: 4px;
  }
}
```

## 禁止用户选择页面中的文字或者图片

```css
div {
  -webkit-touch-callout: none;
  -webkit-user-select: none;
  -khtml-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
}
```


## 网页变黑白

`filter: grayscale(100%);`

## css

https://zhuanlan.zhihu.com/p/93814457

1. 使用:not()去除无用属性
2. 使用letter-spacing排版倒序文本
3. 使用text-align-last对齐两端文本 `text-align-last: justify;`
4. 使用margin-left排版左重右轻列表, 使用flexbox横向布局时，最后一个元素通过margin-left:auto实现向右对齐
5. 使用attr()抓取data-*
6. 使用pointer-events禁用事件触发
7. 使用:hover描绘鼠标跟随
8. 通过resize设置横向自由拉伸来调整目标元素的宽度


## 自定义文本选择

`::selection { background: #e2eae2; }`

## 图像灰度

```css
img {
    filter: gray; 
    -webkit-filter: grayscale(1);
}
```

## 模糊文本

```css
.text {
   filter: blur(1px);
}
```

## filter: invert

颜色反转

## mix-blend-mode

颜色混合

## Grid

1fr 平分剩下的自由空间

[fr 单位](https://zhuanlan.zhihu.com/p/27502596)

## 检查横屏竖屏

```css
@media screen and ( orientation : portrait ) {
/*竖屏...*/
}
 
@media screen and ( orientation : landscape ) {
/*横屏...*/
}
```

## 动画

动画时间

`transition: 1s;`

## placeholder-class

设置 placeholder class

`<input class="input-money" type="number" placeholder-class='input-placeholder' placeholder="输入金额" />`

## 绝对定位垂直居中

```css
transform: translateY(-50%) translateX(-50%);
top: 50%;
left: 50%;
```

## 让页面里的字体变清晰，变细用CSS怎么做

`-webkit-font-smoothing: antialiased;`

## 如何修改chrome记住密码后自动填充表单的黄色背景

```css
input:-webkit-autofill, textarea:-webkit-autofill, select:-webkit-autofill {
  background-color: rgb(250, 255, 189); /* #FAFFBD; */
  background-image: none;
  color: rgb(0, 0, 0);
}
```

## 禁止用户选择

```css
body{
  -webkit-touch-callout: none;
  -webkit-user-select: none;
  -khtml-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
}
```

## 丝滑滚动

`scroll-behavior: smooth;`

## ios端微信h5页面上下滑动时卡顿、页面缺失

```css
*{
  -webkit-overflow-scrolling: touch;
}
```

## for 和 id 绑定使用

点击 label 触发 input 的选中

```html
<div class="preference">
    <label for="cheese">Do you like cheese?</label>
    <input type="checkbox" name="cheese" id="cheese">
</div>

<div class="preference">
    <label for="peas">Do you like peas?</label>
    <input type="checkbox" name="peas" id="peas">
</div>
```

## 使用linear-gradient描绘波浪线

`background: linear-gradient(135deg, transparent, transparent 45%, $color, transparent 55%, transparent 100%), linear-gradient(45deg, transparent, transparent 45%, $color, transparent 55%, transparent 100%);`

## 使用:scrollbar改变滚动条样式

## 使用caret-color改变光标颜色

## 使用::selection 改变文本选择颜色

## 使用resize拉伸分栏

`resize: horizontal;`

## 使用attr()抓取data-*

css 中使用 attr 获取 dom 元素上的值

## 右对齐

使用flexbox横向布局时，最后一个元素通过margin-left:auto实现向右对齐

## 文本倒序

`letter-spacing: -100px;`

## 动画立即执行

animation-delay 改成负向

## outline

在 margin 外面

## letter-spacing

文字间距, 设置负值, 实现文字倒叙

## 上下翻转

scale(-1)

## mix-blend-mode || background-blend-mode

[混合模式](https://github.com/chokcoco/iCSS/issues/31)

## pointer-events

指针穿透属性

[参考](https://www.jianshu.com/p/3eba945fc19e)

## 多列布局

```css
column-width: 14em;
column-gap: 2em;
column-rule: 1px solid #ccc;
column-span: all;
break-before: avoid;
break-after: avoid;
break-inside: avoid;
```

## Vertical-Align 你应该知道的一切

[参考](https://zhuanlan.zhihu.com/p/62743439)

关键
- 行盒子的基线和上、下边界在哪儿？
- 行内元素的基线和上、下边界在哪儿？


## 使用 margin-top: auto 实现粘性 footer 布局

[margin auto 用法](https://github.com/chokcoco/iCSS/issues/64)

## rem 布局不再使用 JavaScript 设置

js ` document.querySelector('html').style.fontSize = `${window.innerWidth / 7.5 }px`;`

在不需要兼容太低版本的安卓机情况下

```css
html{
  font-size: calc(100vw  /  7.5)
}
```

## caret-color

Input 光标颜色

## IOS 滚动流畅

```css
body{
-webkit-overflow-scrolling: touch; /* ios5+ */
}
```

`-webkit-overflow-scrolling` 属性具有继承效果，所以在 body 上设置即可，这样局部滚动条就非常的流畅了。


## text-align-last

最后一行文字对齐方式，实现文字两端对齐 `text-align-last: justify;`

## writing-mode

writing-mode 是用来实现文字可以竖着呈现的

## JS in CSS

## 滚动的另类使用

[滚动换衣服](https://zhuanlan.zhihu.com/p/60201227)

```css
.main-content {
  scroll-snap-type: y mandatory;
  overflow-y: scroll;
}

section {
  scroll-snap-align: center;
}
```

## 动态生成内容

动态生成内容 [Demo](https://codepen.io/airen/pen/bZzdoB)

## 单行隐藏省略号

```css
width: 100px;
overflow: hidden;
white-space: nowrap;
text-overflow: ellipsis;
```

多行

```css
.txt{
  display: -webkit-box;
  overflow: hidden;
  -webkit-line-clamp: 3;//需要省略的行数
  -webkit-box-orient: vertical;
}
```

## hyphens 连字符样式

[hyphens](https://developer.mozilla.org/en-US/docs/Web/CSS/hyphens)

```css
.hyphenate {
  overflow-wrap: break-word;
  word-wrap: break-word;
  -webkit-hyphens: auto;
  -ms-hyphens: auto;
  hyphens: auto;
}
```

## fixed 定位失效 | 不受控制的 position:fixed 
1. 任何非 none 的 transform 值都会导致一个堆叠上下文（Stacking Context）和包含块（Containing Block）的创建
2. 由于堆叠上下文的创建，该元素会影响其子元素的固定定位。设置了 position:fixed 的子元素将不会基于 viewport 定位，而是基于这个父元素

## 命名规范

BEM

BEM代表块（Block），元素（Element），修饰符（Modifier）
```js
// block-name
// block-name--modifier-name
// block-name__element-name
// block-name__element-name--modifier-name
```

## 媒体查询

```css
@media only screen and (device-width: 375px) and (device-height: 812px) and (-webkit-device-pixel-ratio: 3) {
}
@media only screen and (device-width: 414px) and (device-height: 896px) and (-webkit-device-pixel-ratio: 3) {
}
@media only screen and (device-width: 414px) and (device-height: 896px) and (-webkit-device-pixel-ratio: 2) {
}

```

## rem 计算

```js
(function (baseFontSize) {
    const _baseFontSize = baseFontSize || 75;
    const ua = navigator.userAgent;
    const matches = ua.match(/Android[\S\s]+AppleWebkit\/(\d{3})/i);
    const isIos = navigator.appVersion.match(/(iphone|ipad|ipod)/gi);
    const dpr = window.devicePixelRatio || 1;
    if (!isIos && !(matches && matches[1] > 534)) {
        // 如果非iOS, 非Android4.3以上, dpr设为1;
        dpr = 1;
    }
    const scale = 1 / dpr;
    const metaEl = document.querySelector('meta[name="viewport"]');
    if (!metaEl) {
        metaEl = document.createElement('meta');
        metaEl.setAttribute('name', 'viewport');
        window.document.head.appendChild(metaEl);
    }
    metaEl.setAttribute('content', 'width=device-width,user-scalable=no,initial-scale=' + scale + ',maximum-scale=' + scale + ',minimum-scale=' + scale);

    document.documentElement.style.fontSize = document.documentElement.clientWidth / (750 / _baseFontSize) + 'px';
})();

```

## 触摸屏滚动
不仅需要overflow: scroll / auto，还需要-webkit-overflow-scrolling: touch;
```css
overflow: scroll / auto;
-webkit-overflow-scrolling: touch;
```

## transition
```css
// Background colour transition
transition: background 0.2s ease-in-out;
```

## rem 适配

```css
html{
		font-size:16px;
	}
@media screen and (min-width:240px) {
    html {
        font-size:9px;
    }
}
@media screen and (min-width:320px) {
	html {
		font-size:12px;
	}
}
@media screen and (min-width:375px) {
	html{
		font-size:14.0625px;
	}
}

```

## display: none 和 visibility:hidden

`display:none` 不占用原来的位置，而`visibility:hidden`保留原来的位置后

浏览器会解析HTML标签生成DOM Tree，解析CSS生成CSSOM，然后将DOM Tree和CSSOM合成生成Render Tree，元素在Render Tree中对应0或多个盒子，然后浏览器以盒子模型的信息布局和渲染界面。而设置为display:none的元素则在Render Tree中没有生成对应的盒子模型，因此后续的布局、渲染工作自然没它什么事了，至于DOM操作还是可以的

### none

1. 无法响应任何事件，无论是捕获、命中目标和冒泡阶段均不可以
2. 不耽误form表单提交数据 虽然我们无法看到display:none的元素，但当表单提交时依然会将隐藏的input元素的值提交上去
3. CSS中的counter会忽略display:none的元素

## CSS 的 white-space 属性
[white-space](http://www.ruanyifeng.com/blog/2018/07/white-space.html)
CSS 提供了一个white-space属性，可以提供更精确一点的空格处理方式。该属性共有六个值，除了一个通用的inherit（继承父元素），下面依次介绍剩下的五个值。

- nowrap 不会因为超出容器宽度而发生换行

## Grid布局
[Grid布局](http://www.css88.com/archives/8510)
```
display属性
grid: 生成一个块级网格
inline-grid ：生成一个内联网格
```
HTML容器
```
<div class="wrapper">
  <div>1</div>
  <div>2</div>
  <div>3</div>
  <div>4</div>
  <div>5</div>
  <div>6</div>
</div>
```

CSS
```
.wrapper {
    display: grid;
    grid-template-columns: 100px 100px 100px; // 3列 每列100px
    grid-template-rows: 50px 50px; // 2行 每行50px
}
// item1 占据从第一条网格线开始，到第四条网格线结束。换句话说，它将独立占据整行
.item1 {
    grid-column-start: 1;
    grid-column-end: 4;
}
// 缩写
.item1 {
    grid-column: 1 / 4;
}
grid-column-gap / grid-row-gap 列/行之间间距的宽度。
```
grid-auto-flow
- row：告诉自动布局算法依次填充每行，根据需要添加新行
- column：告诉自动布局算法依次填入每列，根据需要添加新列


能用align 和justify

## 在线设计css
3D按钮，形状
[在线设计css](http://enjoycss.com/start#boxShadow)

## 选择器nth-child用法
[选择器nth-child用法](https://css-tricks.com/useful-nth-child-recipies/)
## 3D字体在线
[地址](http://3d.yuxiaoxi.com/)

## 响应式

<link rel="" href="" media="" />
根据media加载不用样式

## 表格

border-collapse: collapse // 合并边框

## 最小大高度， 宽度
min-height/width
max-height/width

## 样式书写顺序

显示样式-> 自身样式->文本样式->CSS3样式

## 多列布局

columns:column-width || <column-count>
column-gap: normal | <length> 列间距离
column-rule 列边框样式
column-span 跨列显示
column-fill 列高度

## 轮廓线

outline

不占据空间

## 盒子模型

box-sizing:centent-box|border-box
centent-box => width/height = border+padding+content
border-box => width/height = content

## 阴影

box-shadow
[在线设计](https://css3gen.com/box-shadow/)
## 倒影
-webkit-box-reflect
[倒影加颜色渐变](https://designshack.net/articles/css/mastering-css-reflections-in-webkit/)

## 背景
backbround-[color,image,repeat,attachment,postion,origin,clip,size]

## 颜色渐变
[在线效果](https://mycolor.space/gradient?ori=to+left+bottom&hex=%23070B11&hex2=%23678030&sub=1)
gradient

## 文本对齐

text-align: left|right|center|justify // 水平方向
vertical-align:top|bottom|middle|baseline
white-space-collapse
white-space
word-break
text-wrap
text-align-last
text-justify


## css和DOM树
css并不会阻塞DOM树的解析。(看不到，但是js可以控制DOM)
css加载会阻塞DOM树渲染。(CSS加载完，才看到网页上的DOM)
css加载会阻塞后面js语句的执行

## 文字缩进
```
text-indent:2em; 
```
## 浏览器前缀
```
-webkit-transform:rotate(-3deg); /*为Chrome/Safari*/
-moz-transform:rotate(-3deg); /*为Firefox*/
-ms-transform:rotate(-3deg); /*为IE*/
-o-transform:rotate(-3deg); /*为Opera*/
```

## css滤镜
```css
filter: blur(5px) // 模糊
filter:brightness(70%);
filter:contrast(50%);
filter: drop-shadow(705px 0 0 #ccc);
filter:hue-rotate(70deg);
filter:invert(100%);
filter:grayscale(80%);
filter:sepia(50%)
```
终极变色解决方案！ 
```css
<svg height="0" xmlns="http://www.w3.org/2000/svg">
    <defs>
        <filter id="change">
                <feColorMatrix type="matrix" values="
                0 0 0 0 0.55
                0 0 0 0 0.23 
                0 0 0 0 0 
                0 0 0 0 1" />
        </filter>
    </defs>
</svg>
filter:url(#change);
```
[博客实例](https://juejin.im/post/5ba21d78f265da0af0337fe3)

##元素鼠标样式
```
&:hover{
    cursor: pointer;
}
可能的取值
Auto
Crosshair
Default
Pointer
Move
e-resize
ne-resize
nw-resize
n-resize
se-resize
sw-resize
s-resize
w-resize
text
wait
help
```

## 纯CSS的导航栏Tab切换方案
[纯CSS的导航栏Tab切换方案](https://github.com/chokcoco/iCSS/issues/2)
html
```
<div id="content1">列表1内容:123456</div>
<div id="content2">列表2内容:abcdefgkijkl</div>
<ul class='nav'>
    <li><a href="#content1">列表1</a></li>
    <li><a href="#content2">列表2</a></li>
</ul>
```
css
```
#content1,
#content2{
    display:none;
}

#content1:target,
#content2:target{
    display:block;
}
#content1:target ~ .nav li{
    // 改变li元素的背景色和字体颜色
    &:first-child{
        background:#ff7300;
        color:#fff;
    }
}

#content2:target ~ .nav li{
    // 改变li元素的背景色和字体颜色
    &:last-child{
        background:#ff7300;
        color:#fff;
    }
}
```

## 视口单位
vw = view width
vh = view height
|单位|解释|
|--|--|
|vw|1vw = 视口宽度的1%|
|vh|1vh = 视口高度的1%|
|vmin|选取vw和vh中最小的那个|
|vmax|选取vw和vh中最大的那个|

### vh/vw与%区别在于

|单位|依赖于|
|--|--|
|vw/vh|视口的尺寸|
|%|元素的祖先元素|

我们需要结合rem单位来实现布局，而rem正好可以动态改变根元素大小，做法是

1. 给根元素大小设置vw–动态改变大小。

2. 限制根元素font-size的最大最小值，配合bosy加上最大最小宽度

## rem字体单位
 rem是CSS3新增的一个相对单位（root em，根em），这个单位引起了广泛关注。这个单位与em有什么区别呢？区别在于使用rem为元素设定字体大小时，仍然是相对大小，但相对的只是HTML根元素
 
 |单位|说明|
 |--|--|
|em|并不是固定的，会继承父级元素的字体大小，代表倍数|
|rem|并不是固定的，始终是基于根元素 <html> 的，也代表倍数|


## 滚动视差

[滚动视差](https://juejin.im/post/5b6d0756e51d4562b31ad23c)

视差滚动（Parallax Scrolling）是指让多层背景以不同的速度移动，形成立体的运动效果，带来非常出色的视觉体验。 作为网页设计的热点趋势，越来越多的网站应用了这项技术
```
background-attachment: fixed
```
## 禁止网页拖动元素打开新窗口问题
```
<body ondragstart="return false">
</body>
```
## 移动端H5解惑-页面适配
[移动端H5解惑-页面适配](https://juejin.im/post/5b6503dee51d45191e0d30d2)

## 改变placeholder css属性
```
::-webkit-input-placeholder { /* Chrome/Opera/Safari */
  color: pink;
}
::-moz-placeholder { /* Firefox 19+ */
  color: pink;
}
:-ms-input-placeholder { /* IE 10+ */
  color: pink;
}
:-moz-placeholder { /* Firefox 18- */
  color: pink;
}
```
## 伪类选择器 :focus-within
它表示一个元素获得焦点，或，该元素的后代元素获得焦点。划重点，它或它的后代获得焦点。

## :placeholder-shown
意思大概就是，当 input 类型标签使用了 placeholder 属性有了默认占位的文字，会触发此伪类样式。配合:not()伪类，可以再改变当默认文字消失后的样式，再配合本文的主角，我们可以实现表单的一系列效果。
```
.g-container {
    width: 500px;
    height: 60px;

    input {
        height: 100%;
        width: 100%;

        &:not(:placeholder-shown) {
            ...
        }

        &:placeholder-shown {
            ...
        }
    }

    &:focus-within {
        ...
    }
}
```

## a标签css
display:block 点击一个区块都有效果
text-decoration:none 删除下划线
vertical-align: top 顶部对齐

## 垂直居中
```css
.parent{display:flex;align-items:center;} 
```
## 水平居中
```css
.column{float:left;width:25%;padding-left:20px;box-sizing:border-box;}
```

## 水平垂直居中，多行文字
```
display:table
```

## Sticky footers设计实现
下面有个东西跟着上面的内容多少往下推
```
<div class="detail-wrapper clearfix">
    <div class="detail-main"></div>
</div>
<div detail-close></div>

//清除浮动
.clearfix{
    display: inline-block;
    &:after{
        display: block
        content:"."
        height: 0;
        line-height: 0;
        clear: both;
        visibility: hidden
    }
}

.detail-wrapper{
    height: 100%;
}

.detail-main{
    margin-top: 64px;
    padding-bottom: 64px //关键
}

.detail-close{
    position: relative
    width: 32px;
    height: 32px;
    margin : -64px auto 0 auto; // -64px 关键
    clear: both;
    font-size: 32px;
}
```

## flex 布局

flex属性是flex-grow, flex-shrink 和 flex-basis的简写，默认值为0 1 auto。后两个属性可选。
```
flex: 0 1 auto // 不扩大，会缩小，自动
```


[Flex 布局教程：语法篇](http://www.ruanyifeng.com/blog/2015/07/flex-grammar.html)
[Flex 布局教程：实例篇](http://www.ruanyifeng.com/blog/2015/07/flex-examples.html)

flex属性是flex-grow, flex-shrink 和 flex-basis的简写，默认值为0 1 auto。后两个属性可选。

flex-grow属性定义项目的放大比例，默认为0，即如果存在剩余空间，也不放大。

flex-shrink属性定义了项目的缩小比例，默认为1，即如果空间不足，该项目将缩小。

flex-basis属性定义了在分配多余空间之前，项目占据的主轴空间（main size）。浏览器根据这个属性，计算主轴是否有多余空间。它的默认值为auto，即项目的本来大小。

## 实现底部边框长度为90%
```
<div class="box"></div>
    .box{
        position: relative;
        height: 100px;
        wight:100px;
        background-color: black;
    }
    .box:after{
        content: '';
        position: absolute;
        left:5%;
        bottom: 0px;
        height: 10px;
        width: 90%;
        background-color: red;
    }
```
[参考](https://blog.csdn.net/Colossalis_c/article/details/71216339)

## div中文字居中
```
<div class="box">居中文字</div>
.box{
    display: flex;
    align-items: center;
    justify-content: center;
}
```

## js replace匹配字符串然后再修改他
```js
  log_replace:function(str){
    function inline_func(match, offset, string){
      return (offset > 0 ? '这个不知道干嘛的': '前面加东西') + match+"后面加东西";
    }
    return str.replace(正则表达式规则, inline_func);
  }
```

## 文字
```
text-align: right; //靠右
word-break: break-all; //换行
```

## body 100% height
```
html,body{height: 100%}
```

## css动画

[参考](http://www.ruanyifeng.com/blog/2014/02/css_transition_and_animation.html)

## 选择器
A B 包含关系，A下的所有B,子孙后代
A > B 父子关系

A + B 兄弟关系
A ~ B CSS3 兄弟关系