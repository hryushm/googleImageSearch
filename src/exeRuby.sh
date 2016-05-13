#!/bin/bash
export API_KEY=`cat ../secrets/apikey`
export SEARCH_ENGINE_ID=`cat ../secrets/id`
ruby $1 $2
