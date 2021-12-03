# Golang

[镜像](https://goproxy.io/)

```shell
# Set the GOPROXY environment variable
export GOPROXY=https://goproxy.io,direct
# Set environment variable allow bypassing the proxy for specified repos (optional)
export GOPRIVATE=git.mycompany.com,github.com/my/private
```
执行
```shell
go env -w GO111MODULE=on
go env -w GOPROXY=https://goproxy.io,direct
```