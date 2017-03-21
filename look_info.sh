#!/bin/sh

IFS=$'\n'

timestamp=$(date +%s)

var=${1}

dir=${var##*/}_${timestamp}

echo ${1}
echo ${dir}

cd 

mkdir ${dir}

cp ${1} ./${dir}/${dir}.zip

unzip -d ./${dir}/ ./${dir}/${dir}.zip > /dev/null 2>&1

cd ./${dir}/Payload/*.app/ 

plutil -convert xml1 Info.plist

cat Info.plist | less

# 删除中间文件
# cd ../../../

# rm -rf ./${dir}
