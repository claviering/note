#  webpack 学习

## 比 DLL 更优秀的插件

https://juejin.im/post/5d8aac8fe51d4578477a6699#heading-3

抛弃 DLL：Vue & React 官方的共同选择

HardSourceWebpackPlugin

貌似这个技术直接放到了 webpack 5 里，开箱即用

## hash chunkhash contenthash

hash 计算与整个项目的构建相关；

chunkhash 计算与同一 chunk 内容相关；

contenthash 计算与文件内容本身相关。

## 魔法注释

```js
const { default: _ } = await import(/* webpackChunkName: "lodash" */ /* webpackPrefetch: true */ 'lodash');
```

就会以 `<link rel="prefetch" as="script">` 的形式预拉取 lodash 代码：

## 打包优化

https://zhuanlan.zhihu.com/p/115100052

一个 chunk 增删 module，会导致其他 chunk 中的 moduleId 发生改变，增删 chunk，更会导致其他 chunk 的 chunkId 和 包含的 moduleId 同时改变，也就是说一个 chunk 文件无法使用稳定的 hash 作为标识，也就没法使用稳定的浏览器文件缓存了

配置

```js
module.exports = {
  optimization: {
    namedChunks: true,
    moduleIds: 'hashed',
  },
  output: {
    chunkFileName: '[name].[contenthash:8].js'
  }
};
```

## 动态加载

`npm i -D @babel/plugin-syntax-dynamic-import`

babel plugins 添加 @babel/plugin-syntax-dynamic-import

## babel配置

babel-polyfill 和 babel-plugin-transform-runtime 不能同时使用

> 补充几点，一般来说，在自己写框架或者库的时候，使用babel-plugin-transform-runtime是个很好的选择，主要是不污染环境。而如果自己写项目，不使用它，使用babel-polyfill会更简单一些。另外，babel-polyfill和babel-plugin-transform-runtime是独立的，两者没有依赖关系，不要两个一起安装，没意义～

## 优化
构建优化
1. 减少编译体积 ContextReplacementPugin、IgnorePlugin、babel-plugin-import、babel-plugin-transform-runtime。
2. 并行编译 happypack、thread-loader、uglifyjsWebpackPlugin开启并行
3. 缓存 cache-loader、hard-source-webpack-plugin、uglifyjsWebpackPlugin开启缓存、babel-loader开启缓存
4. 预编译 dllWebpackPlugin && DllReferencePlugin、auto-dll-webapck-plugin

性能优化

1. 减少编译体积 Tree-shaking、Scope Hositing。

2. hash缓存 webpack-md5-plugin

3. 拆包 splitChunksPlugin、import()、require.ensure

## Webpack揭秘——走向高阶前端的必经之路

