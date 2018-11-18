# SSL/TLS学习
[toc]

## 安装openssl

1. 下载openssl 1.0.2版本
2. 安装perl
3. [安装nasm](https://www.nasm.us/pub/nasm/releasebuilds/2.13.03/win64/), 设置环境变量
4. perl Configure VC-WIN32
5. ms\do_win64i
6. nmake -f ms\ntdll.mak // 设置nmake环境变量在vs目录下
7. cd out32dll
8. ..\ms\test



## False Start
Google在2010年提议修改TLS协议....
[Ilya crigorik 致力提高TLS性能](https://www.igvita.com/)
## TLS协议优化
HTTPS权威指南第9章
### 密钥交换
- 密钥长度
- 密钥算法

### 证书
- 使用尽可能少的证书
- 只包含必须的证书
- 提供完整的证书链
- 使用椭圆曲线证书链
- 小心同一张证书绑定过多域名

### 吊销检查
- 使用带OCSP信息的证书
- 使用巨涌快速且可靠的OCSP响应程序的CA
- 部署OCSP stapling

### 会话恢复

### 传输开销

### 对称加密

### 

## TLS的设计目标
1. 密码学安全
 - 保密性
 - 完整性
 - 认证
2. 互操作，通用性
3. 可拓展
4. 高效率

## 密码学通信协议也是分层构造得到
1. 最底层是基础算法原语的实现，例如: aes , rsa， md5, sha256，ecdsa, ecdh 等
2. 其上是选定参数后，符合密码学里标准分类的算法，包括块加密算法，签名算法，非对称加密算法，MAC算法等，例如： aes-128-cbc-pkcs7，rsaes-oaep ，rsassa-pkcs1-v1_5, hmac-sha256，ecdsa-p256，curve25519 等
3. 再其上，是把多种标准算法组合而成的半成品组件，例如：对称传输组件例如 aes-128-cbc + hmac-sha256，aes-128-gcm，认证密钥协商算法: rsassa-OAEP + ecdh-secp256r1，数字信封：rsaes-oaep + aes-cbc-128 + hmac-sha256 ，文件密码加密存储组件：pbkdf2+aes-128-cbc-hmac-sha256，密钥扩展算法 PRF-sha256 等
4. 再其上，是用各种组件拼装而成的各种成品密码学协议/软件，例如：tls协议，ssh协议，srp协议，gnupg文件格式，iMessage协议，bitcoin协议等等

## Record 协议 -- 从应用层接受数据，并且做:
1. 分片，逆向是重组
2. 生成序列号，为每个数据块生成唯一编号，防止被重放或被重排序
3. 压缩，可选步骤，使用握手协议协商出的压缩算法做压缩
4. 加密，使用握手协议协商出来的key做加密/解密
5. 算HMAC，对数据计算HMAC，并且验证收到的数据包的HMAC正确性
6. 发给tcp/ip，把数据发送给 TCP/IP 做传输(或其它ipc机制)。

## IV
伪随机数生成器(CSPRNG)生成，并且必须是不可预测的，在Linux下，就是用用/dev/urandom，或者用 openssl 库的 RAND_bytes()。

## 密码学是科学

SSL协议位于TCP/IP协议与各种应用层协议之间，为数据通讯提供安全支持。SSL协议可分为两层： SSL记录协议（SSL Record Protocol）：它建立在可靠的传输协议（如TCP）之上，为高层协议提供数据封装、压缩、加密等基本功能的支持。 SSL握手协议（SSL Handshake Protocol）：它建立在SSL记录协议之上，用于在实际的数据传输开始前，通讯双方进行身份认证、协商加密算法、交换加密密钥等。

TLS：(Transport Layer Security，传输层安全协议)，用于两个应用程序之间提供保密性和数据完整性。

TLS 1.0版本等于SSL 3.1版本

TLS的MAC算法使用的是HMAC算法

TLS使用了称为PRF的伪随机函数来将密钥扩展成数据块

## 名词解释

### 密钥

n 位比特的数

### 证书
证书字段
- 版本
- 序列号
- 签名算法
- 颁发者
- 有效期
- 使用者 
- 公钥

生成证书
1. 生成公钥和私钥
2. 根据需求填写证书名称，颁发者，公钥
3. 对证书内容做摘要 MD5/SHA,用私钥对结果签名,即用私钥加密MAC,结果添加到证书里面

证书验证
1. 求证书内容 MAC
2. 用公钥解密证书的签名 MAC'
3. 对比 MAC 和 MAC'

由 CA 颁发证书
### 公钥基础设施 

公钥基础设施 ( public key infrastructure, PKI )

目标: 实现不同成员在不见面的情况下进行安全通信

### 证书颁发机构

证书颁发机构 ( certification authority, CA )

功能: 签发证书

### 消息认证码 ( MAC )

消息连同 MAC 一起发送给接收方

### SHA 安全散列函数
SHA-512