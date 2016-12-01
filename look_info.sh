#!/bin/sh

timestamp=$(date +%s)

dir=`basename ${1} .ipa`_${timestamp} 

mkdir ./${dir}

cp ${1} ./${dir}/${dir}.zip

unzip -d ./${dir}/ ./${dir}/${dir}.zip > /dev/null 2>&1

cd ./${dir}/Payload/*.app/ 

plutil -convert xml1 Info.plist

cat Info.plist | less
