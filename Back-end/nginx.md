# Nginx 学习

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