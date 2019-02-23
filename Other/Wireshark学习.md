# Wireshark学习

## 解密 TLS 1.3 数据包

Wireshark -> Preferences -> Protocols -> ssl

配置 RSA keys list: Server 私钥

配置 SSL debug file `/path/to/ssl.log`, Wireshark 日志文件

配置 Pre-Master-Secret log filename `/path/to/sslkeylog.log`, 浏览器密钥保存文件

配置环境变量 `echo "\nexport SSLKEYLOGFILE=~/Documents/me/tls/sslkeylog.log" >> ~/.bash_prefile`

`source .bash_prefile`

命令行启动 Chrome `open /Applications/Google\ Chrome.app/`, 保证 Chrome 能读取到 `SSLKEYLOGFILE`

## 抓取本地数据包

lo 网卡

## 跟踪TCP流
右击TCP，http包 follow -> TCP Stream

## 开启名字解析
Capture -> Option -> Options -> Resolv network names || Resolve transport names

## 捕抓分析

Statistics

## 显示过滤器
ip.addr == ip
!tcp.post == 3389
tcp.flags.syn == 1
http
tcp.port == 23

## 捕抓过滤

host 127.0.0.1 // ipv4或者ipv6
ether host MAC // mac地址
src host ip // 来自ip
dst host ip // 目的地ip
port 8080 // 端口
!posrt 8080 // 8080端口除外的其他端口
dst post 80 // 组合使用
icmp ip dns ipv6 // 协议过滤
tcp[13]==18 // 协议域过滤器


## 时间显示格式

view -> time display format



