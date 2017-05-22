#!/bin/bash

scale_config=(
        "LaunchImage-800-Portrait-736h@3x.png" 2208 1242
        "LaunchImage@2x.png" 1334 750 
        "LaunchImage-800-667h@2x.png" 1334 750 
        "LaunchImage-700@2x.png" 960 640 
        "LaunchImage-568h@2x.png" 1136 640 
     )

num=${#scale_config[@]}

for (( i = 0; i < num; i++ )); do
    cache_img=${scale_config[i]}
    cp LaunchImage@3x.png ${cache_img}
    j=$((${i}+1))    
    k=$((${i}+2))
    i=$((${i}+2))
    # echo ${scale_config[j]}
    # echo ${scale_config[k]}    
    sips -z ${scale_config[j]} ${scale_config[k]} ${cache_img}
    # echo ${scale_config[i]}    
    # exit
done
