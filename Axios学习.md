# Axios学习
## respone拦截器
```
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
```
添加请求头token
if (window.localStorage.getItem('token')) {
  Axios.defaults.headers.common['admin_token'] = window.localStorage.getItem('token')
}
定义默认url
export let instance = Axios.create({
  baseURL: 'http://192.168.1.105:8080/chxckc-api'
})
```



