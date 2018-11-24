# sass学习

sass有2种语法,文件不同后缀名
1. fileName.sass
2. fileName.scss

2种的不同

- sass is the older syntax

- sassy css is the new syntax as of Sass 3

- The difference is UI.

- There are two syntaxes available for Sass. The first, known as SCSS (Sassy CSS) and used throughout this reference, is an extension of the syntax of CSS. This means that every valid CSS stylesheet is a valid SCSS file with the same meaning. This syntax is enhanced with the Sass features described below. Files using this syntax have the .scss extension.

- The second and older syntax, known as the indented syntax (or sometimes just “Sass”), provides a more concise way of writing CSS. It uses indentation rather than brackets to indicate nesting of selectors, and newlines rather than semicolons to separate properties. Files using this syntax have the .sass extension.
# 安装

`npm i -g sass`

## Vue-cli 3使用

```shell
vue create app
自定义选择sass
```

## 组件中使用

安装

```shell
npm i -D sass-loader node-sass
```

App.vue中
scss
```html
<style lang="scss">
</style>
```
sass
```html
<style lang="sass">
</style>
```

## 单文件

```shell
// 同目录
sass --watch input.scss output.css 
// app/sass -> public/stylesheets
sass --watch app/sass:public/stylesheets
```

## Import

`@import 'reset';`

## Mixins

```css
@mixin transform($property) {
  -webkit-transform: $property;
      -ms-transform: $property;
          transform: $property;
}

.box { @include transform(rotate(30deg)); }
```
默认参数

`@mixin sexy-border($color, $width: 1in){}`

可变参数

```css
@mixin box-shadow($shadows...) {
  -moz-box-shadow: $shadows;
  -webkit-box-shadow: $shadows;
  box-shadow: $shadows;
}

.shadows {
  @include box-shadow(0px 4px 5px #666, 2px 6px 10px #999);
}
```
is compiled to:
```css
.shadows {
  -moz-box-shadow: 0px 4px 5px #666, 2px 6px 10px #999;
  -webkit-box-shadow: 0px 4px 5px #666, 2px 6px 10px #999;
  box-shadow: 0px 4px 5px #666, 2px 6px 10px #999;
}
```
## Extend/Inheritance

```css
%equal-heights {
  display: flex;
  flex-wrap: wrap;
}

// This CSS will print because %message-shared is extended.
%message-shared {
  border: 1px solid #ccc;
  padding: 10px;
  color: #333;
}

.message {
  @extend %message-shared;
}

.success {
  @extend %message-shared;
  border-color: green;
}

.error {
  @extend %message-shared;
  border-color: red;
}

.warning {
  @extend %message-shared;
  border-color: yellow;
}
```

## Operators
`+ - * \ %`

### if()
```css
if(true, 1px, 2px) => 1px
if(false, 1px, 2px) => 2px
```

### @if

```css
p {
  @if 1 + 1 == 2 { border: 1px solid;  }
  @if 5 < 3      { border: 2px dotted; }
  @if null       { border: 3px double; }
}
```

### @for
```css
@for $i from 1 through 3 {
  .item-#{$i} { width: 2em * $i; }
}
```
is compiled to:

```css
.item-1 {
  width: 2em; }
.item-2 {
  width: 4em; }
.item-3 {
  width: 6em; }
```

### @each
```css
@each $animal in puma, sea-slug, egret, salamander {
  .#{$animal}-icon {
    background-image: url('/images/#{$animal}.png');
  }
}
```
is compiled to:

```css
.puma-icon {
  background-image: url('/images/puma.png'); }
.sea-slug-icon {
  background-image: url('/images/sea-slug.png'); }
.egret-icon {
  background-image: url('/images/egret.png'); }
.salamander-icon {
  background-image: url('/images/salamander.png'); }
```
#### Multiple Assignment
```css
@each $animal, $color, $cursor in (puma, black, default),
                                  (sea-slug, blue, pointer),
                                  (egret, white, move) {
  .#{$animal}-icon {
    background-image: url('/images/#{$animal}.png');
    border: 2px solid $color;
    cursor: $cursor;
  }
}
```
is compiled to:

```css
.puma-icon {
  background-image: url('/images/puma.png');
  border: 2px solid black;
  cursor: default; }
.sea-slug-icon {
  background-image: url('/images/sea-slug.png');
  border: 2px solid blue;
  cursor: pointer; }
.egret-icon {
  background-image: url('/images/egret.png');
  border: 2px solid white;
  cursor: move; }
```
#### maps
```css
@each $header, $size in (h1: 2em, h2: 1.5em, h3: 1.2em) {
  #{$header} {
    font-size: $size;
  }
}
```
is compiled to:
```css
h1 {
  font-size: 2em; }
h2 {
  font-size: 1.5em; }
h3 {
  font-size: 1.2em; }
```

### @while
```css
$i: 6;
@while $i > 0 {
  .item-#{$i} { width: 2em * $i; }
  $i: $i - 2;
}
```

## Function Directives
```css
$grid-width: 40px;
$gutter-width: 10px;

@function grid-width($n) {
  @return $n * $grid-width + ($n - 1) * $gutter-width;
}

#sidebar { width: grid-width(5); }
```
Becomes:
```css
#sidebar {
  width: 240px; }
```