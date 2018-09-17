# Android Studio学习

## 模拟器打不开

删除所有andriod模拟器，卸载重新安装
File -> Settings -> Appearance & Behavior -> System Setting -> Android SDK -> SDK Tools -> Intel x86 Emulator Accelerator (HAXM installer)
把这个删了 再安装，去勾删除，打勾安装，安装失败查看日志，提示windows要关闭Hyper
管理员打开cmd
```
dism.exe /Online /Disable-Feature:Microsoft-Hyper-V 关闭
dism.exe /Online /Enable-Feature:Microsoft-Hyper-V /All 开启
```

再去安装一次模拟器，添加模拟器就行了



