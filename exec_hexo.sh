#!/usr/local/bin/expect -f

spawn sudo hexo g
expect "Password:"
send "你的密码\n"
interact

spawn sudo hexo d
expect "Password:"
send "你的密码\n"
interact

