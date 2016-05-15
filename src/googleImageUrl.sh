#!/bin/bash
script_dir=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)
JSON_FILE="${script_dir}/../json/$1.json"
if [ ! -f ${JSON_FILE} ]; then
    export API_KEY=`cat ${script_dir}/../secrets/apikey`
    export SEARCH_ENGINE_ID=`cat ${script_dir}/../secrets/id`
    ruby ${script_dir}/getJson.rb $1
fi
IMG_DIR="${script_dir}/../img/$1"
if [ ! -d ${IMG_DIR} ]; then
    mkdir $IMG_DIR
fi
ruby ${script_dir}/getOneImg.rb ${JSON_FILE}
