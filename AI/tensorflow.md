# tensorflow

[tensorflow](https://www.tensorflow.org/)

## 保存和恢复模型变量

```py
# train.py 模型训练阶段
 
model = MyModel()
# 实例化Checkpoint，指定保存对象为model（如果需要保存Optimizer的参数也可加入）
checkpoint = tf.train.Checkpoint(myModel=model)
# ...（模型训练代码）
# 模型训练完毕后将参数保存到文件（也可以在模型训练过程中每隔一段时间就保存一次）
checkpoint.save('./save/model.ckpt')

# test.py 模型使用阶段
 
model = MyModel()
checkpoint = tf.train.Checkpoint(myModel=model)             # 实例化Checkpoint，指定恢复对象为model
checkpoint.restore(tf.train.latest_checkpoint('./save'))    # 从文件恢复模型参数
# 模型使用代码

```



## 保存训练好的模型, 加载模型

保存模型 `model.save('my_model.h5')`

加载模型 `new_model = tf.keras.models.load_model('demo_1/my_model.h5')`

## 安装

使用 python 3.7.x

CPU安装

`pip install tensorflow -U`

GPU安装

先自己安装CUDA 10.0和cudnn，然后设置LD_LIBRARY_PATH。

`pip install tensorflow-gpu -U`

测试安装

```python
In [2]: import tensorflow  as tf

In [3]: tf.__version__
Out[3]: '2.0.0'
In [4]: tf.test.is_gpu_available()
...
totalMemory: 3.95GiB freeMemory: 3.00GiB
...
Out[4]: True
```