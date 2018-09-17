# Python学习

## Python 调试功能

Thonny

## 虚环境安装

给每个python项目提供不同环境，python版本，数据库版本等
```
pip install virtualenv  //安装
cd dir  //进项目目录
virtualenv venv //新建venv目录,负责系统python到venv
./venv/bin/pip install tornado //虚环境安装tornado
./venv/bin/python xxxx.py //虚环境运行xxxx.py
source ./venv/bin/activate //activate命令启动虚环境，不用显式调用虚环境bin
deactivate //退出虚环境
// 使用``~/.bashrc``的一个环境变量将解释器改为全局性的：
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python2.7
```

## xampp Apache服务器配置Python
打开httd.conf

AddHandler cgi-script .cgi .pl .asp 添加.py
AddHandler cgi-script .cgi .pl .asp .py
把mycgi-test.py放到xampp\cgi-bin下,浏览器打开
localhost/cgi-bin/mycgi-test.py

mycgi-test.py代码
```
#! C:\Python27\python.exe # python接收器路径
 
print 'Content-type:text/plain'
print
 
print"Hello Cooder"
```
## window上cmd显示中文问题

在程序里打中文编码为unicode编码，就是utf-8
print u"中文"  #前面加上u
s="爱你"
print s.decode('utf-8')  #或者强制编码
## 调试
python -m pdb my.py
b 10 第10行断点
n next
s step
l list
p print
c contune
q quit
j 10 jump 10 跳到第10行
直接回车是重复前一条命令!

