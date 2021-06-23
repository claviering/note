# linux 学习

## 查找重命名

`find . -depth -name "index.js" -exec sh -c 'f="{}"; mv -- "$f" "${f%.html}.php"' \;`

js 结尾的改 jsx

`find src/components/* -depth -name "*.js" -exec sh -c 'f="{}"; mv -- "$f" "${f%.js}.jsx"' \;`

## 文件上传下载

将 文件/文件夹 从远程 Ubuntu 机拷至本地(scp)
`$scp -r username@192.168.0.1:/home/username/remotefile.txt`

将 文件/文件夹 从本地拷至远程 Ubuntu 机(scp)
`$scp -r localfile.txt username@192.168.0.1:/home/username/`

## homebrew 不自动更新

`export HOMEBREW_NO_AUTO_UPDATE=1`

## 查看文件编码

vim 打开文件 使用 `:set fileencoding` 查看文件编码

## mv 参数过长

`find . -name '*.jpg' -exec mv {} ../ \;`

## ls 参数过长

`find . -name 'cat.*' | wc -l`

## task，命令行任务管理


## 查看用得最多的命令

1. `history 1 -1 | awk '{a[$2]++}END{for(i in a){print a[i] " " i}}' | sort -rn | head`

2. `zsh_stats`

## 删除小于文件大小的文件

`find . -name "*.tif" -type 'f' -size -160k -delete`

## rm 参数过长

`find . -name "*.jpg" -delete`

## Linux统计文件夹下的文件数目数量

统计当前目录下文件的个数（不包括目录）

`$ ls -l | grep "^-" | wc -l`

统计当前目录下文件的个数（包括子目录）

`$ ls -lR| grep "^-" | wc -l`

查看某目录下文件夹(目录)的个数（包括子目录）

`ls -lR | grep "^d" | wc -l`

## curl 用法

curl -d'login=emma＆password=123' https://google.com/login

## 统计文件夹大小

`du -ach`

## 命令消耗时间

`time ls`

## 查看文件夹大小

`du -shc /var/*`

降序 `du -shc /var/* | sort -hr`

升序 `du -shc /var/* | sort -h`

## 统计文件中单词出现次数

`grep -o -i [word] [file] | wc -l`

## 输入时间

`date +%F\ %T`

用时间命名文件

`$(date +%F_%T).log`

## 压缩

gzip 压缩 tar -zcvf -9 file.tar.gz *.log

gzip 解压 tar -xzvf file.tar.gz

bz2 压缩 tar -jcvf -9 log.tar.bz2 *.log

bz2 解压 tar -xjvf file.tar.bz2

xz 压缩 tar -Jcvf -9 -T 0 log.tar.xz *.log

xz 解压 tar -xJvf -T 0 file.tar.xz


- -z 使用 gz 压缩
- -c 建立压缩档案
- -v 显示过程
- -f 使用档案名字

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