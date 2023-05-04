# VS Code学习

## 配置不同语言的格式化工具

```json
"[python]": {
  "editor.defaultFormatter": "ms-python.autopep8",
  "editor.formatOnSave": true
}
```

## 多个 configurations 中 debug

In order to start a debug session, first select the configuration named **Launch Program** using the **Configuration dropdown** in the Run view. Once you have your launch configuration set, start your debug session with `F5`.

## 调试 mocha

```json

```

## vscode 调试 typescript

launch.json
```
{
  // Use IntelliSense to learn about possible attributes.
  // Hover to view descriptions of existing attributes.
  // For more information, visit: https://go.microsoft.com/fwlink/?linkid=830387
  "version": "0.2.0",
  "configurations": [
    {
      "type": "node",
      "request": "launch",
      "name": "Launch Program",
      "program": "${file}",
      "preLaunchTask": "tsc: build - tsconfig.json",
      "outFiles": [
        "${workspaceFolder}/out/**/*.js"
      ]
    }
  ]
}
```

## 隐藏导航栏文件路径

```
How to hide directory/function path top bar in VSCode
From Preferences -> Settings, type breadcrumb
```

## 科技感十足的主题 monokai charcoal

### how to use

```
cd ~/.vscode/extensions/
git clone git@github.com:74th/vscode-monokaicharcoal.git
```

restart VSCode and change the theme to monokai-charcoal(HC)

## 颜色设置

在 user setting 中才有效

## VueDX 插件

通过扩展TypeScript扩展，此扩展为.vue文件提供了诸如类型检查，自动补全，重命名和重构之类的功能。

1. Import Vue files in JS/TS files.
2. Use named exports from Vue files.
3. Infers global components in the project.
4. Suggests named exports from Vue files
5. Auto import components from Vue files

## debug python 添加参数

`"args": ["-i", "pa.png"],`

## 调试忽略文件

配置 skipFiles

## 调试自动重启

```json
{
  "runtimeExecutable": "nodemon",
  "restart": true,
  "console": "integratedTerminal"
}
```

## 发布插件

插件管理地址

https://marketplace.visualstudio.com/manage/publishers/weiye?noPrompt=true

发布教程

https://code.visualstudio.com/api/working-with-extensions/publishing-extension

```shell
nvm use 14
npm i -g vsce
vsce login weiye
vsce publish 0.1.1
```


## 实时可视化Debug：VS Code 开源新工具，一键解析代码结构

Debug Visualizer

https://mp.weixin.qq.com/s/943dZHSZyQbjlxTpv54w7Q

项目地址：https://github.com/hediet/vscode-debug-visualizer

## egg.js 调试配置

```js
{
  "version": "0.2.0",
  "configurations": [
    {
      "name": "Launch Egg",
      "type": "node",
      "request": "launch",
      "cwd": "${workspaceRoot}",
      "runtimeExecutable": "npm",
      "windows": { "runtimeExecutable": "npm.cmd" },
      // 启动我们的 egg-bin debug 并默认是 brk, 传命令行参数
      "runtimeArgs": [ "run", "debug", "--", "--inspect-brk", "--port", "3002"],
      // 日志输出到 Terminal，否则启动期的日志看不到
      "console": "integratedTerminal",
      "protocol": "auto",
      // 进程重启后自动 attach
      "restart": true,
      // 因为无需再 proxy，故改回原来的 9229 端口
      "port": 9229,
      // 自动 attach 子进程 
      "autoAttachChildProcesses": true,
      "env": {
        "NODE_ENV": "uat"
      },
    }
  ]
}
```

## 调试指定版本

`"runtimeVersion": "7.8.0",`

## 调试设置环境

```
"env": {
    "NODE_ENV": "uat"
},
```

## 字体和显示

Font Weight 设置为 Bold

Font Aliasing 设置为 antialiased

## 快捷键

### Toggle folding
You can now expand and collapse a folding region with the Toggle Fold (⌘K ⌘L) command

## 添加环境变量

