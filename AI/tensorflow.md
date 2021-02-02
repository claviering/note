# tensorflow

[tensorflow](https://www.tensorflow.org/)

## 导入 keras 模型

### 将Keras模型导入Tensorflow.js
Keras模型（通常通过Python API创建）可能被保存成多种格式之一. 整个模型格式可以被转换为Tensorflow.js的层(Layer)格式，这个格式可以被加载并直接用作Tensorflow.js的推断或是进一步的训练。

转换后的TensorFlow.js图层(Layer)格式是一个包含model.json文件和一组二进制格式的分片权重文件的目录。 model.json文件包含模型拓扑结构（又名“架构(architecture)”或“图形(graph)”：它是对图层(Layer)及其连接方式的描述）和权重文件的清单。

### 要求
转换过程要求Python的编程环境，您可能需要独立的使用pipenv或是virtualenv。并使用 pip install tensorflowjs 安装转换器

将Keras模型导入Tensorflow.js需要两步过程。首先，将已有Keras模型转换成TF.js层(Layer)格式，然后将其加载进Tensorflow.js。


Step 1. 将已有Keras模型转换成TF.js层(Layer)格式

Keras模型通常通过 model.save(filepath)进行保存，这样做会产生一个同时含有模型拓扑结构以及权重的HDF5(.h5)文件。如需要转换这样一个文件成为TF.js层格式，则可以运行以下代码。这里的path/to/my_model.h5为Keras .h5文件地址，而path/to/tfjs_target_dir则是对应输出的TF.js目录。

```shell
# bash
tensorflowjs_converter --input_format keras path/to/my_model.h5 path/to/tfjs_target_dir
```

另一种方式: 使用 Python API 直接导出为 TF.js 图层(Layer)格式

如果您有一个Python的Keras模型，您可以用以下方法直接输出一个Tensoflow.js图层(Layers)格式:

```python
# Python

import tensorflowjs as tfjs

def train(...):
    model = keras.models.Sequential()   # for example
    ...
    model.compile(...)
    model.fit(...)
    tfjs.converters.save_keras_model(model, tfjs_target_dir)
```

Step 2: 将模型加载进Tensorflow.js

使用一个web服务器为您在步骤1中生成的转换后的模型文件提供服务。注意，您可能需要将您的服务器配置为允许跨源资源共享(CORS), 以允许在 JavaScript 中提取文件。

然后通过提供model.json文件的URL将模型加载到TensorFlow.js中：

```js
// JavaScript

import * as tf from '@tensorflow/tfjs';

const model = await tf.loadLayersModel('https://foo.bar/tfjs_artifacts/model.json');
```

现在，该模型已准备好进行推理(inference)，评估(evaluation)或重新训练(re-training)。例如，模型完成加载后可以立即进行预测(predict)：

```js
// JavaScript

const example = tf.fromPixels(webcamElement);  // for example
const prediction = model.predict(example);
```

## jupyter 自动提示

第一个格子添加 `%config IPCompleter.greedy=True # TAB 键代码自动提示`

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