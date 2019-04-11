# vim 快捷键
---
## 1 键盘组合键

### 1.1 转跳

`CTRL + ]`  转挑到一个主题
`CTRL + T`  跳回
`NG或Ngg`    将光标定位到第 N 行的起始位置
`H`                将光标移到屏幕上的起始行（或最上行）
`M`                将光标移到屏幕中间
`L`                将光标移到屏幕最后一行
`w`                右移光标到下一个字的开头
`e`                右移光标到一个字的末尾
`b`                左移光标到前一个字的开头
`0`                数字０，左移光标到本行的开始
`$`                右移光标，到本行的末尾
`^`                移动光标，到本行的第一个非空字符
`fc`               向右移动到指定的字符c上
`Fc`               向左移动到指定的字符c上
`tc` 移动到前一个字符
`%`以匹配一个括号为目的的移动
`H,M,L`移动到屏幕上、中、后
`CTRL + U/B`滚上
`CTRL + D/F`滚下
`zz,zt,zb`当前行置为屏幕正中央,顶部，底部
`gf` 打开光标处所指的文件
`Ctrl + O` 向后回退你的光标移动
`Ctrl + I` 向前追赶你的光标移动
`zz` 将当前行置于屏幕中间
`zt` 将当前行置于屏幕顶端 
`zb`底端
`gD`搜索第一个
`z.`当前行置于中间
`zt`顶部
`zb`底部
`W`   move to beginning of next word after a whitespace
`B`   move to beginning of previous word before a whitespace
`E`   move to end of word before a whitespace

### 1.2 搜索匹配

`/str1`               正向搜索字符串 str1
`n  `                  继续搜索，找出 str1 字符串下次出现的位置
`N`                    继续搜索，找出 str1 字符串上一次出现的位置
`?str2`                反向搜索字符串 str2 
`*`          当光标停留在一个单词上，会在文件内搜索该单词，并跳转到下一处
`#`          当光标停留在一个单词上，在文件内搜索该单词，并跳转到上一处

### 1.3 替换和删除

`rc`                 用 c 替换光标所指向的当前字符
`R`替换模式，一直输入替换，直到按ESC
`x`                  删除光标所指向的当前字符
`dw `                删除光标右侧的字
`db `                删除光标左侧的字
`dd `                删除光标所在行，并去除空隙
`s   `             用输入的正文替换光标所指向的字符；
`S `               删除当前行，并进入编辑模式；
`cw `              用输入的正文替换光标右侧的字；
`c$  `             用输入的正文替换从光标到行尾的所有字符
`cb `              用输入的正文替换光标左侧的字
`daw`在单词的中间时删除一个单词(delete a word)

### 1.4 复制、粘贴

`p   `            小写字母 p，将缓冲区的内容粘贴到光标的后面；
`P   `            大写字母 P，将缓冲区的内容粘贴到光标的前面
`yy   `           复制当前行到内存缓冲区
`"+y   `          复制 1 行到操作系统的粘贴板

### 1.5 撤销、重做、重复

`u  `             撤消前一条命令的结果；
`U` 撤销一行
`CTRL + r` 重做
`. `              重复最后一条修改正文的命令。

### 1.6 进入插入模式

`I     `       在光标所在行的开头插入
`A`            在光标所在行的末尾插入

### 1.7 Visual模式

`v`普通
`V`选择多行
`CTRL + V`选择文本块
`o`选择块中的另一端

### 1.8 自动补全命令

```
整行补全                        CTRL-X CTRL-L
根据当前文件里关键字补全        CTRL-X CTRL-N
根据字典补全                    CTRL-X CTRL-K
根据同义词字典补全              CTRL-X CTRL-T
根据头文件内关键字补全          CTRL-X CTRL-I
根据标签补全                    CTRL-X CTRL-]
补全文件名                      CTRL-X CTRL-F
补全宏定义                      CTRL-X CTRL-D
补全vim命令                     CTRL-X CTRL-V
用户自定义补全方式              CTRL-X CTRL-U
拼写建议                        CTRL-X CTRL-S 
```
### 1.9 其他

`q:`打开命令行窗口
`g CTRL + G`统计字数
`gf`查找文件，打开并编辑 `CTRL + O/^`回去源文件`set path+=c:/prog/include`添加查找路径
`:find name`查找文件
`CTRL + A`重复输入
`CTRL + Y`复制上一行内容
`CTRL + E`复制下一行内容
`ga` 查看光标处字符的ascii码
`g8` 查看光标处字符的utf-8编码

### 2.0 格式化

`=`自动缩进

## 2 命令模式

### 2.1 打开、保存

`:e path_to_file/filename `   在已经启动的Vim中打开一个文件
`:w file_temp`    将当前文件另存为 file_temp

### 2.2 行号与文件

`:n   `          将光标移到第 n 行（效果与 编辑模式 下的 ngg 或 nG 相同）
`:345  `                将光标移到第 345 行
`:345w file      `      将第 345 行写入 file 文件
`:3,5w file       `     将第 3 行至第 5 行写入 file 文件
`:1,.w file       `     将第 1 行至当前行写入 file 文件
`:.,$w file       `     将当前行至最后一行写入 file 文件
`:.,.+5w file     `     从当前行开始将 6 行内容写入 file 文件
`:1,$w file        `    将所有内容写入 file 文件，相当于 :w file 命令
`:a,bw file`         将第 a 行至第 b 行的内容写入 file 文件
`:r file `          读取 file 文件的内容，插入当前光标所在行的后面
`:f file`            将当前文件重命名为 file
`:f   `              打印当前文件名称和状态，如文件的行数、光标所在的行号等

