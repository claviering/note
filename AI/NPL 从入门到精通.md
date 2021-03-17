# NPL 从入门到精通

## 第一节，如何用计算机可以处理的方式来表示单词，并在后期训练一个神经网络，来理解这些单词的含义

分词

1. 用编码的方式表示单词 (bad)
2. 用编码的方式表示句子 (good)

### 编码字母

使用 ASCII 编码表示

```
083 073 076 069 078 084
 S   I   L   E   N   T

076 073 083 084 069 078
 L   I   S   T   E   N

LISTEN 和 SILENT 两个单词的数字一样，只是顺序不一样，因此仅通过字母来理解一个单词的含义，并不容易
```

### 编码单词

比起编码字母，编码单词更简单


```
I love my dog
1  2   3   4

I love my cat
1  2   3   5

```
把句子编码成数字

```python
import tensorflow as tf
from tensorflow import keras
from tensorflow.keras.preprocessing.text import Tokenizer

sentences = [
  'I love my dog',
  'I love my cat',
  'You love my dog!', # 会忽略感叹号
]
tokenizer = Tokenizer(num_words = 100) # 保留频率最多100个关键词
tokenizer.fit_on_texts(sentences)
word_index = tokenizer.word_index
print(word_index)
```

## one hot 编码

缺点

1. 维度大
2. 无法比较相似度，內积为 0