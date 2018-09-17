# Git学习

## 远程仓库重命名
git remote rename old new

## 查看远程仓库

git remote -v

## 删除远程仓库

## 添加远程仓库
git add origin http|| ssh
[参考](https://git-scm.com/docs/git-reset)

## reset a comit
```
git reset --soft HEAD^  
```

## reset file change

git checkout -- file-name

## reset after add file
git reset HEAD file-name

## 分支

git branch dev  创建分支
git checkout dev  切换分支
git checkout -b dev 创建并且切换分支
Switched to branch 'dev'
git merge dev 合并dev分支到当前分支
git branch -d dev 删除dev分支



