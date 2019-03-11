# Nginx 学习

## 编译安装

[下载源代码](https://nginx.org/download/)

安装 pcre
```
$ wget ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/pcre-8.42.tar.gz
$ tar -zxf pcre-8.42.tar.gz
$ cd pcre-8.42
$ ./configure
$ make
$ sudo make install
```

安装 zlib
```
$ wget http://zlib.net/zlib-1.2.11.tar.gz
$ tar -zxf zlib-1.2.11.tar.gz
$ cd zlib-1.2.11
$ ./configure
$ make
$ sudo make install
```

安装 openssl

```
$ wget http://www.openssl.org/source/openssl-1.0.2q.tar.gz
$ tar -zxf openssl-1.0.2q.tar.gz
$ cd openssl-1.0.2q
$ ./Configure darwin64-x86_64-cc --prefix=/usr
$ make
$ sudo make install
```

安装 nginx
```
$ wget https://nginx.org/download/nginx-1.15.7.tar.gz
$ tar zxf nginx-1.15.7.tar.gz
$ cd nginx-1.15.7
$ ./configure --with-pcre=../pcre-8.42 --with-zlib=../zlib-1.2.11 --with-http_ssl_module --with-stream --with-mail=dynamic --with-openssl=/Users/linweiye/Documents/openssl-OpenSSL_1_1_1 --with-http_v2_module
```

nginx 配置文件目录
```
/usr/local/nginx
```

## 配置 TLS 1.3

server {
      listen          443 ssl http2;
      listen [::]:443 ssl http2;
      server_name     127.0.0.1;

      # 证书
      ssl_certificate      /Users/linweiye/Documents/me/tls/server.crt;
      # 私钥
      ssl_certificate_key  /Users/linweiye/Documents/me/tls/server.key;
      ssl_protocols        TLSv1 TLSv1.1 TLSv1.2 TLSv1.3;

      ssl_protocols              TLSv1.1 TLSv1.2 TLSv1.3;
      ssl_prefer_server_ciphers  on;
      ssl_ciphers                TLS-CHACHA20-POLY1305-SHA256:TLS-AES-256-GCM-SHA384:TLS-AES-128-GCM-SHA256:HIGH:!aNULL:!MD5;
  
      location / {
          root   html;
          index  index.html index.htm;
      }
  }

## 基本命令

检查配置
`nginx -t`

```
nginx              启动 nginx
nginx -t           检查配置
nginx -s reload    在不重新启动nginx的情况下重新加载配置文件
nginx -s reopen    重启 nginx
nginx -s stop      停止 nginx
nginx -s quit      停止 nginx
```

## 在线配置

[在线配置](https://www.nginxconfig.io)

反向代码

## 启用 TLS
```
server {
  listen 192.168.0.1:443 ssl;
  server_name www.example.com;
}
```

## 配置 TLS

```
# 启用所有协议,禁用已废弃的不安全的 SSL 2 和 SSL 3
ssl_protocols TLSv1 TLSv1.1 TLSv1.2
# 握手时启用服务器算法优先
ssl_prefer_server_ciphers on;
# 指定使用的算法套件以及优先顺序
ssl_ciphers "太多了不抄了"
```

## 配置密钥和证书

```
# 私钥
ssl_certificate_key server.key;
# 证书
ssl_certificate server.crt;
```

## 通配符证书和多站点证书

```
ssl_certificate_key server.key;
ssl_certificate server.crt;
# site1
server {
  listen 192.168.0.1:443 ssl;
  server_name site1.example.com;
}
# site2
server {
  listen 192.168.0.1:443 ssl;
  server_name site2.example.com;
}
```