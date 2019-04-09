# openssl 学习

## 私钥中输出公钥

`openssl ec -in tls/server.key -pubout -out public.pem`

## 证书输出公钥

`openssl x509 -pubkey -noout -in server.crt > server.public.key`

## 输出证书信息

`openssl x509 -noout -text -in client/certs/test1.cert.pem`

## 调试 openssl

[bilibili](https://www.bilibili.com/video/av31463471)

[Github](https://github.com/jzysheep/Youtube)

export LD_LIBRARY_PATH=/usr/local/ssl/lib:$LD_LIBRARY_PATH

## 编译安装

下载源代码

之前有 make 过，先执行 `make clean`

`./config --prefix=/Users/linweiye/Documents/openssl-debug --openssldir=/Users/linweiye/Documents/openssl-debug -d shared no-asm no-ssl2 -g3 -ggdb -gdwarf-4 -fno-inline -O0 -fno-omit-frame-pointer`

参数说明
```
--prefix and --openssldir control the configuration of installed components
-d: Debug build of the library
share: Build a shared object in addition to the static archive
no-asm: Disables assembly language routines (and uses C routines)
no-ssl2: Disables SSLv2
no-ssl3: Disables SSLv3
-g3: Include extra debug information. Some debuggers support macro expansions when you use -g3
-ggdb3: Use most expressive format available to produce debugging information
-gdwarf-4: Produce debugging information in DWARF format (if that is supported). For more information, visit: debuggingwith attributedrecord formats
-fno-inline: Do not expand any functions inline apart from those marked with "always_inline" attribute
-O0: Reduce compilation time and make debugging produce the expected results
-fno-omit-frame-pointer: Omitting it makes debugging impossible on some machines (Recommended by official OpenSSL)
```

```
make && make install
```

## openssl 的 Client 测试 0-RTT

`openssl s_client -connect localhost:443 -tls1_3 -keylogfile=/Users/username/Documents/me/tls/sslkeylog.log -sess_out=/Users/username/Documents/tls13.sess`

接下来在复用刚刚的连接，命令如下

`openssl s_client -connect localhost:443 -tls1_3 -keylogfile=/Users/username/Documents/me/tls/sslkeylog.log -sess_in=/Users/username/Documents/tls13.sess -early_data=/Users/username/Documents/req.txt`

req.txt 里面只是简单的写一个 GET 请求:

```
GET / HTTP/1.1
HOST: halfrost.com
Early-Data: 657567765
```

## 口令加密

```
加密
$ openssl enc -base64 -aes-256-cbc -salt -pbkdf2 -in file.txt -out file.txt.enc
解密
$ openssl enc -base64 -aes-256-cbc -d -pbkdf2 -in file.txt.enc -out file.txt
```

非交互

```
加密
$ openssl enc -base64 -aes-256-cbc -salt -pbkdf2 -in file.txt -out file.txt.enc -k PASS
解密
$ openssl enc -base64 -aes-256-cbc -d -pbkdf2 -in file.txt.enc -out file.txt -k PASS
```

## 安装 openssl

### 添加环境变量
`vim ~/.bashrc`
加入下面
`export PATH=~/Documents/openssl-1-1-1/bin:$PATH `

### 创建可信证书库

```
下载 perl 脚本
raw.github.com/bagder/curl/master/lib/mk-ca-bundle.pl
运行
./mk-ca-bundle.pl

sudo cp ~/Downloads/certdata.txt ~/Documents/openssl-1-1-1/certs/
```

### 密钥和证书管理

#### 生成密钥

1. 密钥算法
2. 密钥长度
3. 密码

生成密钥钥(包涵私钥公钥)
`openssl genras -aes128 -out fd.key 2048`
解析出私钥结构
`openssl rsa -text -in fd.key`
查看密钥公开部分
`openssl rsa -in fd.key -pubout -out fd-public.key`
`cat fd-public.key`

DSA 密钥生成

`openssl dsaparam -genkey 2048 | openssl dsa -out dsa.key -ase128`

ECDSA 密钥
`openssl ecparam -genkey -name secp256r1 | openssl ec -out ec.key -aes128`

#### 创建证书签名申请

`openssl req -new -key fd.key -out fd.csr`
检查 csr 是否正确
`openssl req -text -in fd.csr -noout`

非交互式生成 CSR

1. 创建 fd.cnf 文件
```
[ req ]
default_bits       = 4096
default_md         = sha512
default_keyfile    = domain.com.key
prompt             = no
encrypt_key        = no
distinguished_name = req_distinguished_name
# distinguished_name
[ req_distinguished_name ]
countryName            = "DE"                     # C=
localityName           = "Berlin"                 # L=
organizationName       = "My Company"             # O=
organizationalUnitName = "Departement"            # OU=
commonName             = "*.domain.com"           # CN=
emailAddress 
```
`openssl req -new -config fd.cnf -key fd.key -out fd.csr`

#### 自签名证书

如果有了 CSR, 使用下面文件创建证书

`openssl x509 -req -days 365 -in fd.csr -signkey fd.key -out fd.crt`

直接使用私钥创建自签名证书

`openssl req -new -x509 -days 365 -key fd.key -out fd.crt`

#### 创建对多个主机名有效的证书

文件 fd.ext

`subjectAltName = DNS:*.example.com, DNS: example.com`
`openssl x509 -req -days 365 -in fd.csr -signkey fd.key -out fd.crt extfile fd.ext`
#### 检查证书

`openssl x509 -text -in fd.crt -noout`

#### 密钥和证书格式转换

PEM -> DER
`openssl x509 -infom PEM -in fd.pem -outform DER -out fd.der`
DER -> PEM
`openssl x509 -infom DER -in fd.der -outform PEM -out fd.pem`

## 配置

### 获取所支持的套件列表

`openssl ciphers -V/-v 'ALL:COMPLEMENTOFALL`
`openssl ciphers -V/-v 'RC4`

## 性能

`openssl speed rc4 aes rsa ecdh sha`
`openssl speed ras`
`openssl speed -multi 4 ras`

## 创建根 CA

## 创建二级 CA

## 连接 SSL 服务

`openssl s_client -connect www.example.com:443`

```
# HTTPS
openssl s_client -connect remote.host:443

# LDAPS
openssl s_client -connect remote.host:636

# IMAPS
openssl s_client -connect remote.host:993

# POP3S
openssl s_client -connect remote.host:995
```

## 生成椭圆曲线密钥

`openssl ecparam -out key.pem -name prime256v1 -genkey`

## 测试一个数是否为素数
`openssl prime 119054759245460753`
返回的是16进制数

## 生成随机数

```
# 直接在控制台输出128位base64格式的随机数
openssl rand -base64 128

# 在指定的文件中输出1024位二进制随机数
openssl rand -out random-data.bin 1024

# 从浏览器缓存取到半随机子节数据作为种子来生成随机数
cd $(find ~/.mozilla/firefox -type d -name Cache)
openssl rand -rand $(find . -type f -printf '%f:') -base64 1024

```