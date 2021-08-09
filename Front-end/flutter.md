# Flutter

Flutter还提供了 Material 和Cupertino两种视觉风格的组件库

Gallery源码：Gallery是Flutter官方示例APP，里面有丰富的示例，读者可以在网上下载安装。Gallery的源码在Flutter源码“examples”目录下。

## Android 开启网络

```
<uses-permission android:name="android.permission.INTERNET" />
<uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" />
```

## 打开新页面动画

`OpenContainer()`

## 关闭debug提示

```
MaterialApp(
  debugShowCheckedModeBanner: false
)
```


## flutter web 默认用的canvaskit渲染,会下载一个3.x MB的wasm的文件导致白屏

`flutter build web --web-renderer html`

## 字重对应关系
```
100 - Thin
200 - Extra Light (Ultra Light)
300 - Light
400 - Regular (Normal、Book、Roman)
500 - Medium
600 - Semi Bold (Demi Bold)
700 - Bold
800 - Extra Bold (Ultra Bold)
900 - Black (Heavy)
```

## api参数报错

flutter clean and then restart VS Code

## 手动下载包

`flutter packages get`

## Flutter解决 警告 Waiting for another flutter command to release the startup lock

rm ~/Documents/flutter/bin/cache/lockfile

## Dart DevTools

布局检查工具，性能工具，内存工具，使用 flutter 编写

### Flutter Inspector

了解 widget 层次结构的整体视图

点击节点 -> 点击 Select Widget Mode ，查看节点布局, 在 Detail Tree 可以看到特定的属性, 查看 renderObject 约束

Layout Explorer，可以调整属性值，并且能看到更改热重载到正在运行的应用程序

### 性能问题

打开 Timeline, 选择性能有问题的一帧, 下面展示了时间轴事件，清除记录，使用 Track Widget Builds，在 build 过程, 每个Widget发送事件

夸帧问题，不是单个 flutter 帧，不能好好的在 Timeline 发现, 使用传统的 CPU 分析器来了解发送了什么，点击 Performance 面板

将计算分配到多个帧，或者在另一个线程上运行


## 测试

`flutter analyze` 测试你的代码

## 保持页面状态

with AutomaticKeepAliveClientMixin

## 状态管理

provider

## 持久化

share_preferences

## 深入理解布局约束

首先，上层 widget 向下层 widget 传递约束条件；

然后，下层 widget 向上层 widget 传递大小信息。

最后，上层 widget 决定下层 widget 的位置。

## Flutter解决 警告 Waiting for another flutter command to release the startup lock

删除 lockfile 文件

`rm flutter/bin/cache/lockfile`

`killall -9 dart`

## 发布 Android

https://flutter.dev/docs/deployment/android


## 发布 Web

`flutter build web`

## 创建 demo

`flutter create <projectname>`

或者 vsCode 里 `flutter: new`

## 更新 Flutter

`flutter upgrade`

## flutter 版本

查看版本号 `flutter --version`

查看 `flutter channel`

使用 `flutter channel stable`
