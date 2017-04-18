#/bin/bash

if [ ${#} -lt 1 ]; then
    echo "Usage:look_app_encrypt.sh path/to/execute_file"
    exit 1
fi

otool -l ${1} | grep -B 2 crypt
