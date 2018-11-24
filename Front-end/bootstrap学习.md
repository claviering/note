# bootstrap学习

## vue中使用bootstrap-vue

```shell
npm i bootstrap-vue -S
import Vue from 'vue'
import BootstrapVue from 'bootstrap-vue'

Vue.use(BootstrapVue);

import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'
```

组件中使用
```js
import bModal from 'bootstrap-vue/es/components/modal/modal'
import bModalDirective from 'bootstrap-vue/es/directives/modal/modal'
Vue.component('my-component', {
    components: {
        'b-modal': bModal
    },
    directives: {
        'b-modal': bModalDirective
    }
    // ...
})
```