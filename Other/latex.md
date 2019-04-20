# latex

## 空白页

`\afterpage{\null\newpage}`

## 图片适应宽度

`width=\linewidth`

```tex
\begin{figure}[ht]
	\centering
	\includegraphics[width=\linewidth]{./graphics/压力测试折线图.png}
	\caption{服务器占用资源变化}
\end{figure}
```

## 单位

|缩写|单位|换算关系|
| - | - | - |
|pt|point| 1 in = 72.27 pt|
|pc|pica| |
|in|inch| |
|bp|big point| |
|cm|centimetre| |
|mm|| |
|dd|| |
|cc|| |

## 水平空格，垂直空格，段落缩进

> http://softlab.sdut.edu.cn/blog/xuqianhui/2017/06/18/%E5%9C%A8latex%E4%B8%AD%E4%BA%A7%E7%94%9F%E7%A9%BA%E7%99%BD%E7%A9%BA%E9%97%B4/

```tex
\hspace{单位}
\vspace{单位}
\noindent % 阻止LaTeX缩进段落
\indent % 强制LaTeX缩进段落
```

## 断词

`\-`

## 分文件 引入文件

`\input{}`
`\include{}`

## 统计字数

`find . -name "*.tex" | xargs cat | wc -w`

## 添加引用

目录添加参考文献
`\usepackage[nottoc]{tocbibind}`

### 直接引入
```tex
\begin{thebibliography}{9}
\bibitem{latexcompanion} 
Michel Goossens, Frank Mittelbach, and Alexander Samarin. 
\textit{The \LaTeX\ Companion}. 
Addison-Wesley, Reading, Massachusetts, 1993.
 
\bibitem{einstein} 
Albert Einstein. 
\textit{Zur Elektrodynamik bewegter K{\"o}rper}. (German) 
[\textit{On the electrodynamics of moving bodies}]. 
Annalen der Physik, 322(10):891–921, 1905.
 
\bibitem{knuthwebsite} 
Knuth: Computers and Typesetting,
\\\texttt{http://www-cs-faculty.stanford.edu/\~{}uno/abcde.html}
\end{thebibliography}
```


### 文件引用

```tex
\bibliography{index}
\bibliographystyle{IEEEtran}
```

文章中使用 `\cite{konishi}` 指示引用了那个文献，如果没有用到引用要在 `\bibliography{}` 前加 `\nocite{*}` 不然编译错误

`index.bib` 文件加入下面内容

```bib
@article{konishi,
  author = {Konishi, Seiki and Nakajima, Kyoichi and Uchida, Idai and Kikyo, Hideyuki and Kameyama, Masashi and Miyashita, Yasushi},
  title = {Common inhibitory mechanism in human inferior prefrontal cortex revealed by event-related functional MRI},
  journal = {Brain},
  volume = {122},
  number = {5},
  pages = {981},
  year = {1999},
}
```

### 编译

```shell
xelatex main.tex
bibtex main.aux
xelatex main.tex
```

### 跟多BibTex 语法

||||
| - | - | - |
| address |	annote |	author |
| booktitle |	chapter |	crossref |
| edition |	editor |	institution |
| journal |	key |	month |
| note |	number |	organization |
| pages |	publisher |	school |
| series |	title |	type |
| volume |	year |	URL |
| ISBN |	ISSN |	LCCN |
| abstract |	keywords |	price |
| copyright |	language |	contents |

## 添加目录

`\tableofcontents`

编译两次才有效果

## 导入代码
```tex
\usepackage{listings}
\usepackage{color}
\lstinputlisting[language=C]{./src/clientHello.txt}
\lstinputlisting[language=Python, firstline=37, lastline=45]{source_filename.py}
```
## 表格居中

```tex
\begin{table}
\centering
\begin{tabular}
...
\end{tabular}
\end{table}
```

## 代码

```tex
\begin{lstlisting}[language=C]
  // C Program Code
\end{lstlisting}
```

## 字体

```tex
\heiti 黑体
\songti 宋体
```
## 查看文档

`lexdoc ctex`

修改 section 样式 `\ctexset`

## 中文编译

`\usepackage{ctex}`

选择构建 默认编译器 `XeLaTeX`

## 添加图片

`\usepackage{graphicx}`

```latex
\begin{figure}[ht]
	\centering
	\includegraphics[scale=0.5]{img/tcp.png}
	\caption{tcp包截图}
\end{figure}
```

## 添加列表

[列表](https://www.overleaf.com/learn/latex/Lists)
无序列表
```tex
\begin{itemize}
  \item One entry in the list
  \item Another entry in the list
\end{itemize}
```
有序列表
```tex
\begin{enumerate}
  \item One entry in the list
  \item Another entry in the list
\end{enumerate}
```
自定义列表
```tex
\begin{description}
  \item[自定义列表1] One entry in the list
  \item[自定义列表2] Another entry in the list
\end{description}
首个符号为 -
```tex
\begin{itemize}
  \item[-] One entry in the list
  \item[] Another entry in the list
\end{itemize}
```
