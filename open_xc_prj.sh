#!/bin/bash

# IFS=${echo -en "\n\b"}

cd ${1}
prj=""
for file in ./*
do
	# echo ${file}
	if [ -d ${file} ]; then
		# echo  `basename ${file}`
		if [ "`basename ${file}`" == "Pods" ]; then 
			continue
		fi
		# .xcworkspace排序时会在.xcodeproj后面
                if echo ${file##*.} | grep -w "xcworkspace" &>/dev/null; then
                        prj=${file}
                elif echo ${file##*.} | grep -w "xcodeproj" &>/dev/null; then
                        prj=${file}
		else
			/Users/Jason/Developer/01-Engineer/Github/Me/Daily_sh_set/open_xc_prj.sh ${file} 
                fi
        fi
done
if [ "${prj}" ]; then
	open ${prj}
fi
