#!/bin/bash

target='/Users/Jason/Developer/01-Engineer/Github/Me'
cd ${target}
for file in ${target}/*
do
  cd ${file}
  echo ${file} 
  git remote -v | grep push | awk '{print $2}' | git push
done

