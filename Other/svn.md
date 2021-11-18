# svn

## 将文件拉到本地目录

svn checkout 简写（svn co）

- 第一次用

svn checkout url --username=*** --password=*** path

`svn co svn://0.0.0.0`

其中url是服务器地址 path是将要拷贝的地址

或者svn checkout url　path 回车会提示输入用户名和密码

- 不是第一次，已经验证过用户名和密码

svn checkout url 就可以了

## 查看文件或者目录状态

svn status path（目录下的文件和子目录的状态，正常状态下不显示）

## 不下载文件查看文件

svn list url