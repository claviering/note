# Nginx 学习

[Nginx 入门](https://xuexb.github.io/learn-nginx/guide/)

[Nginx 示例](https://xuexb.github.io/learn-nginx/example/)

## proxy_pass demo

[proxy_pass url 反向代理的坑](https://xuexb.github.io/learn-nginx/example/proxy_pass.html#url-%E5%8F%AA%E6%98%AF-host)

客户端请求 URL https://172.16.1.1/hello/world.html

第一种场景 后面url加 /
```
location /hello/ {
    proxy_pass http://127.0.0.1/;
}
```
结果：代理到URL：http://127.0.0.1/world.html

第二种场景 后面url没有 /
```
location /hello/ {
    proxy_pass http://127.0.0.1;
}
```
结果：代理到URL：http://127.0.0.1/hello/world.html

第三种场景 后面url添加其它路由，并且最后添加 /
```
location /hello/ {
    proxy_pass http://127.0.0.1/test/;
}
```
结果：代理到URL：http://127.0.0.1/test/world.html

第四种场景 后面url添加其它路由，但最后没有添加 /
```
location /hello/ {
    proxy_pass http://127.0.0.1/test;
}
```
结果：代理到URL：http://127.0.0.1/testworld.html

## 文件类型

```
types {
    text/html                             html htm shtml;
    text/css                              css;
    text/xml                              xml;
    image/gif                             gif;
```

## http 服务器文件默认目录

/usr/share/nginx/html

## 配置文件路径

1. /etc/nginx/nginx.conf
2. /usr/local/nginx/conf/nginx.conf

## CentOS 安装

https://nginx.org/en/linux_packages.html#RHEL-CentOS

## 编译安装

[下载源代码](https://nginx.org/download/)

安装 pcre (注意，不能安装 pcre2, nginx 会报错 fatal error: 'pcre.h' file not found)
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
$ sudo make
$ sudo make install
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

## 配置备份

```

#user  nobody;
worker_processes  1;

#error_log  logs/error.log;
#error_log  logs/error.log  notice;
#error_log  logs/error.log  info;

#pid        logs/nginx.pid;


events {
    worker_connections  1024;
}


http {
    include       mime.types;
    default_type  application/octet-stream;

    #log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '
    #                  '$status $body_bytes_sent "$http_referer" '
    #                  '"$http_user_agent" "$http_x_forwarded_for"';

    #access_log  logs/access.log  main;

    sendfile        on;
    #tcp_nopush     on;

    #keepalive_timeout  0;
    keepalive_timeout  65;

    #gzip  on;

    server {
        listen       80;
        server_name  localhost;
        # return 301 https://localhost;
        #charset koi8-r;

        #access_log  logs/host.access.log  main;

        location / {
            root   html;
            index  index.html index.htm;
        }

        #error_page  404              /404.html;

        # redirect server error pages to the static page /50x.html
        #
        error_page   500 502 503 504  /50x.html;
        location = /50x.html {
            root   html;
        }

        # proxy the PHP scripts to Apache listening on 127.0.0.1:80
        #
        #location ~ \.php$ {
        #    proxy_pass   http://127.0.0.1;
        #}

        # pass the PHP scripts to FastCGI server listening on 127.0.0.1:9000
        #
        #location ~ \.php$ {
        #    root           html;
        #    fastcgi_pass   127.0.0.1:9000;
        #    fastcgi_index  index.php;
        #    fastcgi_param  SCRIPT_FILENAME  /scripts$fastcgi_script_name;
        #    include        fastcgi_params;
        #}

        # deny access to .htaccess files, if Apache's document root
        # concurs with nginx's one
        #
        #location ~ /\.ht {
        #    deny  all;
        #}
    }


    # another virtual host using mix of IP-, name-, and port-based configuration
    #
    server {
        listen 8000;
        server_name boss.fpdev.trendy-global.com;
        location / {
            proxy_set_header Host $host;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_pass http://127.0.0.1:8004;
        }
    }
    server {
        listen 8000;
        server_name mmsfe.fpdev.trendy-global.com;
        location / {
            proxy_set_header Host $host;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_pass http://127.0.0.1:8005;
        }
    }
    server {
        listen 8000;
        server_name crmfe.fpdev.trendy-global.com;
        location / {
            proxy_set_header Host $host;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_pass http://127.0.0.1:8010;
        }
    }
    server {
        listen 8000;
        server_name me.fpdev.trendy-global.com;
        location / {
            proxy_set_header Host $host;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_pass http://127.0.0.1:8081;
        }
    }
    server {
        listen 9000;
        server_name passport.example.com;
        location / {
            proxy_redirect off;
            proxy_set_header Host $host;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_pass http://127.0.0.1:7000;
        }
    }
    server {
        listen 9000;
        server_name sit1.example.com;
        location / {
            proxy_redirect off;
            proxy_set_header Host $host;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_pass http://127.0.0.1:7001;
        }
    }
    server {
        listen 9000;
        server_name sit2.example.com;
        location / {
            proxy_redirect off;
            proxy_set_header Host $host;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_pass http://127.0.0.1:7002;
        }
    }
    server {
        listen  8082;
        server_name 127.0.0.1;
        
        location / {
            proxy_pass  http://127.0.0.1:8082;
        }
        
        location ~ /api/ {
            proxy_set_header Host $host;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_pass  http://shop.fpsit.trendy-global.com;
        }
    }
    # 本地 build 生产 dist 目录测试
    # dist
    server {
        listen  8083;
        server_name me.fpdev.trendy-global.com;

        access_log  logs/8083.access.log;
        error_log  logs/error.log;

        location / {
            root dist;
            index  index.html;
        }
        
        location /api {
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header Host $http_host;
            proxy_set_header X-NginX-Proxy true;
            proxy_pass  http://127.0.0.1:3009;
            proxy_redirect off;
        }
    }


    # HTTPS server
    #
    map $http_upgrade $connection_upgrade {
    default upgrade;
    '' close;
    }
    upstream websocket {
        server 127.0.0.1:8200;  #这里可以是多个服务端IP（分多行），设置权重就可以实现负载均衡了
    }
    # 默认代理
    server {
        listen 443 ssl http2;
        listen [::]:443 ssl http2;
        server_name     localhost;
        # 开启 HSTS 315360000 秒 = 10年
        add_header Strict-Transport-Security "max-age=0; includeSubDomains" always;
        # 证书
        ssl_certificate      /Users/linweiye/Documents/me/tls/server.crt;
        # 私钥
        ssl_certificate_key  /Users/linweiye/Documents/me/tls/server.key;
        ssl_protocols        TLSv1.3 TLSv1.2 TLSv1.1;
        ssl_prefer_server_ciphers  on;
        # 0-RTT 模式
        ssl_early_data on;
        proxy_set_header Early-Data $ssl_early_data;
        ssl_ciphers TLS13-CHACHA20-POLY1305-SHA256:!TLS13-AES-128-GCM-SHA256:!TLS13-AES-256-GCM-SHA384:;
        # ssl_ciphers TLS-CHACHA20-POLY1305-SHA256;
    
        location / {
            root   html;
            index  https.html;
        }
        access_log  logs/https.access.log;
        error_page  404              /404.html;
        error_page  500 502 503 504  /50x.html;
        location = /50x.html {
            root   html;
        }
    }
    # 毕业论文代码
    server {
        listen 8400 ssl http2;
        listen [::]:8400 ssl http2;
        server_name     localhost;
        # 开启 HSTS 315360000 秒 = 10年
        add_header Strict-Transport-Security "max-age=0; includeSubDomains" always;
        # 证书
        ssl_certificate      /Users/linweiye/Documents/me/tls/server.crt;
        # 私钥
        ssl_certificate_key  /Users/linweiye/Documents/me/tls/server.key;
        ssl_protocols        TLSv1.3 TLSv1.2 TLSv1.1;
        ssl_prefer_server_ciphers  on;
        # 0-RTT 模式
        ssl_early_data on;
        proxy_set_header Early-Data $ssl_early_data;
        ssl_ciphers TLS13-CHACHA20-POLY1305-SHA256:!TLS13-AES-128-GCM-SHA256:!TLS13-AES-256-GCM-SHA384:;
        # ssl_ciphers TLS-CHACHA20-POLY1305-SHA256;
    
        location / {
            # early data 请求头
            proxy_set_header Early-Data $ssl_early_data;
            proxy_set_header Host $host;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header Upgrade $http_upgrade;
            proxy_set_header Connection "Upgrade";
            proxy_pass http://127.0.0.1:8600;
        }
        access_log  logs/thesis.access.log;
        error_page  404              /404.html;
        error_page  500 502 503 504  /50x.html;
        location = /50x.html {
            root   html;
        }
    }

    # 小程序开发使用
    # server {
    #     listen 443 ssl http2;
    #     listen [::]:443 ssl http2;
    #     server_name     scnu.club;
    #     # 开启 HSTS 315360000 秒 = 10年
    #     add_header Strict-Transport-Security "max-age=315360000; includeSubDomains" always;
    #     # 证书
    #     ssl_certificate      /Users/linweiye/Documents/me/wepy-demo-server/app/env/scnu.crt;
    #     # 私钥
    #     ssl_certificate_key      /Users/linweiye/Documents/me/wepy-demo-server/app/env/scnu-without-passphrase.key;
    #     ssl_protocols        TLSv1 TLSv1.1 TLSv1.2;
    #     ssl_ciphers ALL:!ADH:!EXPORT56:RC4+RSA:+HIGH:+MEDIUM:+LOW:+SSLv2:+EXP;
    #     ssl_prefer_server_ciphers  on;
    #     access_log  logs/scnu.access.log;
    #     error_log   logs/scnu.error.log;
    #     error_page  404              /404.html;
    #     error_page  500 502 503 504  /50x.html;
    #     location / {
    #         proxy_http_version 1.1;
    #         proxy_set_header Host $host;
    #         proxy_set_header X-Real-IP $remote_addr;
    #         proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    #         proxy_set_header Upgrade $http_upgrade;
    #         proxy_set_header Connection "Upgrade";
    #         proxy_read_timeout 300s;
    #         proxy_connect_timeout 75s;
    #         proxy_pass http://127.0.0.1:8200;
    #     }
    #     location = /50x.html {
    #         root   html;
    #     }
    # }
}
```