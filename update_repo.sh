#!/bin/bash

TARGET=~/Developer/Github/Else
cd ${TARGET}
for file in ${TARGET}/*
do
  cd ${file}
  echo ${file##*/}
  git remote -v | grep fetch | awk '{print $2}' | git pull
done
