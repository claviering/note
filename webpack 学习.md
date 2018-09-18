# webpack 学习

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