### 2.3 Vim中的正则表达式

```
^                放在字符串前面，匹配行首的字；
$                放在字符串后面，匹配行尾的字；
\<               匹配一个字的字头；
\>               匹配一个字的字尾；
.                匹配任何单个正文字符；
[str]            匹配 str 中的任何单个字符；
[^str]           匹配任何不在 str 中的单个字符；
[a-b]            匹配 a 到 b 之间的任一字符；
*                匹配前一个字符的 0 次或多次出现；
\                转义后面的字符。
```

### 2.4 正文替换

`:%s/str1/str2/    `    用字符串 str2 替换**行中首次**出现的字符串 str1
`:s/str1/str2/g`        **行中所有**
`:.,$ s/str1/str2/g`    **当前行到末尾所有**
`%s/str1/str2/g`    **所有**
`:m,ns/str1/str2/g`     **m行到n行**
>后面加`c`与用户交互
>后面加`n`统计出现次数

### 2.5 恢复文件

`:recover`
也可以在启动Vim时用 -r 选项

### 2.6 与外部工具集成

`:diffsplit abc.txt`
`:%!xxd`  二进制模式显示出来的文本
`:%!xxd -r`   二进制模式转换到普通模式

### 2.7 其他

`:set hlsearch/nohlsearch` 设置高亮匹配/取消高亮
`hlsearch/nohlsearch` 当前高亮匹配/取消高亮
`:set incsearch`实时搜索
`:set guifont=*`列出字体选项
`set guifont=Consolas:h11:b`设置字体
`:set lines=35 columns=118`设置默认窗口大小
`:set iskeyword&`加个&恢复默认值
`:Ex` 浏览目录
`:n1,n2 co n3`将n1行到n2行之间的内容拷贝到第n3行下
`:n1,n2 m n3`将n1行到n2行之间的内容移至到第n3行下
`:n1,n2 d` 将n1行到n2行之间的内容删除

### 2.8 分割窗口

`:new`打开新窗口并开始编辑空的缓冲区
`:set scb` 分屏同步
`:set scb!` 取消分屏同步
`:sb 3`               分屏并打开编号为3的Buffer
`Ctrl+w T`        当前窗口移动到新标签页
```
Ctrl+W H        向左移动当前窗口
Ctrl+W J        向下移动当前窗口
Ctrl+W K        向上移动当前窗口
Ctrl+W L        向右移动当前窗口
```
纵向调整
```
:ctrl+w + 纵向扩大（行数增加）
:ctrl+w - 纵向缩小 （行数减少）
:res(ize) num  例如：:res 5，显示行数调整为5行
:res(ize)+num 把当前窗口高度增加num行
:res(ize)-num 把当前窗口高度减少num行
```
横向调整
```
CTRL + W + >
CTRL + W + <
:vertical res(ize) num 指定当前窗口为num列
:vertical res(ize)+num 把当前窗口增加num列
:vertical res(ize)-num 把当前窗口减少num列
```

### 2.9 寄存器

修改寄存器内容
```
"np //将寄存器n的内容弄出来，修改
"ny$ //将正确的结果保存到寄存器n中
dd //删除弄出来的内容
```
`qA` 大写字母表示追加内容到寄存器

### 2.10 命令行编辑

和shell里快捷键一样
`S/C + Left/Right`左/右移一个单词

### 2.11 缓冲区

`:buffers/ls`显示缓冲区
`:[s]buffer #`[新开窗口]编辑缓冲区
动用如下命令，快速切换
```
:bnext      缩写 :bn
:bprevious   缩写 :bp
:blast  缩写 :bl
:bfirst 缩写 :bf
```
`bdn`关闭第n个缓冲区

### 2.12 对多个文件做同样的改动

```
案例1：把多个C文件中名为"x_cnt"的变量都改为"X_counter"

:args *.c
:argdo %s/\<x_cnt\>/x_counter/ge | update
Note

args *.c 把所有要改的文件放到参数列表上
:argdo 以另一个命令为参数，该命令将对所有待编辑的文件都执行一次
| 用来分割两个命令
update 在文件有所改变时进行保存
类似于 :argdo
:windo 对所有窗口执行同样的操作
:bufdo 对所有缓冲区进行操作， 这个要小心使用 ，最好用 :ls 看一下有哪些缓冲区会被改动
```

### 2.13 多标签

`CTRL + W + T` 分窗口变多标签
```
:tabnew     增加一个标签
:tabc       关闭当前的tab
:tabo       关闭所有其他的tab
:tabs       查看所有打开的tab
:tabp 或gT  前一个
:tabn 或gt  后一个
```

### 2.14 粘贴板

`:reg` 命令可以查看各个粘贴板里的内容
`"Ny` copy
`"Np` paste

## 3. 编辑非文本文件

`vim -x file.txt`加密文件
`:X`加密文件
`set key=`停止加密
`:!%xxd`十六进制
`:!%xxd -r`十六进制逆置
`:iabbrev JB Jack Benny`缩写
`:{range}center/Left/Right [width]`居中/左/右对齐文本

```