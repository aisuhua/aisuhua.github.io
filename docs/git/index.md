# Git 

## CheetSheet

```sh
# 设置默认分支
git config --global init.defaultBranch master
```

## 自动提交

```sh
# 安装
sudo wget https://raw.githubusercontent.com/aisuhua/git-auto/master/git-auto -o /usr/local/bin/git-auto
sudo chmod a+x /usr/local/bin/git-auto

# 配置 crontab 自动提交
* * * * * /usr/local/bin/git-auto -d /opt/www/aisuhua.github.io -o -p
```
