# latex

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
```latex
\begin{itemize}
  \item One entry in the list
  \item Another entry in the list
\end{itemize}
```
