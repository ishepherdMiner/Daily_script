#!/bin/bash

## modify the path when you change the place which to store the music file
music_file_path="Music path"
cd  ${music_file_path}

## obtain datas,ting.sqlite需要自己导出
sqlite3 ting.sqlite 'select * from download_table' | awk -F "|" -v OFS='|' '{print $18,$3,$2}' > mapper

sed -i "" "s/ /_/g" ./mapper
sed -i "" "s/：/_/g" ./mapper
sed -i "" "s/:/_/g" ./mapper
sed -i "" "s/-/_/g" ./mapper
sed -i "" "s/，/_/g" ./mapper
sed -i "" "s/－/_/g" ./mapper
sed -i "" "s/？/_/g" ./mapper
sed -i "" "s/、/_/g" ./mapper
sed -i "" "s/（/_/g" ./mapper
sed -i "" "s/）/_/g" ./mapper
sed -i "" "s/！/_/g" ./mapper
sed -i "" "s/《/_/g" ./mapper
sed -i "" "s/》/_/g" ./mapper

## foreach the download directory to find the music name
for f in ./download/*
do
  ## .download文件 代表还未下载 不要
  # echo ${f##*.}
  if [ ${f##*.}x != "download"x ]; then
    cache_name=`basename ${f}`
    music_name=$(grep -r ${cache_name} ./mapper | awk -F "|" -v OFS='|' '{print $3}')

    echo ${cache_name}
    echo ${music_name}
    # echo ./download/${music_name}.mp3
    mv ./download/${cache_name} ./download/${music_name}.mp3  
    
  fi
done
