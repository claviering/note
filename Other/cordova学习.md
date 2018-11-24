# cordova学习

## 浏览器查看
cordova serve android

## cordova run android

## cordova build -release

## vue中使用cordova控制手机硬件

[demo](https://github.com/kartsims/vue-cordova-demo)
[Documentation](http://kartsims.github.io/vue-cordova/)

[教程](https://www.w3cschool.cn/cordova/cordova_back_button.html)

在vue项目先build
```
npm run build
```
在cordova项目编译，生成app
```
cordova build -release
```

## 添加app图标，开机界面


[连接](https://blog.csdn.net/Lc_style/article/details/78401105)

## 按2次返回键退出程序
安装插件
```
cordova plugin add cordova-plugin-backbutton
```
参考网站
```
https://github.com/scriptPilot/app-framework/issues/618

https://cordova.apache.org/docs/en/4.0.0/cordova/events/events.backbutton.html

https://stackoverflow.com/questions/49510163/cordova-android-backbutton-confirmation-message

https://cordova.apache.org/docs/en/latest/reference/cordova-plugin-camera/index.html
```

## 引进cordova.js文件
在index.html加入body下面加入
```
<script type="text/javascript" src="codova.js"></script>
```
在组件的methods的onclick函数中添加js代码

## 在开发环境图片现在，build之后不显示,打包app不显示

打开build/utils.js
publicPath: '../../',  添加上这个
```
    // Extract CSS when that option is specified
    // (which is the case during production build)
    if (options.extract) {
      return ExtractTextPlugin.extract({
        use: loaders,
        publicPath: '../../',  添加上这个
        fallback: 'vue-style-loader'
      })
    } else {
      return ['vue-style-loader'].concat(loaders)
    }
  }
```




