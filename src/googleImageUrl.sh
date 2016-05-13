#!/bin/bash
export API_KEY=`cat ../secrets/apikey`
export SEARCH_ENGINE_ID=`cat ../secrets/id`
ruby getJson.rb $1
mkdir ../img/$1
ruby getOneImg.rb ../json/$1.json ../img/$1/