[Webpack揭秘—](https://juejin.im/post/5badd0c5e51d450e4437f07a)

### Webpack运行机制

初始化配置参数 -> 绑定事件钩子回调 -> 确定Entry逐一遍历 -> 使用loader编译文件 -> 输出文件


## 基本配置

### 路径

webpack.config.js
```js
const path = require('path')
module.exports = {
  entry: "./src/app.js",
  output: {
    path: path.resolve(‘dist’),
    filename: ‘bundled.js’
  },
  module: {
    ...
  }
}
```

### webpack4.x 配置 mode

webpack.config.js
```js
module.exports = {
  mode: 'production' // development,production
};
```

## 三十分钟掌握Webpack性能优化
[三十分钟掌握Webpack性能优化](https://juejin.im/post/5b652b036fb9a04fa01d616b)

[手摸手，带你用合理的姿势使用 webpack4（上）](https://juejin.im/post/5b56909a518825195f499806)

## loader 配置

### sass-loader / less-loader

```js
{
  test: /\.scss|sass$/,
  use: ["style-loader", "css-loader", "sass-loader"]
}
{
  test: /\.less$/,
  use: ["style-loader", "css-loader", "less-loader"]
}
```

### 配置html-loader

```js
module: {
  rules: [{
    test: /\.html$/,
    use: [ {
      loader: 'html-loader',
      options: {
        minimize: true
      }
    }],
  }]
}
```


### url-loader
`npm i -D file-loader  url-loader`

webpack.config.js
```js
module.exports = {
  module: {
    rules: [
      {
        test: /\.(png|jpg|gif|ttf|woff|woff2|eot|svg)$/i,
        use: [
          {
            loader: 'url-loader',
            options: {
              limit: 8192
            }
          }
        ]
      }
    ]
  }
}
```

### 配置 css-loader

`npm i css-loader style-loader -D`

```js
{
  test: /\.css$/,
  use: ["style-loader", "css-loader"]
}
```

#### making CSS modular

webpack.config.js
```js
{
  test: /\.css$/,
  use: [
    {
      loader: "style-loader"
    },
    {
      loader: "css-loader",
      options: {
        modules: true,
        importLoaders: 1,
        localIdentName: "[name]_[local]_[hash:5]",
        sourceMap: true,
        minimize: true
      }
    },
    {
      loader: "sass-loader"
    }
  ]
}
```

react 中使用
```js
import style from "./Search.css"
const Search = () => {
  return <div className={style.nameOfYourCSSClass}>
           Hello Search Component :)
         </div>
}
```
### 配置typescript ts-loader

`npm i ts-loader -D`

`tsc --init` 生成`tsconfig.json` 改 `"outDir": ".js"`

webpack.config.js
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

### 使用babel-loader
webpack 4.x | babel-loader 8.x | babel 7.x

`npm install -D babel-loader @babel/core @babel/preset-env webpack`

```js
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

babel for react

`npm i -D @bable/core @babel/preset-env @babel/preset-react babel-loader`

```js
module: {
    rules: [
      {
        test: /\.js|jsx$/, 
        exclude: /node_modules/,
        use: {
          loader: 'babel-loader',
          options: {
            presets: ['@babel/preset-env', '@babel/preset-react']
          }
        }
      }
    ]
  }
```
## 插件配置

### webpack-bundle-analyzer

块分析插件

[webpack-bundle-analyzer](https://github.com/webpack-contrib/webpack-bundle-analyzer)

### uglifyjs-webpack-plugin

代码压缩加速

[github](https://github.com/webpack-contrib/uglifyjs-webpack-plugin)


### MiniCssExtractPlugin

提取css到单独文件，为每个包含css的js文件创建一个css文件

`npm install --save-dev mini-css-extract-plugin`

```js
const MiniCssExtractPlugin = require("mini-css-extract-plugin");
module.exports = {
  plugins: [
    new MiniCssExtractPlugin({
      // Options similar to the same options in webpackOptions.output
      // both options are optional
      filename: "[name].css",
      chunkFilename: "[id].css"
    })
  ],
  module: {
    rules: [
      {
        test: /\.css$/,
        use: [
          {
            loader: MiniCssExtractPlugin.loader,
            options: {
              // you can specify a publicPath here
              // by default it use publicPath in webpackOptions.output
              publicPath: '../'
            }
          },
          "css-loader"
        ]
      }
    ]
  }
}
```
### Clean for WebPack

A webpack plugin to remove/clean your build folder(s) before building
`npm i clean-webpack-plugin --save-dev`

```js
const CleanWebpackPlugin = require('clean-webpack-plugin')
 
// webpack config
{
  plugins: [
    new CleanWebpackPlugin(paths [, {options}])
  ]
}
```

### DefinePlugin
设置全局变量
```js
// webpack.config.js
const webpack = require('webpack');

module.exports = {
  /*...*/
  plugins:[
    new webpack.DefinePlugin({
      'process.env.NODE_ENV': JSON.stringify('production')
    })
  ]
};

原理：DefinePlugin做的工作是在源代码基础上执行的全局查找替换工作，将DefinePlugin插件中定义的变量替换为插件中定义的变量值。
```
### UglifyJsPlugin
代码压缩输出
```js
new webpack.optimize.UglifyJsPlugin({
  compress: {
    warnings: false
  }
})
```
### ExtractTextWebpackPlugin
分离 CSS
```js
var ExtractTextPlugin = require('extract-text-webpack-plugin');
module.exports = {
    module: {
         rules: [{
             test: /\.css$/,
            use: ExtractTextPlugin.extract({
                     fallback: 'style-loader',
                    use: [
                        {
                            loader: 'css-loader',
                            options: {
                                sourceMap: true,
                                importLoaders: 1,
                                modules: true,
                                localIdentName: "[local]---[hash:base64:5]",
                                camelCase: true
                            }
                        }]
            })
         }]
     },
    plugins: [
        new ExtractTextPlugin( ({
            filename: '[name].css',//使用模块名命名
            allChunks: true
        })
    ]
}
```
### CommonsChunkPlugin

多人口时候提取公共模块


### ProvidePlugin
自动加载模块而不需要import 或 require 方法:
`npm install --save-dev extract-text-webpack-plugin`

```js
new webpack.ProvidePlugin({
  identifier: 'module1',
  // ...
})
```

### 配置 webpack-dev-server

`npm i webpack-dev-server -D`

package.json
```js
"scripts": {
    "dev": "webpack-dev-server --mode development --open --hot"
},
```

webpack.config.js
```javascript
const path = require('path');
const webpack = require('webpack');

module.exports = {
  entry: './index.js',

  plugins: [
    new webpack.HotModuleReplacementPlugin() // Enable HMR
  ],

  output: {
    filename: 'main.js',
    path: path.resolve(__dirname, 'dist'),
    publicPath: '/'
  },

  devServer: {
    hot: true, // Tell the dev-server we're using HMR
    contentBase: resolve(__dirname, 'dist'),
    publicPath: '/'
  }
};
```

### AutomaticPrefetchPlugin
在编译前发现全部modules
```js
module.exports = {
  // ...
  plugins: [
    new webpack.AutomaticPrefetchPlugin()
  ]
};
```

### html-webpack-plugin 插件配置

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