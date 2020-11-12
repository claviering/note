# Docker简单搭建Vulfocus靶场

https://mp.weixin.qq.com/s/cUVopiX3T6HX_mY1eMeCUA

Vulfocus 官网：

https://fofapro.github.io/vulfocus/

在线演示：

http://vulfocus.fofa.so/



## 安装

`docker pull vulfocus/vulfocus:latestdocker images`


## 运行 Vulfocus,并查看运行情况

```shell
docker run -d -p 8081:80 -v /var/run/docker.sock:/var/run/docker.sock -e VUL_IP=127.0.0.2 2ff13d764bcf
docker ps
# -v /var/run/docker.sock:/var/run/docker.sock 为 docker 交互连接
# -e DOCKER_URL 为 Docker 连接方式，默认通过 unix://var/run/docker.sock 进行连接，也可以通过 tcp://xxx.xxx.xxx.xxx:2375 进行连接（必须开放 2375 端口）。
# 2ff13d764bcf 镜像ID
# -v /vulfocus-api/db.sqlite3:db.sqlite3 映射数据库为本地文件。
# -e VUL_IP=xxx.xxx.xxx.xxx 为 Docker 服务器 IP ，不能为 127.0.0.1。
```

默认账户密码为 admin/admin

浏览器打开 127.0.0.2:8081