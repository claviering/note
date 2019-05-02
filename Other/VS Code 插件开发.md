# VSCode 插件开发

## 发布

```
npm install -g vsce
vsce package 本地打包
vsce create-publisher Magen 插件发布者
vsce publish 发布和更新
vsce publish patch 自动增加版本号
```

ucsiw3fhxan2fuzyl6622heucatejimkipvy5ds2npvl22yrlaea

## WebviewPanel 开发

package.js 配置 插件启动方式

[参考](https://code.visualstudio.com/api/references/activation-events)

```js
{
  "name": "20-20-20",
  "version": "1.0.0",
  "description": "A helpful trick called the 20-20-20 rule",
  "publisher": "Megan",
	"engines": {
		"vscode": "^1.26.0"
	},
	"categories": [
		"Other"
  ],
  "activationEvents": [
		"onCommand:preventingEyeStrain.start",
		"onCommand:preventingEyeStrain.stop",
    "onWebviewPanel:preventingEyeStrain",
    "*"
  ],
  "contributes": {
		"commands": [
			{
				"command": "preventingEyeStrain.start",
				"title": "Stroll to grab a cup of coffee",
				"category": "Eye Strain"
			},
			{
				"command": "preventingEyeStrain.stop",
				"title": "996.icu Stop Preventing Eye Strain",
				"category": "Eye Strain"
			}
		]
	},
  "main": "./out/extension.js",
  "scripts": {
		"vscode:prepublish": "tsc -p ./",
		"compile": "tsc -p ./",
		"watch": "tsc -w -p ./",
		"postinstall": "node ./node_modules/vscode/bin/install"
	},
  "keywords": [],
  "author": "",
  "license": "ISC",
  "devDependencies": {
    "@types/node": "^11.13.8",
    "tslint": "^5.16.0",
    "typescript": "^3.4.5",
    "vscode": "^1.1.33"
  }
}

```