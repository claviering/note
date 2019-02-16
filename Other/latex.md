# latex

## 字体

```latex
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
	\label{fig:label}
\end{figure}
```

## 添加列表

[列表](https://www.overleaf.com/learn/latex/Lists)
无序列表
```latex
\begin{itemize}
  \item One entry in the list
  \item Another entry in the list
\end{itemize}
```
有序列表
```latex
\begin{enumerate}
  \item One entry in the list
  \item Another entry in the list
\end{enumerate}
```
自定义列表
```latex
\begin{description}
  \item[自定义列表1] One entry in the list
  \item[自定义列表2] Another entry in the list
\end{description}
```
