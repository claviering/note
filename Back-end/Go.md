# Golang

[镜像地址](https://goproxy.io/)

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

[gin框架初了解](https://xiaonuo.top/articles/2020/12/14/1607931833092.html)

## 嵌套 JSON

g.H:可以自定义json，一层一层的嵌套返回值，只要每一层加上g.H就好

```go
c.JSON(200,gin.H{
    "message":"123",
    "msg":gin.H{
        "lala":persion,
    },
})
```

## 路由组

```go
	// 2. 集中处理请求,{}花括号去掉也不会报错，这是一个代码书写规范
	// 使用组的时候访问地址就是  address:port/v1/login
	v1:=r.Group("/v1")
	{
		v1.GET("/login",login)
		v1.GET("/submit",submit)
	}
	v2:=r.Group("/v2")
	{
		v2.GET("/add",add)
		v2.GET("/deltel",deltel)
	}

```

## URI数据解析和绑定

```go
type Login struct {
	User string	`uri:"username"`
	Password string	`uri:"password"`
}

func main() {
	// 1. 创建路由
	r:=gin.Default()
	// 2. JSON绑定
	r.GET("/loginUri/:username/:password", func(c *gin.Context) {
		var login Login
		err := c.ShouldBindUri(&login)
		if err != nil {
			//返回错误信息，且返回的内容是一个json格式
			//gin.H封装了生成json数据的工具
			c.JSON(http.StatusBadRequest,gin.H{"error":err.Error(),"status":"400"})
			return
		}
		c.JSON(http.StatusOK,login.User+"----"+login.Password)
	})
	// 3. 监听相应ip和端口，ip为空则为本地
	r.Run(":8000")
}

```

## Gin 获取 JSON格式的请求参数

定义 struct，把数据保存到 struct 中

```go
type Request struct {
  NAME        string `json:"name" binding:"required"`
  PARENT_CODE string `json:"parentCode" binding:"required"`
  LEVEL       int    `json:"level" binding:"required"`
}
var req Request
c.BindJSON(&req)
```

## Gin 获取 Form 格式的请求参数

`c.PostForm("key")`

## 执行不同包的不同文件

go mod init myproject

子模块 `router/main.go`

```go
package router

import "fmt"

func Hello() {
	fmt.Print("Hello")
}
```

主模块 `server.go`
```go
package main

import "myproject/router"

func main() {
  router.Hello()
}
```

## web framework

[Gin](https://github.com/gin-gonic/gin)

## hot reload

[fresh](https://github.com/gravityblast/fresh)