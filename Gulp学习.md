# Gulp 学习

自动化工具

## 安装

```shell
npm install gulp-cli -g
npm install gulp -D
touch gulpfile.js
gulp --help
```

## 插件
- gulp-uglify (js压缩)
- gulp-clean-css (CSS压缩)
- gulp-minify-html (html压缩)
- gulp-htmlmin(html压缩)
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

## 和webpack的区别

1. Gulp是执行一个一个的任务，要自己写好每个任务，webpack是自己写好配置文件，webpack根据配置文件执行任务
2. Gulp有文件合并的插件，但它不能解决按需引入，webpack解决按需引入使用require,搭配loader加载
3. 自己写Gulp任务很多，webpack一个配置文件就好的
4. gulp自动化, 可以配置webpack的插件
5. webpack模块化识别