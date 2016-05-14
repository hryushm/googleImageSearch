#!/bin/bash
JSON_FILE="../json/$1.json"
if [ ! -f ${JSON_FILE} ]; then
    export API_KEY=`cat ../secrets/apikey`
    export SEARCH_ENGINE_ID=`cat ../secrets/id`
    ruby getJson.rb $1
fi
IMG_DIR="../img/$1"
if [ ! -d ${IMG_DIR} ]; then
    mkdir ../img/$1
    ruby getImg.rb ${JSON_FILE} ${IMG_DIR}/
fi
