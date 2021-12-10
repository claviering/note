# pandas

填充合并的单元格, axis=0 列填充, axis=1 行填充

df = df.fillna(method='ffill', axis=0) 或者 df = df.fillna(method='ffill')

```
In [42]: df
Out[42]: 
       Sample    CD4   CD8
Day 1    8311  17.30  6.44
NaN      8312  13.60  3.50
NaN      8321  19.80  5.88
NaN      8322  13.50  4.09
Day 2    8311  16.00  4.92
NaN      8312   5.67  2.28
NaN      8321  13.00  4.34
NaN      8322  10.60  1.95

[8 rows x 3 columns]

In [43]: df = df.fillna(method='ffill', axis=0)

In [44]: df
Out[44]: 
       Sample    CD4   CD8
Day 1    8311  17.30  6.44
Day 1    8312  13.60  3.50
Day 1    8321  19.80  5.88
Day 1    8322  13.50  4.09
Day 2    8311  16.00  4.92
Day 2    8312   5.67  2.28
Day 2    8321  13.00  4.34
Day 2    8322  10.60  1.95

[8 rows x 3 columns]
```