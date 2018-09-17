# IDA 反编译学习笔记

IDA是用来分析代码的，找到对应的二进制数据，再用16进制编辑器(sublime)打开修改。
IDA里也可以直接修改，在16进制视图，F2修改，再F2保存，最后保存到exe文件中，Edit ->Patch Program -> Apply patches to input file。16进制里看到的比特是翻转的，正常15表示是F0，在16进制编辑器里看到的是0F，两个一起是8位，一个字节

### 如何显示C伪代码
如果有[Main menu]->[View]->[Open SubViews]->[Pseudocode F5]菜单，说明你已经安装了Hex Rays decompiler插件，可以在查看汇编的时候，按[F5]打开伪代码子窗口

没有就[安装 https://derevenets.com](https://derevenets.com/)，添加插件，把下载到的文件放到安装目录的plugins下。

### 反编译工具 
snowman 超强，可以看C的伪代码



