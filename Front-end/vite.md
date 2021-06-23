# Vite2 + React + Antd 踩坑指南

## global is not defined

报错：

```
Uncaught ReferenceError: global is not defined
    at setImmediate.js:15
    at chunk.2VCUNPV2.js?v=e11687d4:4
    at editOnBeforeInput.js:25
    at chunk.2VCUNPV2.js?v=e11687d4:4
    at DraftEditorEditHandler.js:16
    at chunk.2VCUNPV2.js?v=e11687d4:4
    at DraftEditor.react.js:32
    at chunk.2VCUNPV2.js?v=e11687d4:4
    at Draft.js:24
    at chunk.2VCUNPV2.js?v=e11687d4:4
```

解决方案

```
<!-- index.html -->

<html>
  ...
  <body>
    <script>
      global = globalThis
    </script>
    ...
  </body>
</html>
```

## process is not defined

报错: 

`Uncaught ReferenceError: process is not defined`

或者

`(window as any).global = window;`

解决方案

添加 define 配置
```js
export default defineConfig({
  plugins: [reactRefresh()],
  define: {
    'process.env': {
      NODE_DEBUG: true,
      NODE_ENV: 'dev'
    }
  }
})
```