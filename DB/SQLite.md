# SQLite

## 存储类型

1. NULL：空值。 
2. INTEGER：带符号的整型，具体取决有存入数字的范围大小。 
3. REAL：浮点数字，存储为8-byte IEEE浮点数。 
4. TEXT：字符串文本。 
5. BLOB：二进制对象。 

## 修改字段类型

```sql
-- 先将表重命名 
ALTER TABLE TBAcct RENAME TO TBAcctOld; 
-- 重新创建表
CREATE TABLE TBAcct(ID INTEGER PRIMARY KEY AUTOINCREMENT, Name VARCHAR(50)); 
-- 将旧表的内容插入到新表中 
INSERT INTO TBAcct (ID,Name) SELECT ID, CName FROM TBAcctOld; 
-- 删除旧表
DROP TABLE TBAcctOld; 
```

## demo

```sql
SELECT * from organization ORDER BY sort DESC
INSERT INTO organization(level,orgCode,orgName,parentCode) VALUES (1,"netfinance","互联网财务事业部", "nfnet")
DELETE FROM organization WHERE orgCode = "林伟业"
ALTER TABLE organization ADD COLUMN sort;
UPDATE organization SET sorted = 1 WHERE TRUE
ALTER TABLE organization ADD COLUMN sorted INTEGER;
SELECT sort FROM organization WHERE parentCode = "nfnet" ORDER BY sort DESC LIMIT 1
SELECT sort FROM organization WHERE parentCode = "nfnet" AND sort >= 1 AND sort < 4
UPDATE organization SET sort = sort + 1 WHERE parentCode = "nfnet" AND sort >= 1 AND sort < 4
```

## 可视化工具 TablePlus

运行 command + enter

commit: command + s

## 建表

```sql
CREATE TABLE "organization" (
	id	INTEGER PRIMARY KEY, -- 主键
	level	INTEGER,
	orgCode	TEXT,
	orgName	TEXT,
	parentCode	TEXT,
  sort INTEGER
)
```

```sql

```

## 插入

INSERT INTO organization(level,orgCode,orgName) VALUES (0,"nfncb","南方农村报")

## 删除

## add column

ALTER TABLE organization ADD COLUMN sort INTEGER;
