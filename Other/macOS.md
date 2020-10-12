# mac


## 查看文件夹大小

du -h -d 1 [dir]

## 网易云音乐导入本地音乐

1. 该文件夹中并没有隐藏的global mata配置文件
2. 从网易云音乐下载的音乐比外部的mp3文件多了一个文件属性"comment"，包含大量meta信息

通过反复测试，可发现：1) 云音乐comment中的musicid字段必不可缺 2）musicid全局唯一 3) 云音乐不care musicid是否存在（可以理解，毕竟用户并非时时刻刻都联网）；因此最终解决方案：为每个外部文件赋予一个uniq musicid

作者：WSHEN2020
链接：https://www.zhihu.com/question/46370870/answer/1314152754
来源：知乎
著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。

```
pip install eyeD3
eyeD3 梦然...少年.mp3 --add-comment 'music\:{"musicId"\:1599824372162,"musicName"\:"少年","artist"\:[["梦然",20200718]],"albumId"\:2521314,"album"\:"少年","albumPicDocId"\:4449723557617720,"albumPic"\:"https\://baike.baidu.com/pic/%E5%B0%91%E5%B9%B4/22741217/1/d833c895d143ad4b4b16309a8d025aafa40f06ab?fr=lemma#aid=1&pic=d833c895d143ad4b4b16309a8d025aafa40f06ab","bitrate"\:320000,"mp3DocId"\:5726256557462066,"duration"\:249182,"mvId"\:326166,"alias"\:[]}'
```


## MacBook 重新创建账户

MacBook 重新创建账户
1. 长按cmd+S
2. fsck -y
3. mount -uaw /
4. rm /var/db/.AppleSetupDone
5. reboot

## 多开微信

open -n /Applications/WeChat.app/Contents/MacOS/WeChat

## 全屏

`control + command + F`

## 截图

cmd+shift+3：对整个屏幕进行截图；

cmd+shift+4：对自行选择的区域进行截图；

cmd+shift+4+space（空格键）：对选定的某个应用程序界面窗口进行截图。使用 Snip滚动截图，实现对一个网页的长截图

## 切换不同的 shell

列出全部 shell `cat /etc/shells`

- 使用 zsh `chsh -s /bin/zsh`
- 使用 bash `chsh -s /bin/bash`

## IOS 调试器

Command + Space 输入 Simulator, mac 上打开 safari, develop -> simulator 选择模拟器的页面调试

## 3指滑动复制

System -> Preferences -> Accessibilty -> Mouse & Trackpad -> Trackpad Options -> Enable deagging -> three finger drag

## 文件剪切

1. command + C
2. option + command + V

## 1/4 调节亮度/音量

Shift + option + 亮度/音量

## 截屏

command + Shift + 5