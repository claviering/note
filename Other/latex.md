# latex

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
\usepackage{listings}
\usepackage{fontspec}
\newfontfamily\menlo{Menlo}

\begin{lstlisting}[language={[ANSI]C},
        numbers=left,
        numberstyle=\tiny\menlo,
        basicstyle=\small\menlo]
#include <stdio.h>
#include <stdbool.h>
#include <ctype.h>

#define SIZE 26

int
main (int argc, char *argv[])
{
  int array[SIZE];
  int i;
  char c;

  for (i = 0; i < SIZE; i++)
    array[i] = 0;

  while ((c = getchar ()) != EOF)
    {
      if (isupper (c))
        {
          array[c - 'A']++;
        }
    }
  for (i = 0; i < 26; i++)
    printf ("%c:%5d\n", (char) ('A' + i), array[i]);

  return 0;
}
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
	\label{fig:label}
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
```
