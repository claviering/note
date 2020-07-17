# Flutter

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
