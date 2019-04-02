# mongodb 可视化工具

下载

npm start 启动

App 密码配置在 config/app.json 默认 secureadminpassword

```
{
  "app": {
      "host": "127.0.0.1",
      "port": 8700,
      "password": "secureadminpassword",
      "context": "dbApp",
      "monitoring": true
  }
}
```
1. 浏览器打开 127.0.0.1:8700
2. Connection name：随便写一个，必填项
3. Connection string: mongodb://127.0.0.1:27017/test
4. 点击 Add connection
5. 点击 Connect 连接