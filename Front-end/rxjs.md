# RxJS

为什么用RxJS，摘自知乎回答：
思考一下，异步的本质是什么？
异步操作和同步操作最大的区别就是异步有时序。
我们可以把同步操作理解为：数据+函数
那么异步操作就是：数据+函数+时序
Rx就是把时序抽离成一根时间轴，在这根时间轴上进行同步操作，而异步相关的时序处理就交给Rx提供的各种operator操作符。
所以问题就很简单了，如果你的应用是一个时序密集的应用，那么使用Rx能帮你理清复杂的异步逻辑。反之，如果异步操作之间没有太多的联系，时序分散， 则不那么需要使用Rx。