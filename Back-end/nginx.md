# Nginx 学习

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
nginx -s reload    在不重新启动nginx的情况下重新加载配置文件
nginx -s reopen    重启nginx
nginx -s stop      停止nginx
nginx -s quit      停止nginx
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