Now open the Command Palette (⇧⌘P) and type 'shell command' to find the Shell Command: Install 'code' command in PATH command.

alias code="/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code"

## Kite 插件

AI python 补全插件

## python 不会自动补全问题

打开 setting, 搜索 `python.autoComplete` 把 `Auto Complete: Add Brackets` 选上

## GitLens 插件水平滚动问题

 set the `gitlens.currentLine.scrollable` setting to `false`

## 水平自动换行

设置 wordWrap off

`alt + z`

## 配置 ESLint

npm i -D 下载包
```json
"devDependencies": {
 "eslint-config-airbnb": "^17.1.0",
 "eslint-config-prettier": "^3.1.0",
 "eslint-plugin-import": "^2.14.0",
 "eslint-plugin-jsx-a11y": "^6.1.1",
 "eslint-plugin-prettier": "^3.0.0",
 "eslint-plugin-react": "^7.11.0"
}
```
ESLint 勾选 Auto Fix On Save

## 冲突合并提示

设置

Merge-conflict > Code Lens: Enabled, Editor: Code Lens: Enabled

## VSCode terminal

VSCode 默认使用不登陆的 shell, 加载 .bashrc 文件

配置 VSCode 使用 login shell, 就会加载 .bash_prefile

[terminal 官网文档](https://code.visualstudio.com/docs/editor/integrated-terminal#_linux-os-x)

```js
// macOS:
"terminal.integrated.shellArgs.osx": [ "-l" ]
// Linux
"terminal.integrated.shellArgs.linux": [ "-l" ]
```
```

## LaTeX-Workshop 插件配置

使用 xelatex 编译：

在latex源文件的第一行加入如下指令即可

`%!TEX program = xelatex`

如果需要在编译出PDF文件后，删除临时文件，则加上如下配置：

`"latex-workshop.latex.clean.enabled": true`

使用命令 `LaTeX Workshop: Build LaTeX project` 编译

## Git history

```
> git view file history
```

## emmet 缩写


```css
m10 margin: 10px;
df display: flex;
p10 padding: 10px;
pt10 padding-top: 10px;
p[myatter='']
单词的开头+属性值
```

## HTTP Server插件使用
F1 > Simple HTTP Server: Create HTTP Server With Current File

## EditorConfig for VS Code
配置
项目根目录新建.editorconfig
```js
root = true

[*]
charset = utf-8
indent_style = space
indent_size = 2
end_of_line = lf
insert_final_newline = true
trim_trailing_whitespace = true
```

## Vue文件缩写

File -> preferneces -> User snippets -> Vue

vue

vts

```js
{
    "Print to console": {
        "prefix": "vue",
        "body": [
            "<template>",
            " <div>\n",
            " </div>",
            "</template>\n",
            "<script>",
            "export default {",
            "  data () {",
            "    return {",
            "    }",
            "  }",
            "}",
            "</script>\n",
            "<style scoped lang=\"less\">",
            "</style>",
            "$2"
        ],
        "description": "Log output to console"
    },
    "vue-cli3": {
        "prefix": "vts",
        "body": [
            "<template>",
            " <div class=\"${TM_FILENAME_BASE}\">\n",
            " </div>",
            "</template>\n",
            "<script lang=\"ts\">",
            "import { Component, Vue } from 'vue-property-decorator'\n",
            "@Component({",
            "  components: {",
            "  }",
            "  })",
            "export default class ${TM_FILENAME_BASE} extends Vue {",
            "}",   
            "</script>\n",
            "<style scoped lang=\"scss\">",
            "</style>\n"
        ],
        "description": "vue-cli3 for typescript and sass"
    },
    "express in node": {
        "prefix": "exp",
        "body": [
            "const express = require('express')",
            "const app = express()\n",
            "app.get('/', (req, res) => {",
            "  res.send('ok')",
            "})",
            "app.listen(3000, () => {",
            "console.log('running in:')",
            "  console.log('http://127.0.0.1:3000')",
            "})"
        ],
        "description": "use express in node"
    },
    "express in node using art-template": {
        "prefix": "ept",
        "body": [
            "const express = require('express')",
            "const app = express()",
            "app.engine('html', require('express-art-template'));\n",
            "app.get('/', function (req, res) {",
            " res.render('index.html', {",
            "   user: {",
            "   name: 'aui',",
            "   tags: ['art', 'template', 'nodejs']",
            "   }",
            " });",
            "});\n",
            "app.listen(3000, () => {",
            "console.log('running in:')",
            "  console.log('http://127.0.0.1:3000')",
            "})"
        ],
        "description": "use express and art-template in node"
    }
}
```
js from react
```js
{
  "reactFormApp": {
    "prefix": "react",
    "body": [
      "import React, { Component } from 'react'\n",
      "class ${TM_FILENAME_BASE} extends Component {",
      "  render () {",
      "    return (",
      "      <div className=\"${TM_FILENAME_BASE}\">",
      "        $1",
      "      </div>",
      "    )",
      "  }",
      "}\n",
      "export default ${TM_FILENAME_BASE};"
    ],
    "description": "react from app"
  }
}
```

## 设置快捷键

File -> preferneces -> keyboard shortcut

## VSCode自动编译ts文件
1. tsc --init 生成tsconfig.json，改"outDir": "./js"
2. 点击任务 -> 运行任务 -> 监视tsc


## 折叠注释
```
C#: #region and #endregion
C/C++: #pragma region and #pragma endregion
CSS/Less/SCSS: /*#region*/ and /*#endregion*/
Coffeescript: #region and #endregion
F#: //#region and //#endregion and (#_region) and (#_endregion)
Java: //#region and // #endregion and //<editor-fold> and //</editor-fold>
HTML:
PHP: #region and #endregion
Powershell: #region and #endregion
Python: #region and #endregion
TypeScript/JavaScript: //#region and //#endregion and //region and //endregion
VB: #Region and #End Region
Bat: ::#region and ::#endregion
Markdown: <!-- #region --> and <!-- #endregion -->
```

## My setting
```js
{
    "editor.tabSize": 2,
    "terminal.integrated.shell.windows": "C:\\WINDOWS\\System32\\cmd.exe",
    "workbench.activityBar.visible": false,
    "files.autoSave": "onFocusChange",
    "editor.minimap.enabled": false,
    "editor.renderWhitespace": "boundary",
    "editor.renderControlCharacters": false,
    "breadcrumbs.enabled": false,
    "workbench.iconTheme": "vscode-icons",
    "workbench.colorTheme": "Monokai",
    "git.ignoreLegacyWarning": true,
    "editor.wordWrap": "on",
    "explorer.confirmDelete": false,
    "less.compile": {
        "compress":  true,  
        "sourceMap": false, 
        "out": "${workspaceRoot}\\css\\", 
    },
    "workbench.statusBar.feedback.visible": false,
    "explorer.confirmDragAndDrop": false,
    "shs.serverPort": 8085,
    "markdown-toc.depthFrom": 2,
    "emmet.showSuggestionsAsSnippets": true,
    "editor.snippetSuggestions": "top",
    "emmet.triggerExpansionOnTab": true,
    "githubCompatibility": true,
    "fileheader.Author": "lin weiye",
    "fileheader.LastModifiedBy": "weiye"
}
```

## 缩写
```
clg -> console.log
```

## 和vim快捷键冲突
屏蔽Vim快捷键
```
"vim.handleKeys": {
    "<C-a>": false,
    "<C-e>": false,
    "<C-b>": false,
    "<C-f>": false
},
```


## 快捷键
[官网快捷键](https://code.visualstudio.com/shortcuts/keyboard-shortcuts-windows.pdf)

- CTRL + BackSpace/Delete 删除一个单词
- CTRL + Shift +  左右，光标选择移动
- CTRL + 左右，光标移动
- ALT + 上下，移动屏幕
- CTRL + G 跳行数
- ALT + 左右方向键，切换窗口
- CTRL+ K V 分屏预览markdown
- CTRL + Shift + V markdown预览
- F11 全屏
- CTRL + X 删除行
- CTRL + J 控制台
- CTRL + P 控制台
- CTRL + \ 分屏
- CTRL + ` 打开cmd
- CTRL + 1 2 3 界面切换
- :number + enter 跳转行
- CTRL + 鼠标左键 F12，跳到函数定义那里
- CTRL + Shift [ / ] 折叠代码
- 上下移动一行： Alt+Up 或 Alt+Down
- 向上向下复制一行： Shift+Alt+Up或Shift+Alt+Down
- 左侧边栏 打开资源 ctrl+shift+E打开搜索 ctrl+shift+F
- 重命名：比如要修改一个方法名，可以选中后按F2，输入新的名字，回车，会发现- 所有的文件都修改过了。
- 查找 Ctrl+F
- 查找替换 Ctrl+H
- 自动保存：File -> AutoSave ，或者Ctrl+Shift+P，输入 auto
- ALT + 鼠标左键 多位置编辑
- ALT + Shift + 鼠标左键 多行编辑
- ALT + CTRL + Shift 多行编辑
- view -> toggle miniMap
- CTRL + Shift + P View in Browser 浏览器打开html
- 颜色主题 File -? preferences -> color theme -> monokai
- CTRL + Shift + E 打开左侧文件
- CTRL + Shift + X 打开左侧插件
- command shift k 删除行
- command shift 左右 选择到行首行尾
- option command + [] 折叠代码
- control + G 定位行数
- command + p + @ 搜索函数方法
- Ctrl + Alt + A 快速添加函数注释 (Document this 插件快捷键)
 

## 安装插件

快捷键Ctrl + P，打开插件，输入 ext install
### 插件列表
- live-server 文件热加载
- HTML Snippets
- HTML CSS Support view a list of attributes via ctrl + space 配置"css.fileExtensions": [ "css", "scss"]
- emmet 开发者jakethashi
- view in browser 开发者 Koppt Ho (ctrl + F1 在默认的浏览器中运行当前的html)
- vscode-icon （让vscode的文件夹目录添加上对应的图标）
- AutoFileName (文件路径自动补全插件)
- Bracket Pair Colorizer （让括号有独立的颜色）
- vetur （语法高亮、智能感知、Emmet等）
- VueHelper （snippet代码片段） oysun 
- easy less（保存后自动编译）
- JavaScript (ES6) code snippets
- TODO
- REST Client 它允许您在Visual Studio Code中直接发送 HTTP 请求并查看响应
- 自动闭合标记(Auto Close Tag)和自动重命名标记(Auto Rename Tag)
- highlight-matching-tag
- 跳转到 CSS 定义行 – CSS Peek
  + Peek: load the css file inline and make quick edits right there. (Ctrl+Shift+F12)
  + Go To: jump directly to the css file or open it in a new editor (F12)
  + Hover: show the definition in a hover over the symbol (Ctrl+hover)
- Beautify
- EditorConfig for VS Code
- HTTP Server / HTML Preview 作者shawn Funke
- sass 作者Robin Bentley
- EsLint (Dirk Beaumer) VsCode 读取项目文件的Eslint规则 保存时自动修复格式错误
- RegExp Preview and Edito 完美的展示你写的正则,图形化给你看你写正则的形成
- fileheader ctrl+alt+i 顶部注释模板，可定义作者、时间等信息，并会自动更新最后修改时间
- Node.js Modules Intellisense (Zongmin Lei) 对于node_module的智能提示
- markdown toc (AlanWalk)
- BookMarks
- fileheader
- setting sync 配置同步到 git
- REST Client 比 postman 好用的的插件
- polacode 代码截图保存 >polacode
- GitLens

### React插件

- ES7 React/Redux/GraphQL/React-Native snippets
- Useful React Snippets



#### EsLint插件配置

[博客参考](https://juejin.im/post/5b9dee8ff265da0afe62d1dd)


## 下载安装

官网


