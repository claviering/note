# markdown

## 开源编辑器

- [marktext](https://github.com/marktext/marktext)
- [wangEditor](https://github.com/wangeditor-team/wangEditor)

## diff 高亮

```diff
import { Configuration } from "openai";

const configuration = new Configuration({
  apiKey: OPENAI_API_KEY,
+ basePath: "https://closeai.deno.dev/v1",
});
```

## 代码块语法高亮

```t
Cucumber ('*.feature')
abap ('*.abap')
ada ('*.adb', '*.ads', '*.ada')
ahk ('*.ahk', '*.ahkl')
apacheconf ('.htaccess', 'apache.conf', 'apache2.conf')
applescript ('*.applescript')
as ('*.as')
as3 ('*.as')
asy ('*.asy')
bash ('*.sh', '*.ksh', '*.bash', '*.ebuild', '*.eclass')
bat ('*.bat', '*.cmd')
befunge ('*.befunge')
blitzmax ('*.bmx')
boo ('*.boo')
brainfuck ('*.bf', '*.b')
c ('*.c', '*.h')
cfm ('*.cfm', '*.cfml', '*.cfc')
cheetah ('*.tmpl', '*.spt')
cl ('*.cl', '*.lisp', '*.el')
clojure ('*.clj', '*.cljs')
cmake ('*.cmake', 'CMakeLists.txt')
coffeescript ('*.coffee')
console ('*.sh-session')
control ('control')
cpp ('*.cpp', '*.hpp', '*.c++', '*.h++', '*.cc', '*.hh', '*.cxx', '*.hxx', '*.pde')
csharp ('*.cs')
css ('*.css')
cython ('*.pyx', '*.pxd', '*.pxi')
d ('*.d', '*.di')
delphi ('*.pas')
diff ('*.diff', '*.patch')
dpatch ('*.dpatch', '*.darcspatch')
duel ('*.duel', '*.jbst')
dylan ('*.dylan', '*.dyl')
erb ('*.erb')
erl ('*.erl-sh')
erlang ('*.erl', '*.hrl')
evoque ('*.evoque')
factor ('*.factor')
felix ('*.flx', '*.flxh')
fortran ('*.f', '*.f90')
gas ('*.s', '*.S')
genshi ('*.kid')
glsl ('*.vert', '*.frag', '*.geo')
gnuplot ('*.plot', '*.plt')
go ('*.go')
groff ('*.(1234567)', '*.man')
haml ('*.haml')
haskell ('*.hs')
html ('*.html', '*.htm', '*.xhtml', '*.xslt')
hx ('*.hx')
hybris ('*.hy', '*.hyb')
ini ('*.ini', '*.cfg')
io ('*.io')
ioke ('*.ik')
irc ('*.weechatlog')
jade ('*.jade')
java ('*.java')
js ('*.js')
jsp ('*.jsp')
lhs ('*.lhs')
llvm ('*.ll')
logtalk ('*.lgt')
lua ('*.lua', '*.wlua')
make ('*.mak', 'Makefile', 'makefile', 'Makefile.*', 'GNUmakefile')
mako ('*.mao')
maql ('*.maql')
mason ('*.mhtml', '*.mc', '*.mi', 'autohandler', 'dhandler')
markdown ('*.md')
modelica ('*.mo')
modula2 ('*.def', '*.mod')
moocode ('*.moo')
mupad ('*.mu')
mxml ('*.mxml')
myghty ('*.myt', 'autodelegate')
nasm ('*.asm', '*.ASM')
newspeak ('*.ns2')
objdump ('*.objdump')
objectivec ('*.m')
objectivej ('*.j')
ocaml ('*.ml', '*.mli', '*.mll', '*.mly')
ooc ('*.ooc')
perl ('*.pl', '*.pm')
php ('*.php', '*.php(345)')
postscript ('*.ps', '*.eps')
pot ('*.pot', '*.po')
pov ('*.pov', '*.inc')
prolog ('*.prolog', '*.pro', '*.pl')
properties ('*.properties')
protobuf ('*.proto')
py3tb ('*.py3tb')
pytb ('*.pytb')
python ('*.py', '*.pyw', '*.sc', 'SConstruct', 'SConscript', '*.tac')
rb ('*.rb', '*.rbw', 'Rakefile', '*.rake', '*.gemspec', '*.rbx', '*.duby')
rconsole ('*.Rout')
rebol ('*.r', '*.r3')
redcode ('*.cw')
rhtml ('*.rhtml')
rst ('*.rst', '*.rest')
sass ('*.sass')
scala ('*.scala')
scaml ('*.scaml')
scheme ('*.scm')
scss ('*.scss')
smalltalk ('*.st')
smarty ('*.tpl')
sourceslist ('sources.list')
splus ('*.S', '*.R')
sql ('*.sql')
sqlite3 ('*.sqlite3-console')
squidconf ('squid.conf')
ssp ('*.ssp')
tcl ('*.tcl')
tcsh ('*.tcsh', '*.csh')
tex ('*.tex', '*.aux', '*.toc')
text ('*.txt')
v ('*.v', '*.sv')
vala ('*.vala', '*.vapi')
vbnet ('*.vb', '*.bas')
velocity ('*.vm', '*.fhtml')
vim ('*.vim', '.vimrc')
xml ('*.xml', '*.xsl', '*.rss', '*.xslt', '*.xsd', '*.wsdl')
xquery ('*.xqy', '*.xquery')
xslt ('*.xsl', '*.xslt')
yaml ('*.yaml', '*.yml')
```

## 代码块

方式一
```js
console.log('hello wolrd')
```
方式二: 缩进4个空格, hexo中代码块顶部和底部也要缩进4个空格
    
    console.log('hello wolrd')
    

## 文字右对齐

<p align="right">右对齐</p>

## 删除线
~~这是删除线~~
## 添加数学符号
[数学符号](http://jzqt.github.io/2015/06/30/Markdown%E4%B8%AD%E5%86%99%E6%95%B0%E5%AD%A6%E5%85%AC%E5%BC%8F/)
[数学符号](http://mohu.org/info/symbols/symbols.htm)

## 插入图片
![图片](图片链接)

## 加入空格
&ensp;

## 表格

| 项目        | 价格   |  数量  |
| --------   | -----:  | :----:  |
| 计算机     | \$1600 |   5     |
| 手机        |   \$12   |   12   |
| 管线        |    \$1    |  234  | 

## 锚点
每一个标题都是一个锚点

[回到顶部](#markdown)