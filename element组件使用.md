# element组件使用
CLI中
```
npm i element-ui --svae
```

在main.js中
```
import Vue from 'vue';
import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';
import App from './App.vue';

Vue.use(ElementUI);
```

## Attributes
参数 type
直接在组件中
type=""

## Input Events
在Events下的事件的使用

Input Events
参数
focus

在组件中使用,前面要加@

@focus="myfunction"

## 表格
获取 index 和 col 数据
`@click.native.prevent="deleteRow(scope.$index, scope.row)"`