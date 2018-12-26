# openssl 学习

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