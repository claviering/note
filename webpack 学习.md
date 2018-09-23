#  webpack 学习

<!-- TOC -->

- [webpack 学习](#webpack-%E5%AD%A6%E4%B9%A0)
  - [基本配置](#%E5%9F%BA%E6%9C%AC%E9%85%8D%E7%BD%AE)
    - [路径](#%E8%B7%AF%E5%BE%84)
    - [x 配置 mode](#x-%E9%85%8D%E7%BD%AE-mode)
  - [三十分钟掌握Webpack性能优化](#%E4%B8%89%E5%8D%81%E5%88%86%E9%92%9F%E6%8E%8C%E6%8F%A1webpack%E6%80%A7%E8%83%BD%E4%BC%98%E5%8C%96)
  - [loader 配置](#loader-%E9%85%8D%E7%BD%AE)
    - [sass-loader / less-loader](#sass-loader--less-loader)
    - [配置html-loader](#%E9%85%8D%E7%BD%AEhtml-loader)
    - [url-loader](#url-loader)
    - [配置 css-loader](#%E9%85%8D%E7%BD%AE-css-loader)
      - [making CSS modular](#making-css-modular)
    - [配置typescript ts-loader](#%E9%85%8D%E7%BD%AEtypescript-ts-loader)
    - [使用babel-loader](#%E4%BD%BF%E7%94%A8babel-loader)
  - [插件配置](#%E6%8F%92%E4%BB%B6%E9%85%8D%E7%BD%AE)
    - [uglifyjs-webpack-plugin](#uglifyjs-webpack-plugin)
    - [MiniCssExtractPlugin](#minicssextractplugin)
    - [Clean for WebPack](#clean-for-webpack)
    - [DefinePlugin](#defineplugin)
    - [UglifyJsPlugin](#uglifyjsplugin)
    - [ExtractTextWebpackPlugin](#extracttextwebpackplugin)
    - [CommonsChunkPlugin](#commonschunkplugin)
    - [ProvidePlugin](#provideplugin)
    - [配置 webpack-dev-server](#%E9%85%8D%E7%BD%AE-webpack-dev-server)
    - [AutomaticPrefetchPlugin](#automaticprefetchplugin)
    - [html-webpack-plugin 插件配置](#html-webpack-plugin-%E6%8F%92%E4%BB%B6%E9%85%8D%E7%BD%AE)

<!-- /TOC -->
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

### x 配置 mode

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
提取公共模块


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