# CSS 学习

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