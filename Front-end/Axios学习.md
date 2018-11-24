# Axios学习

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



