#!/usr/local/bin/expect -f
spawn /usr/bin/ssh-add  /Users/Jason/.ssh/github_home 
expect "Enter passphrase for /Users/Jason/.ssh/github_home:"
send "123456\n\n"
interact #  代表留在指令命令后的控制台 不加则为留在本地
