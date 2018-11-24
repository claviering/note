# jenkins 学习

一键部署到服务器

## 安装

安装 java 8

## jenkins 下载

mac OS 下载目录 Application/Jenkins/jenkins.war

复制 jenkins.war 去别的目录

## 运行

java -jar jenkins.war --httpPort=9090

## 配置

浏览器打开 localhost:9090 

复制密码 /Users/linweiye/.jenkins/secrets/initialAdminPassword

### 安装插件

全部安装上就没错了

### 创建 Admin

root toor

## 新建

new project -> Maven project

## 配置 Global Tool Configuration

### 配置 JDK

查看 java 安装路径

`/usr/libexec/java_home -V`

添加 djk
`/Library/Java/JavaVirtualMachines/jdk1.8.0_192.jdk/Contents/Home`

### 配置 maven

google 下载 

添加路径