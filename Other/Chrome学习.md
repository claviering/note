# Chrome学习

## 插件

Leoh New Tab

## console
console.time()和console.timeEnd()打印计时。用来跟踪某一个操作的占用时长。每一个计时器必须拥有唯一的名字，time()的参数名和timeEnd()的参数名要一样。可以没有参数，默认计时提示为default

console.table()可以将数组、对象等复杂类型的数据打印成表格的形式

console.warn()打印一条警告信息

console.error()打印错误

console.profile() 和 console.profileEnd() 新建一个性能分析器(基于cpu的使用情况)。用于函数性能分析的利器,控制台右边的三个点，在下拉菜单中依次选择More tools -> JavaScript Profiler选项

## lighthouse

网站 audits 工具

Install
`npm i -g lighthouse`

Usage

`lighthouse https://example.com`


## 插件

- Sword Art Online (SAO) Wallpapers HD New Tab

## ESC快捷键

ESC快捷键打开控制台

## 关闭Android推荐文章

1. Open a new tab. Enter chrome://flags into the URL bar and tap Return. Once you’ve done that, enter #enable-ntp-remote-suggestions into the search bar and tap Return again.
2.  Under the Show Server-Side Suggestions on the New Tab Page flag, use the pull-down menu and select Disabled.
3.  Tap RELAUNCH NOW to apply the changes.
4.  Tap the List icon in Chrome and select Settings on the drop-down menu. Now, tap Privacy to gain access to your Privacy options.
5.  Tap Search and Suggestions to turn the option on.

## 关闭 Android 在新的 tab 中显示下载内容 

1. chrome://flags
2. search download
3. disable it

## 关闭 react Recent bookmarks

1. chrome://flags
2. search enable-ntp-bookmark-suggestions
3. disable it
