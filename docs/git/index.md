# Git 

## Tag

```sh
# 添加 tag
git tag <tagname>
git push origin --tags
```

## CheetSheet

```sh
# 设置默认分支
git config --global init.defaultBranch master

# 空目录保持
# Ignore everything in this directory
*
# Except this file
!.gitignore


# 罗列发生过修改的文件
git diff --name-only START_COMMIT..END_COMMIT
# 去重
git show --pretty="format:" --name-only START_COMMIT..END_COMMIT | sort | uniq
```

## 自动提交

```sh
# 安装
sudo wget https://raw.githubusercontent.com/aisuhua/git-auto/master/git-auto -o /usr/local/bin/git-auto
sudo chmod a+x /usr/local/bin/git-auto

# 配置 crontab 自动提交
* * * * * /usr/local/bin/git-auto -d /opt/www/aisuhua.github.io -o -p
```

## Links

- https://stackoverflow.com/a/2713363
