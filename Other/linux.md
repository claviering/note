# linux 学习

## 后台运行命令

`CTRL + Z` 暂停任务，使用`bg` 放到后台运行。或者命令最后加 `&`，查看后台运行进程 `jobs`。使用 `fg [%job_id]` 把程序放到前台运行

### 终端退出保持后台运行

1. disown 命令 `disown -h %1` % 后面加 jobs 查看的 ID
2. nohup 命令 `nohup python demo.py &` 使用 ps ax | grep test.py 结束进程

## 查找排除文件夹

`find . -path "./node_modules" -prune -o -print`

排除多个

`find . -type d \( -path "./node_modules" -o -path "./.cache" -o -path "./.cache-loader" \) -prune -o -print`

## 查找合并代码

`find . -name "*.js" | xargs cat > code.txt`

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