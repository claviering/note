# shell 编程

## 多项目修改提交，微信开发者工具上传代码

```shell
#!/bin/bash

branchName="bugfix-inputValue-weiye-0716"
commitMessage="bugfix: 地址删除空格"
projectName=(
  "OCH_WECHAT_SALES_MINI_PROGRAM" "1.0.0"
  "TRE_WECHAT_SALES_MINI_PROGRAM" "2.0.0"
  "FP_WECHAT_SALES_MINI_PROGRAM" "3.0.0"
  "CG_WECHAT_SALES_MINI_PROGRAM" "3.0.0"
  "M60_WECHAT_SALES_MINI_PROGRAM" "4.0.0"
)

# 修改文件上传 gitlab
pushToGitlab() {
  for var in ${projectName[@]};
  do
    echo /Users/linweiye/Documents/${var[0]}/pages-sub/pages/address/edit/address_edit.js
    git checkout master
    git pull
    # 新建分支
    git branch $branchName
    git checkout $branchName
    # 切换到项目目录
    cd /Users/linweiye/Documents/${var[0]}
    # 插入代码
    sed -i "" "109i\\
    if (e.detail.value) {\\
    \ \ \ \ e.detail.value = e.detail.value.replace(/\ /g, '');\\
    \ \ \ \ if (!e.detail.value.length) return;\\
    }\\
    " ./pages-sub/pages/address/edit/address_edit.js
    git add .
    git commit -m $commitMessage
    git push origin $branchName
  done
}

# 微信开发者工具上传代码
wechatwebdevtoolsUpload() {
  for var in ${projectName[@]};
  do
    cd /Users/linweiye/Documents/${var[0]}
    git checkout master
    git pull
    /Applications/wechatwebdevtools.app/Contents/MacOS/cli upload --project /Users/linweiye/Documents/${var[0]} -v ${var[1]} -d 'commitMessage'
  done
}
pushToGitlab
wechatwebdevtoolsUpload
```