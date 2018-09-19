# webpack 学习

## 配置typescript

`npm i ts-loader -D`

`tsc --init` 生成`tsconfig.json` 改 `"outDir": ".js"`
```js
{
  module: {
    rules: [
      {
        test: /\.vue$/,
        loader: 'vue-loader',
        options: { /* ... */ },
      },
      {
        test: /\.ts$/,
        loader: 'ts-loader',
        options: {
          appendTsSuffixTo: [/\.vue$/],
        }
      },
    ],
  }
}
```
由于 TypeScript 默认并不支持 *.vue 后缀的文件，所以在 vue 项目中引入的时候需要创建一个 vue-shims.d.ts 文件，放在项目项目对应使用目录下，例如 src/vue-shims.d.ts

```js
declare module "*.vue" {
  import Vue from "vue";
  export default Vue;
}
```
意思是告诉 TypeScript *.vue 后缀的文件可以交给 vue 模块来处理。

而在代码中导入 *.vue 文件的时候，需要写上 .vue 后缀。原因还是因为 TypeScript 默认只识别 *.ts 文件，不识别 *.vue 文件：

`import Component from 'components/component.vue'`

## 三十分钟掌握Webpack性能优化
[三十分钟掌握Webpack性能优化](https://juejin.im/post/5b652b036fb9a04fa01d616b)

[手摸手，带你用合理的姿势使用 webpack4（上）](https://juejin.im/post/5b56909a518825195f499806)


## html插件配置
webpack.config.js
```js
const HtmlWebpackPackPlugin = require('html-webpack-plugin')
const htmlPlugin = new HtmlWebpackPackPlugin({
  template: path.join(__dirname, './src/index.html'),
  filename: 'index.html'
})
module.exports = {
  mode: 'development',
  plugins: [
    htmlPlugin
  ]
}
```

## 使用babel-loader
webpack 4.x | babel-loader 8.x | babel 7.x
```shell
npm install -D babel-loader @babel/core @babel/preset-env webpack
module: {
  rules: [
    {
      test: /\.js$/,
      exclude: /(node_modules|bower_components)/,
      use: {
        loader: 'babel-loader',
        options: {
          presets: ['@babel/preset-env']
        }
      }
    }
  ]
}
```