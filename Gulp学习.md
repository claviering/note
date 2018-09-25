# Gulp 学习

自动化工具

## 深入学习

gulp 是基于数据流的构建系统
### 要素一: stream
1. 管道 pipe()
2. 内存操作 在内存中进行
3. 事件 .on() 添加事件
4. 类型

### 要素二: Viny文件系统

用 js 对象来描述文件
```js
var File = require('vinyl');

var coffeeFile = new File({
  cwd: "/",
  base: "/test/",
  path: "/test/file.coffee",
  contents: new Buffer("test = 123")
});
```
使用 vinyl-fs
```js
var vfs = require('vinyl-fs');
// ...
Gulp.prototype.src = vfs.src;
Gulp.prototype.dest = vfs.dest;
// ...
```
也就是说，gulp.src()和gulp.dest()直接来源于vinyl-fs。

### Gulp 错误处理

`.on('error')`

## 3.0升级到4.x版本

https://www.liquidlight.co.uk/blog/article/how-do-i-update-to-gulp-4/

## 同步任务，异步任务

```js
/*
 * Specify if tasks run in series or parallel using `gulp.series` and `gulp.parallel`
 */
var build = gulp.series(clean, gulp.parallel(styles, scripts));
```

## 安装

```shell
npm install gulp-cli -g
npm install gulp -D
touch gulpfile.js
gulp --help
```

## 插件
- gulp-uglify (js压缩)
- pump pipes streams together and destroys all of them if one of them closes.
- gulp-clean-css (CSS压缩)
- gulp-minify-html (html压缩)
- gulp-htmlmin (html压缩)
- gulp-jshint (js代码检查)
- gulp-eslint (eslint代码检查)
- gulp-concat (文件合并)
- gulp-less (编译less)
- gulp-sass
- gulp-imagemin (压缩图片)
- gulp-livereload (轻量服务器)
- gulp-base64 (小图标转码为内联 base64)
- gulp-colors (输出cli的颜色)
- gulp-rev (将 MD5 指纹写入文件名)
- gulp-autoprefixer (添加CSS3前缀)
- del (文件删除)
- browser-sync (浏览器同步刷新)
- gulp-rename (重命名)
- gulp-live-server (轻量服务器)
- connect-livereload (热更新同步)
- gulp-watch (监听修改后的文件，实时更新)
- piped-webpack (gulp webpack功能)
- gulp-connect Gulp plugin to run a webserver (with LiveReload)
- gulp-dev 文件名加上hash
- gulp-webpack
- webpack-stream
- gulp-load-plugins 自动加载插件
- gulp-browserify js模块化构建



## 和webpack的区别

1. Gulp是执行一个一个的任务，要自己写好每个任务，webpack是自己写好配置文件，webpack根据配置文件执行任务
2. Gulp有文件合并的插件，但它不能解决按需引入，webpack解决按需引入使用require,搭配loader加载
3. 自己写Gulp任务很多，webpack一个配置文件就好的
4. gulp自动化, 可以配置webpack的插件
5. webpack模块化识别