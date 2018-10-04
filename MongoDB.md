# MongoDB 学习

集合 === 数据库

## Node.js 连接 MongoDB

`npm i mongodb`

使用
```js
const MongoClient = require('mongodb').MongoClient;
const assert = require('assert');
 
// Connection URL
const url = 'mongodb://localhost:27017';
 
// Database Name
const dbName = 'myproject';
 
// Use connect method to connect to the server
MongoClient.connect(url, { useNewUrlParser: true }, function(err, client) {
  assert.equal(null, err);
  console.log("Connected successfully to server");
 
  const db = client.db(dbName);
 
  client.close();
});
```

## 数据备份
`mongodump -h dbhost -d dbname -o dbdirectory`

## 数据恢复

`mongorestore -h <hostname><:port> -d dbname <path>`

## 索引

`db.collection.createIndex(keys, options)`

后台创建
`db.values.createIndex({open: 1}, {background: true})`

## windows 开启服务

要求管理员权限
`net start mongodb`

## 创建

### 创建数据库

`use todo`
不存在就创建，有就切换

### 创建集合

`db.createCollection("tables")`

## 查看

`db`  当前数据库

`show dbs`  全部数据库

`show tables` 查看表

`show collections` 查看集合

`db.col.find(query, projection)` 查找

`db.col.find(query, projection).pretty()`

限制查找数量
`db.COLLECTION_NAME.find().limit(NUMBER)`

跳过查找数量
`db.COLLECTION_NAME.find().limit(NUMBER).skip(NUMBER)`

排序 1 升序 -1 降序
`db.COLLECTION_NAME.find().sort({KEY:1})`

找最大
`db.thiscollection.find().sort({"thisfieldname":-1}).limit(1)`
## 插入

### 插入数据

`db.todo.insert({"id": 0, "title": "titile", "content": "content"})`

`db.col.insertOne(document)` document 是一个变量

## 删除

删除数据库

`db.dropDatabase()`

删除 site 集合

`db.site.drop()` 

`db.col.remove({'title':'MongoDB 教程'})`

`db.col.remove({})` 删除全部

删除字段
`db.yourcollection.update({},{$unset:{"需要删除的字段":""}},false,true)`

## 更新

`db.col.update({'title':'MongoDB 教程'},{$set:{'title':'MongoDB'}})`