# linux 学习

## 输出 base64 格式

`base64 sign.txt.sha384`

## 查找删除

`find . -name "FILE-TO-FIND" -exec rm -rf {} \;`

## 命令行历史

```
export HISTSIZE=10000
export HISEFILESIZE=10000
```

## 查找统计字数

`find . -name "*.tex" | xargs cat | wc -w`

## 命名

文件夹和文件用 `-` 连接 `file-name` 

## 输出环境变量

`env`

`echo $PATH`

## terminal 样式配置

红色高亮用户名 vim ~/.bashrc
`PS1='\033[1;31;1m\u@\h:\w\$'`