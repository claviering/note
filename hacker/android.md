# Android 逆向

1. apktool d -s -f your.apk -o your // 得到 classes.dex
2. sh d2j-dex2jar.sh ~/path/to/classes.dex // 得到 classes-dex2jar.jar
3. jd-gui 打开 classes-dex2jar.jar // 在 dex2jar-2.1 目录下面

## HttpCanary

HttpCanary 是 Android 平台下功能最强大的抓包和注入工具

https://github.com/99969/HttpCanary/blob/master/zh-CN/README.md

HttpCanary was renamed to Reqable, see more here: https://github.com/reqable/reqable-app

[Android 分享] 小黄鸟HttpCanary抓包 5个版本 都是解锁版 + 证书安装教程

https://www.52pojie.cn/thread-1592529-1-1.html