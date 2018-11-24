# less学习
LESS 将 CSS 赋予了动态语言的特性，如 变量， 继承， 运算， 函数. LESS 既可以在 客户端 上运行 (支持IE 6+, Webkit, Firefox)，也可以借助Node.js或者Rhino在服务端运行。

[教程1](http://www.bootcss.com/p/lesscss/)

[教程2](http://lesscss.org/functions/)

## 安装
```
npm install less less-loader --save
npm install -g less
lessc my.less 生成my.css文件
```
## Each
@value, @key, and @index

```less
@selectors: blue, green, red;

each(@selectors, {
  .sel-@{value} {
    a: b;
  }
});
```

## vue中使用

### 单组件中使用 添加lang='less'
```js
<style scoped lang='less'>
@mainColor: #2c3e50;
#app {
  color: @mainColor;
}
</style>
```

### 写入.less文件 通过import引入
```js
//GlobleLessVarables.less
@mainColor: #2c3e50;

//app.vue
<style lang='less'>
@import './assets/GlobleLessVarables.less';
#app {
  color: @mainColor;
}
</style>
```

### 全局less变量

没看懂，下次再继续

## 变量
```css
@color: #4D926F;
#header {
  color: @color;
}
h2 {
  color: @color;
}
```

### @arguments 变量
@arguments包含了所有传递进来的参数,如果你不想单独处理每一个参数的话就可以像这样写:
```css
.box-shadow (@x: 0, @y: 0, @blur: 1px, @color: #000) {
  box-shadow: @arguments;
  -moz-box-shadow: @arguments;
  -webkit-box-shadow: @arguments;
}
.box-shadow(2px, 5px);
```
输出
```css
  box-shadow: 2px 5px 1px #000;
  -moz-box-shadow: 2px 5px 1px #000;
  -webkit-box-shadow: 2px 5px 1px #000;
```

## 混合
```css
.rounded-corners (@radius: 5px) {
  border-radius: @radius;
  -webkit-border-radius: @radius;
  -moz-border-radius: @radius;
}

#header {
  .rounded-corners;
}
#footer {
  .rounded-corners(10px);
}
```

## 嵌套规则
```css
#header {
  h1 {
    font-size: 26px;
    font-weight: bold;
  }
  p { font-size: 12px;
    a { text-decoration: none;
      &:hover { border-width: 1px }
    }
  }
}
```

## 运算
```css
@the-border: 1px;
@base-color: #111;
@red:        #842210;

#header {
  color: @base-color * 3;
  border-left: @the-border;
  border-right: @the-border * 2;
}
#footer { 
  color: @base-color + #003300;
  border-color: desaturate(@red, 10%);
}
```

## 在客户端使用
引入你的 .less 样式文件的时候要设置 rel 属性值为 “stylesheet/less”:
```js
<link rel="stylesheet/less" type="text/css" href="styles.less">
```
下载 less.js, 在<head> 中引入:
```js
<script src="less.js" type="text/javascript"></script>
```
## 引导
```css
.mixin (@a) when (lightness(@a) >= 50%) {
  background-color: black;
}
.mixin (@a) when (lightness(@a) < 50%) {
  background-color: white;
}
.mixin (@a) {
  color: @a;
}
```

导引序列使用逗号‘,’—分割，当且仅当所有条件都符合时，才会被视为匹配成功。
```
.mixin (@a) when (@a > 10), (@a < -10) { ... }
```
下面就是常见的检测函式：
```
iscolor
isnumber
isstring
iskeyword
isurl
```
如果你想判断一个值是纯数字，还是某个单位量，可以使用下列函式：
```
ispixel
ispercentage
isem
```
使用not关键字实现或条件
```
.mixin (@b) when not (@b > 0) { ... }
```

## Math 函数
```
round(1.67); // returns `2`
ceil(2.4);   // returns `3`
floor(2.6);  // returns `2`
percentage(0.5); // returns `50%`
```
## 命名空间
```css
#bundle (){
  .button {
    display: block;
    border: 1px solid black;
    background-color: grey;
    &:hover { background-color: white }
  }
  .tab { ... }
  .citation { ... }
}
```
使用
```
#header a {
  color: orange;
  #bundle > .button;
}
```

## 字符串插值
```css
@base-url: "http://assets.fnord.com";
background-image: url("@{base-url}/images/bg.png");
@min768: (min-width: 768px);
.element {
  @media @min768 {
    font-size: 1.2rem;
  }
}
```

## JavaScript 表达式

JavaScript 表达式也可以在.less 文件中使用. 可以通过反引号的方式使用:
```
@var: `"hello".toUpperCase() + '!'`;
```
输出
```
@var: "HELLO!";
```

## 不编译
```css
.class {
  filter: ~"ms:alwaysHasItsOwnSyntax.For.Stuff()";
}
```

