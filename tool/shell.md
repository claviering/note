# shell 编程

## 压缩

忽略 git 文件, 文件大小从 12.7M 减少到 1.6M

`zip -r ~/Desktop/file.zip . -x "*.git*" -x "*clouds*" -9`

## git

git branch -d feature-broadcast-weiye && git branch feature-broadcast-weiye && git checkout feature-broadcast-weiye && git add . && git commit -m "feature: 直播列表ui优化, 地址删除空格" && git push origin feature-broadcast-weiye

## 多项目修改提交，微信开发者工具上传代码

```shell
#!/bin/bash

branchName="feature-broadcast-weiye"
commitMessage="feature: 直播列表ui优化, 地址删除空格"
projectName=(
  "OCH_WECHAT_SALES_MINI_PROGRAM" "1.1.14"
  "TRE_WECHAT_SALES_MINI_PROGRAM" "3.2.3"
  "FP_WECHAT_SALES_MINI_PROGRAM" "3.4.4"
  "CG_WECHAT_SALES_MINI_PROGRAM" "2.3.4"
)
# "OCH_WECHAT_SALES_MINI_PROGRAM" "1.0.0"
# "TRE_WECHAT_SALES_MINI_PROGRAM" "2.0.0"
# "FP_WECHAT_SALES_MINI_PROGRAM" "3.0.0"
# "CG_WECHAT_SALES_MINI_PROGRAM" "3.0.0"
# "M60_WECHAT_SALES_MINI_PROGRAM" "4.0.0"

# 修改文件上传 gitlab
pushToGitlab() {
  for var in ${projectName[@]};
  do
    # 切换到项目目录
    cd /Users/linweiye/Documents/${var[0]}
    git checkout master
    git pull
    # 新建分支
    git branch $branchName
    git checkout $branchName
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