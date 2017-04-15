#!/bin/sh

# 已解决:
#   Q: .ipa文件名中包含空格
#   A: 修改IFS,因为每次都是一个新的shell环境,不会影响原来的环境。
#   Q: unzip 解压时,如果带.ipa文件中.app包含中文的话会乱码,变成两个.app文件,无法成功# cd到对应的目录
#   A: 把.ipa转成.tar,解包.tar文件,不会出现该问题

if [ ${#} -lt 1 ]; then
    echo "Usage:look_info.sh path/to/xxx.ipa"
    exit 1
fi

IFS=$'\n'



timestamp=$(date +%s)

var=${1}

AppDir=${var##*/}_${timestamp}

mkdir ${AppDir}

cp ${1} ./${AppDir}/${AppDir}.tar

cd ${AppDir}

# unzip -d ./${AppDir}/ ./${AppDir}/${AppDir}.zip > /dev/null 2>&1
tar -zxvf ${AppDir}.tar  > /dev/null 2>&1  

cd Payload/*.app/

plutil -convert xml1 Info.plist

cat Info.plist | less

# 退出plist后删除中间文件
cd ../../../

rm -rf ./${AppDir}
