# hexo

## 图片居中

```html
<p align="center">![](4.PNG)</p>
```

## hexo 插入数学公式

文件中引入

`<script type="text/javascript" src='https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.5/MathJax.js?config=TeX-MML-AM_CHTML' async></script>`

行内公式

`\\( b^c \\)`

块公式

`$$b^c$$`

## start 
```
npm install hexo-cli -g
hexo init blog
cd blog
npm install
hexo server
# Deploy after generation finishes
hexo generate -d  
# Watch file changes
hexo generate -w
# cleans the cache
hexo clean
hexo new [layout] <title>
categories:
- Sports
- Baseball
tags:
- Injury
- Fight
- Shocking
```

头像设置

sidebar-avatar: ./images/me.jpg

图片放到 blog/source/images/