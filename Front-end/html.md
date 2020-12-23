# HTML

## 密码表单使用

```html
<form>
  <input
  type="text"
  inputmode="numeric"
  autocomplete="one-time-code"
  pattern="\d{6}"
  required>
</form>
```

1. 不要使用 type="number", 会有上下箭头, 使用 type="text"
2. numeric，显示优化后的键盘，方便其输入数字
3. one-time-code 这个属性仅在 Safari 中生效，获取短信验证码

## 短信验证码自动填充

发送的短信格式, 在需要绑定动态密码的域名前加上 `@`, 在验证码前加上 `#`

```
Your OTP is: 123456

@web-top.glitch.me #123456
```
Safari 已经原生支持, Chrome 是使用的是一个名为 Web OTP API 的方法, 只能在HTTPS的域名中使用

```js
if ('OTPCredential' in window) {
  // DOMContentLoaded 事件会等待 DOM树准备好
  window.addEventListener('DOMContentLoaded', e => {
    const input = document.querySelector('input[autocomplete="one-time-code"]');
    if (!input) return;
    const ac = new AbortController();
    // 用户可以自己输入验证码并且提交，使用 AbortController 终止 Web OTP API 的自动填充
    // AbortController 还可以终止 fetch 的请求
    // 监听终止事件 ac.signal.addEventListener('abort', function(){});
    const form = input.closest('form');
    if (form) {
      form.addEventListener('submit', e => {
        ac.abort(); // 终止 Web OTP API 的自动填充
      });
    }
    navigator.credentials.get({
      otp: { transport:['sms'] },
      signal: ac.signal
    }).then(otp => {
      input.value = otp.code;
      if (form) form.submit();
    }).catch(err => {
      console.log(err);
    });
  });
}
```

## 换行

`<br>`

## 空格

`&nbsp;`

## 下拉菜单

下拉菜单，使用 HTML5的`<details>`和`<summary>` [Demo](https://codepen.io/airen/pen/MxLaVd)