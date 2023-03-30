# css 笔记

## 用户只需要点击一次，就可以选中该段信息

```css
.g-select-all {
    user-select: all
}
```

## Twitter 背后模糊效果

```css
    background-color: rgba(255, 255, 255, 0.85);
    backdrop-filter: blur(12px);
```

## scrollWidth、clientWidth、offsetWidth、width的区别

clientWidth是内容可视区的宽度 > offsetWidth是元素的实际宽度 > scrollWidth为实际内容的宽度

## 当元素不面向屏幕时其可见性如何定义

`backface-visibility: visible | hidden`

## 元素占满父元素

object-fit: contain;

## 设置css让浏览器加载更快

content-visibility: auto, 浏览器只渲染可视区域的布局, 当用户往下滚动页面的时候，可视区域的布局会即时排布

```css
content-visibility: auto
```

## 垂直居中

```css
.paraent{
  display: grid;
  place-items: center;
}
```

## 自动调整行高度, 自适应

```css
.parent{
  display: grid;
  grid-template-rows: auto 1fr auto;
}
```

## 自动调整列宽度，自适应

```css
.parent{
  display: grid;
  grid-template-rows: auto 1fr auto / auto 1fr auto;
}
```

## 调整大小

`resize` CSS 属性允许你控制一个元素的可调整大小性


## 自适应布局

```css
.ex7 .parent {
  display: grid;
  grid-gap: 1rem;
  grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
}
```

## ch 单位

ch还有另一个规则：

1ch = 1个英文 = 1个数字

2ch = 1个中文

## 响应式单位

我们用 min()、max() 和 clamp() 实现一个简单的响应式效果

## 媒体查询宽高比 aspect-ratio

```css
/* Minimum aspect ratio */
@media (min-aspect-ratio: 8/5) {
  div {
    background: #9af; /* blue */
  }
}

/* Maximum aspect ratio */
@media (max-aspect-ratio: 3/2) {
  div {
    background: #9ff;  /* cyan */
  }
}

/* Exact aspect ratio, put it at the bottom to avoid override*/
@media (aspect-ratio: 1/1) {
  div {
    background: #f9a; /* red */
  }
}
```

## 元素宽高比

```css
aspect-ratio: 1 / 1; 
aspect-ratio: 16 / 9;
```