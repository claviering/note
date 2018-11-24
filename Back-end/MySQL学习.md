# MySQL学习

## 添加字段

```
ALTER TABLE student  ADD age INT NOT NULL;
```

## 查看语句执行时间

```
 show variables like "%pro%";
 查看 profiling 是不是value = ON
set profiling = 1 // 开启
set profiling=0 // 关闭
show profiles;// 执行sql语句后查询时间什么的
show profile cpu, block io, memory,swaps,context switches,source for query 6;可以查看出一条SQL语句执行的各种资源消耗情况，比如CPU，IO等
```

## 查看某个用户
```
show grants for 'shiwei'@'%';
```
## MySQLi防SQL注入

```
$conn = new mysqli($dbhost, $dbuser, $dbpass, $dbname);
$stmt = $conn->prepare("INSERT INTO table_name (name) VALUES (?)");
$stmt->bind_param('s', $postedName);
 
//只要确保参数在下一步 execute 之前赋值就行了
$stmt->execute();
$result = $stmt->get_result(); // select成功返回对象集合，其他操作成功返回false
while ($row = $result->fetch_assoc()) {
// do something with $row
}

$stmt->close();  // 最后加上这个
```
|Character|	Description|
|--|--|
|i|corresponding variable has type integer|
|d|corresponding variable has type double|
|s|	corresponding variable has type string|
|b|corresponding variable is a blob and will be sent in packets|



```
$conn = new mysqli($dbhost, $dbuser, $dbpass, $dbname);
$stmt = $conn->prepare("INSERT INTO CountryLanguage VALUES (?, ?, ?, ?)");
$stmt->bind_param('sssd', $code, $language, $official, $percent);
```
就是绑定了四个参数，三个为字符串，一个为数字。非常简便

## 插入
```
INSERT INTO table_name ( field1, field2,...fieldN )
                       VALUES
                       ( value1, value2,...valueN );
```
## 查看字段信息

SHOW FULL COLUMNS FROM db_name.table_name

## 改表名

RENAME TABLE tb1 TO tb2;

## status
服务器状态

## 设置编码

```
SET character_set_client = charset_name;
SET character_set_results = charset_name;
SET character_set_connection = charset_name;
```


## 连接数据库
```
mysql -u root -p 本地
mysql -h110.110.110.110 -u root -p 123  远程
mysqladmin -u root -password ab12
mysqladmin -u root -p ab12 password djg345
grant select on 数据库.* to 用户名@登录主机 identified by “密码”
grant select,insert,update,delete on *.* to [email=test1@”%]test1@”%[/email]” Identified by “abc”;
create database database_name;
show databases;
use dataBase_name;
show tables;
desc  table_name;
drop table <表名>
delete from 表名 where 表达式
delete from 表名 where 表达式
rename table 原表名 to 新表名;
mysqldump -u user_name -p123456 database_name > outfile_name.sql
mysqldump -u user_name -p database_name table_name > outfile_name.sql
SELECT User FROM mysql.user;
delete from mysql.user where user="";
use database
status
```

例1：增加一个test1用户，密码为123456，可以在任何主机上登录，并对所有数据库有查询，增加，修改和删除的功能。需要在mysql的root用户下进行
```
mysql>grant select,insert,update,delete on *.* to test1@”%” identified by “123456″；
mysql>flush privileges;
```
例2：增加一个test2用户，密码为123456，只能在192.168.2.12上登录，并对数据库student有查询，增加，修改和删除的功能。需要在mysql的root用户下进行
```
mysql>grant select,insert,update,delete on student.* to test2@192.168.2.12 identified by “123456″;
mysql>flush privileges;
```
例3：授权用户test3拥有数据库student的所有权限
```
mysql>grant all privileges on student.* to test3@localhost identified by ’123456′;
mysql>flush privileges;
```



