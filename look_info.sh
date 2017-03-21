#!/bin/sh

IFS=$'\n'

timestamp=$(date +%s)

var=${1}

AppDir=${var##*/}_${timestamp}

mkdir ${AppDir}

cp ${1} ./${AppDir}/${AppDir}.zip

unzip -d ./${AppDir}/ ./${AppDir}/${AppDir}.zip > /dev/null 2>&1

cd ./${AppDir}/Payload/*.app/

plutil -convert xml1 Info.plist

cat Info.plist | less

# 退出后plist删除中间文件
cd ../../../

rm -rf ./${AppDir}
