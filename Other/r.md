# R 语言学习

大小写区分的语言

## 赋值

my_var <- 42

## 功能包

- 下载: install.packages("dplyr")
- 使用: library(dplyr)

## 数据类型

- 数值型 numerics (1, 2.5) my_numeric <- 42
- 逻辑判断 logical (TRUE or FALSE) my_logical <- FALSE
- 字符型 characters my_character <- "universe"
- 因子 factors

class(my_numeric) 判断类型

## 数据结构

有这么几个：vector 向量、matrix 矩阵，dataframe 数据集，list 列表。 * 向量可以构成矩阵 * 矩阵是特殊的数据集 * list 是个筐，什么都能装

- a <- c(1, 2, 5, 3, 6, -2, 4)
- b <- c("apple", "pear", "orange")
- c <- c(TRUE, FALSE, TRUE, FALSE, TRUE, FALSE)