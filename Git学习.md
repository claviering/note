# Git学习

[指令大全](https://segmentfault.com/a/1190000016345117)

## 3个规则

1. Create a Git repository for every new project
2. Greate a new branch for every new feature
3. Use Pull requests to merge code to Master

## 安装配置

```
git config --global user.name "Your Name"
git config --global user.email "email@example.com"
ssh-keygen -t rsa -C "youremail@example.com"
```

## 远程仓库重命名
`git remote rename old new`

## 查看远程仓库

`git remote -v`

## 删除远程仓库

## 添加远程仓库
`git add origin http|| ssh`
[参考](https://git-scm.com/docs/git-reset)

## reset a comit
```
git reset --soft HEAD^  
```

## reset file change
`git checkout -- . #从暂存区取出文件覆盖工作区`
`git checkout -- file-name`

## reset after add file
```
git add file#.或*代表全部添加
git rm --cached 在commit之前撤销git add操作
git reset head 好像比上面git rm --cached更方便
```

## pull

git pull <remoter> <branch>

## 分支
```shell
git branch 查看分支 -a 全部分支 -r 远程分支
git branch dev  创建分支
git checkout dev  切换分支
git checkout -b dev 创建并且切换分支
Switched to branch 'dev'
git merge dev 合并dev分支到当前分支
git branch -d dev 删除dev分支
git branch -m old_branch new_branch         # Rename branch locally    
git push origin :old_branch                 # Delete the old branch    
git push --set-upstream origin new_branch   # Push the new branch, set local branch to track the new remote
```

## 查看修改
想看到最近一次提交所有更改过的文件

对应命令 `git log -n 1 --stat`

想看到最近一次提交所有更改的细节

对应命令 `git log -n 1 -p`

查看指定commit hashID的所有修改：

`git show commmitId`

查看指定commit hashID的具体文件的修改：

`git show commmitId fileName`

## delete Untracked file

`git clean -f`


