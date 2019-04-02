# 压力测试工具

安装看文档

使用

`siege -H 'Content-Type: application/json' -c 10 -t 60S 'https://localhost:8400/api/user/login POST < data.json'`

多个请求头

`siege -H 'Content-Type: application/json' -H 'Is-Early-Data: 1'`