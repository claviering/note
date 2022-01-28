# HTML

## input 自动填充样式修改

```css
input:-webkit-autofill,
input:-webkit-autofill:hover,
input:-webkit-autofill:focus,
input:-webkit-autofill:active  {
    -webkit-box-shadow: 0 0 0px 100px red inset;
    box-shadow: 0 0 0px 100px red inset;
}
```

## input type=number 隐藏上下箭头

```css
input::-webkit-outer-spin-button,
input::-webkit-inner-spin-button {
  -webkit-appearance: none;
}
```

## 自动填充表单

https://web.dev/sign-in-form-best-practices

https://search.library.edu.eu.org/extdomains/developers.google.com/web/updates/2015/06/checkout-faster-with-autofill

`<label for="username">Email</label>`
`<input id="username" name="username" autocomplete="username" type="text" >`

Use `autocomplete="new-password"` and `id="new-password"` for the password input in a sign-up form, and for the new password in a reset-password form.

`<input type="password" autocomplete="new-password" id="new-password" …>`

Use `autocomplete="current-password"` and `id="current-password"` for a sign-in password input.

`<input type="password" autocomplete="current-password" id="current-password" …>`

数字输入键盘 `inputmode="numeric"`

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