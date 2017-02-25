#!/bin/bash

repo_path="你的本地仓库地址"
blog_path="你的本地博客地址"

# 提交本地仓库
cd ${repo_path}
./commit_repo.sh

# 提交blog
cd ${blog_path}
~/.blog_ssh-add.sh
exec_hexo.sh


