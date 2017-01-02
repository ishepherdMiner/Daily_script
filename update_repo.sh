#!/bin/bash

TARGET=~/Developer/01-Engineer/Github/Others
cd ${TARGET}
for file in ${TARGET}/*
do
  cd ${file}
  echo ${file##*/}
  git remote -v | grep fetch | awk '{print $2}' | git pull
done
