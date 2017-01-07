#!/bin/bash

DATE=$(date +%s)
CheckList=('Daily_knowledge_set','Daily_sh_set','Daily_ui_objc_set','Daily_ui_set','Daily_modules')
TARGET=~/Developer/01-Engineer/Github/Me
# echo ${DATE}
cd ${TARGET}
for file in ${TARGET}/*
do
  cd ${file}
  echo ${file##*/}
  git remote -v | grep fetch | awk '{print $2}' | git pull
done

for file in ${TARGET}/*
do
if echo "${CheckList[@]}" | grep -w ${file##*/} &>/dev/null; then
  cd ${file}
  # echo ${file}
  git status | grep "nothing to commit" > /dev/null 2>&1
  if [ $? != 0 ]; then
    echo "提交新的Commit:"${file##*/}_${DATE}
    git add .
    git commit -m ${file##*/}_${DATE}
    git push
  else
    echo "没有更改:"${file##*/}
  fi
fi
done
