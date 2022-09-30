# Git学习

## git清除已提交的敏感信息

```sh
git filter-branch --force --index-filter 'git rm --cached --ignore-unmatch path/to/file_to_del.txt' --prune-empty --tag-name-filter cat -- --all
git push origin --force --all
```

## change https to ssh

git remote set-url origin <you ssh remote>

## GitHub 新功能：可以设置markdown的图片只在light mode 或者 dark mode 中显示

Specifying the theme an image is shown to
You can specify the theme an image is displayed to by appending #gh-dark-mode-only or #gh-light-mode-only to the end of an image URL, in Markdown.

We distinguish between light and dark color modes, so there are two options available. You can use these options to display images optimized for dark or light backgrounds. This is particularly helpful for transparent PNG images.

|Context	|URL|
|- |-|
|Dark Theme|	![GitHub Light](https://github.com/github-light.png#gh-dark-mode-only) |
|Light Theme|	![GitHub Dark](https://github.com/github-dark.png#gh-light-mode-only) |

## 不校验证书

`git config http.sslVerify false`

`git -c http.sslVerify=false clone https://example.com/path/to/git`

## 修改初始化默认分支

`git config --global init.defaultBranch main`

## 验证 git commit 规范

https://woai3c.gitee.io/introduction-to-front-end-engineering/02.html#git-%E8%A7%84%E8%8C%83

## git submodule 子模块

项目中添加子模块 `git submodule add <remote_repo> <dir>`

初始化子模块 `git submodule init` .git/config 中才会引入子模块

提交子模块 `cd <submodule dir> && git add . && git commit -m "message" && git push origin main`

更新项目中的子模块 `git submodule update`

更新项目中子模块的 commit id `git add . && git commit -m "update submodule to lastest commit id"`

更新多个子模块 `git submodule foreach git pull`

克隆带有子模块的项目 `git clone --recurse-submodules <remote_repo>`

## 合并多个分支

`git reset --soft HEAD~3 && git commit -m 'xxx'`

## 删除多个分支

```
git branch -d `git branch --list '[bugfix|feature]*'`
```

## 文件回滚

`git checkout <commit hash> -- file1/to/restore file2/to/restore`

```
git checkout df5c941b6100660 -- modules/allocate/client/assets/css/allocate.css modules/core/client/assets/css/font/font-awesome.css modules/core/client/assets/css/inspinia/inspinia.css modules/dashboard/client/assets/css/dashboard.css modules/operation/client/assets/css/operation.css modules/order/client/assets/css/order.css modules/store/client/assets/css/store.css modules/target/client/assets/css/target.css
```

## 删除 master 以外的所有分支

`alias gbr="git branch | grep -v "master" | xargs git branch -D"`

## 修改最后一次提交信息

`git commit --amend`

## 查看提交

```
git log --since="0 am" 　　　     # 查看今日的提交
git log --author="shfshanyue"     # 查看 shfshanyue 的提交
git log --grep="#12"              # 查找提交信息中包含关键字的提交
git log -S "setTimeout"           # 查看提交内容中包含关键字的提交
```

## 从 git 中删除文件, 但是项目中不删除

`git rm --cached fileName`

## Another git process seems to be running in this repository

`rm -f ./.git/index.lock`

## 拉取某个分支

`git clone -b <branch> <remote_repo>`

## git merge 与 git rebase 的区别

`git merge` 合并分支并生成新的 commit ID

`git rebase` 把当前分支的 commit ID 提到 rebase commit ID 的最前面, 生成新的 commit ID, 之前的 commit ID 丢失

## git pull fetch

- git pull 从远程拉取最新版本到本地, 自动合并

- git fetch 从远程获取最新版本到本地的远程仓库副本, 不会自动合并

## 查找全部历史 commit 的特殊修改内容

`git grep <regexp> $(git rev-list --all)`

if you run into an "Argument list too long" error.

`git rev-list --all | xargs git grep <expression>`

## git reset

`git reset --hard [commit id] | [tag name]`  文件内容全部回滚, 文件丢失

`git reset --mixed [commit id] | [tag name]` 文件内容不回滚, 回滚到 add 之前

`git reset --soft [commit id] | [tag name]` 文件内容不回滚, 回滚到 comit 之前 add 之后

## 提交空文件夹

文件夹下面新建 `.gitkeep`

## http 保存密码

```
$ git config credential.helper store
$ git push http://example.com/repo.git
Username: <type your username>
Password: <type your password>
```

## 冲突合并

`git commit -am 'Conflicts resolved'`

## 删除远程分支

`git push origin -d <branch>`

## 查看远程分支和本地分支的对应关系

`git remote show origin`

## 远程删除了分支，本地也想删除

`git remote prune origin`

`git fetch -p && git branch -vv | awk "/: gone]/{print \$1}" | xargs git branch -D`

## 优雅的提交Commit信息

- type: commit 的类型
- feature: 新特性
- bugfix: 修改问题
- refactor: 代码重构
- docs: 文档修改
- style: 代码格式修改, 注意不是 css 修改
- test: 测试用例修改
- chore: 其他修改, 比如构建流程, 依赖管理.
- scope: commit 影响的范围, 比如: route, component, utils, build...
- subject: commit 的概述
- body: commit 具体修改内容, 可以分为多行
- footer: 一些备注, 通常是 BREAKING CHANGE 或修复的 bug 的链接.
- revert: 恢复之前的提交

fix（修复BUG）

```
// 示例1
fix(global):修复checkbox不能复选的问题
// 示例2 下面圆括号里的 common 为通用管理的名称
fix(common): 修复字体过小的BUG，将通用管理下所有页面的默认字体大小修改为 14px
// 示例3
fix(test): value.length -> values.length
```

## 查看某段代码是谁写的

`git blame <file-name>`
`git blame -L 104,+10 <file-name>`

## tag

标签操作

```
git tag -a v0.0.1 -m 'message'
git tag
git push origin --tags
```

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
git config --global user.name "claviering"
git config --global user.email "claviering@gmail.com"
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

`git rebase --continue`
`git rebase --skip` || `git pull (rebase) vsCode`

1. 回到主分支
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

`git cherry-pick commitID`

## 合并多个 commit 为一个 commit

`git rebase -i [startpoint]  [endpoint]`

startpoint: 合并不包含此 commit

不指定 endpoint 默认是当前分支HEAD所指向的commit

:x 保存退出后提示 Could not execute editor

解决:
`git config --global core.editor "/usr/bin/vim"`