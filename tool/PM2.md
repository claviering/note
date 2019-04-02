# PM 2

Node Server 监视器

[Github](https://github.com/Unitech/PM2/)

```shell
pm2 start app.js -i 4 # 4进程，负债均衡
pm2 start app.js -i max # 最大CPU数进程数，负债均衡
```