# Hook框架frida

Android逆向，逆向安卓app，注入脚本

[详解Hook框架frida，让你在逆向工作中效率成倍提升](https://zhuanlan.zhihu.com/p/41662447)

[这恐怕是学习Frida最详细的笔记了](https://eternalsakura13.com/2020/07/04/frida/)

[实用FRIDA进阶：内存漫游、hook anywhere、抓包](https://www.anquanke.com/post/id/197657)

[Android之Frida框架完全使用指南](https://blog.csdn.net/qq_38474570/article/details/120876120)

https://frida.re/docs/android/

## 安装

```shell
pip install frida-tools
frida --version
frida-ps --version
```

## adb 命令

```shell
export ANDROID_HOME=/Users/yourname/Library/Android/sdk

#Android path

export PATH=$PATH:$ANDROID_HOME/platform-tools

export PATH=$PATH:$ANDROID_HOME/tools
```

## frida查看当前存在的进程

`frida-ps -U`

## 启动 frida-server

```shell
$ adb root # might be required
$ adb push frida-server /data/local/tmp/
$ adb shell "chmod 755 /data/local/tmp/frida-server"
$ adb shell "/data/local/tmp/frida-server &"
```

Some apps might be able to detect the frida-server location. Renaming the frida-server binary to a random name, or moving it to another location such as /dev may do the trick.

Next, make sure `adb` can see your device:

`$ adb devices -l`

Now, on your desktop it’s time to make sure the basics are working. Run:

`$ frida-ps -U`