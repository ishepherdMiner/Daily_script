#!/bin/bash

scale_config=(
        "iTunesArtwork.png" 512
        "iTunesArtwork@2x.png" 1024
        "Icon-60.png" 60
        "Icon-60@2x.png" 120
        "Icon-60@3x.png" 180
        "Icon-72.png" 72
        "Icon-72@2x.png" 144
        "Icon-29.png"    29
        "Icon-29@2x.png" 58
        "Icon-83.5@2x.png" 167
        "Icon-76.png" 76
        "Icon-76@2x.png" 152
        "Icon-76@3x.png" 228
        "Icon-114.png" 114
        "Icon-144.png" 144
        "Icon-Small-50.png" 50
        "Icon-Small-50@2x.png" 100
        "Icon-Spotlight-40.png" 40
        "Icon-Spotlight-40@2x.png" 80
        "Icon-Spotlight-40@3x.png" 120
        "Icon-Small-40.png" 40
        "Icon-Small-40@2x.png" 80
        "Icon-Small-40@3x.png" 120
        "Icon-Small.png" 29
        "Icon-Small@2x.png" 58
        "Icon-Small@3x.png" 87
        "Icon-10@2x.png" 40
        "Icon-10@3x.png" 60
        "Icon.png" 57
        "Icon@2x.png" 114
        "Icon-57.png" 57
     )

num=${#scale_config[@]}

for (( i = 0; i < num; i++ )); do
    cache_img=${scale_config[i]}
    cp logo.png ${cache_img}
    i=$((${i}+1))
    sips -Z ${scale_config[i]}x${scale_config[i]} ${cache_img}
done
