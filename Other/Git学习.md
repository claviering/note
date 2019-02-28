# Git学习

## 快速 clone

`git clone --depth 1 repo`

## 建立追踪关系

`git branch --set-upstream dev origin/dev`

## 配置错误用户名和邮箱, github 不统计 contributions

解决方法

clone 一个新的 repo
`git clone --bare repo`

运行下面脚本

```sh
#!/bin/sh
git filter-branch --env-filter '
OLD_EMAIL="旧的Email地址"
CORRECT_NAME="正确的用户名"
CORRECT_EMAIL="正确的邮件地址"
if [ "$GIT_COMMITTER_EMAIL" = "$OLD_EMAIL" ]
then
 export GIT_COMMITTER_NAME="$CORRECT_NAME"
 export GIT_COMMITTER_EMAIL="$CORRECT_EMAIL"
fi
if [ "$GIT_AUTHOR_EMAIL" = "$OLD_EMAIL" ]
then
 export GIT_AUTHOR_NAME="$CORRECT_NAME"
 export GIT_AUTHOR_EMAIL="$CORRECT_EMAIL"
fi
' --tag-name-filter cat -- --branches --tags
```
`git log`

检查用户名和邮箱

强制提交

`git push --force origin master`

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
git checkout dev  切换分支 dev 可以是远程分支
git checkout -b dev 创建并且切换分支
git checkout -b dev sha1 从 sha1 位置创建并且切换分支
git checkout --orphan dev 创建并且切换分支,没有历史记录
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

## 找到要回滚的commitID
`git log`
`git reset --hard cedc856`
`git push --force origin master`

## 保持develop分支与master分支同步：
`git checkout develop`

`git rebase master`

## 工作流
1. 去自己的工作分支
`$ git checkout work`

2. 工作
....

3. 提交工作分支的修改
`$ git commit -a`

4. 回到主分支
`$ git checkout master`

5. 获取远程最新的修改，此时不会产生冲突
`$ git pull`

6. 回到工作分支
`$ git checkout work`

7. 用rebase合并主干的修改，如果有冲突在此时解决
`$ git rebase master`

`git add .`

`git commit -m "message"`

`git rebase --continue` 可以不用这命令
`git rebase --skip` || `git pull (rebase) vsCode`

8. 回到主分支
`$ git checkout master`

9. 合并工作分支的修改，此时不会产生冲突。
`$ git merge work`

10. 提交到远程主干
`$ git push`

## git rebase

`git rebase -i  [startpoint]  [endpoint]`
如果不指定[endpoint]，则该区间的终点默认是当前分支HEAD所指向的commit

## 格式化 Log 输出

`git log --oneline`

## Github 贡献代码

```
docs，文档类修改
fix，bug 修复
feat，升级、新增特性
test，新增、修改测试
```

Fork and Pull request

Fork 到自己的仓库

git clone 下来

修改 git add .  git commit git push

然后提 Pull request

保持同步
```shell
git remote add upstream https://github.com/user/repo.git
git fetch upstream
git checkout master
git merge upstream/master
```
## 合并某个 commit 的代码

`git check-pick commitID`

## 合并多个 commit 为一个 commit

`git rebase -i [startpoint]  [endpoint]`

startpoint: 合并不包含此 commit

不指定 endpoint 默认是当前分支HEAD所指向的commit

:x 保存退出后提示 Could not execute editor

解决:
`git config --global core.editor "/usr/bin/vim"`