# MongoDB 学习

集合 === 数据库

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

## 插入

### 插入数据

`db.todo.insert({"id": 0, "title": "titile", "content": "content"})`

## 删除

删除数据库

`db.dropDatabase()`

删除 site 集合

`db.site.drop()` 
