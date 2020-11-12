# Axios学习

## 自定义适配器

axios-mock-adapter 这个库，该库通过自定义适配器，让开发者可以轻松地模拟请求

## axios 发送 form-data 请求上传文件

```js
const fs = require('fs')
const axios = require('axios')
const FormData = require('form-data')
let form = new FormData()

form.append('certFileStream', fs.createReadStream('/Users/name/Downloads/apiclient_cert.p12'))
form.append('appId', 'TPOS')
form.append('orgCode', '10CC')
form.append('tradeAccountConfig', '{"appID":"b","certPassword":"e","key":"d","mchID":"c"}')
form.append('tradeAccountDesc', '描述')
form.append('tradeAccountType', 'WXPAY')


axios.post('http://url/payment/tradeAccount/add', form, {
  headers: form.getHeaders(),
}).then(result => {
  // Handle result…
  console.log(result.data);
});
```

## 创建实例

```js
var instance = axios.create({
  baseURL: 'https://some-domain.com/api/',
  timeout: 1000,
  headers: {'X-Custom-Header': 'foobar'}
});
```

## 并发请求

```js
function getUserAccount() {
  return axios.get('/user/12345');
}
function getUserPermissions() {
  return axios.get('/user/12345/permissions');
}
axios.all([getUserAccount(), getUserPermissions()])
  .then(axios.spread(function (acct, perms) {
    //两个请求现已完成
  }));
```

## respone拦截器
```js
// respone拦截器
instance.interceptors.response.use(
  response => {
    return response
  },
  error => {
    if (error.response) {
      switch (error.response.status) {
        case 401:
          router.replace({
            path: '/login'
          })
      }
    }
    return Promise.reject(error.response)
  }
)
```
## 初始化
```js
// 添加请求头token
if (window.localStorage.getItem('token')) {
  Axios.defaults.headers.common['admin_token'] = window.localStorage.getItem('token')
}
// 定义默认url
export let instance = Axios.create({
  baseURL: 'http://192.168.1.105:8080/chxckc-api'
})
```



