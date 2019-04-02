# 性能测试

ab的全称是ApacheBench，是 Apache 附带的一个小工具，专门用于 HTTP Server 的benchmark testing，可以同时模拟多个并发请求。

> https://www.jianshu.com/p/43d04d8baaf7

> https://blog.einverne.info/post/2018/10/ab-apache-bench-tool-load-testing.html

ab 只能测试简单的 RESTful 接口，只能应付简单的压测任务。如果需要更加专业的压测工具可以使用 jmeter。

发送 POST 参数，需要加 `application/json` 请求头

`ab -c 1 -n 1 -p data.json -T application/json http://localhost:8600/api/user/login`