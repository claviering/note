# sass学习

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
```html
<style lang="scss">
</style>
```

## 单文件

```shell
// 同目录
sass --watch input.scss output.css 
// app/sass -> public/stylesheets
sass --watch app/sass:public/stylesheets
```