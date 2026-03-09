#!/bin/bash

function increment(){
    local stats_file="/var/log/oai-stats.json"
    
    flock -w 10 200 || { echo "Failed to acquire lock"; exit 1; }
    jq ".total_restarts += 1 | .cause.$1 += 1" "$stats_file" > "${stats_file}.tmp" && mv "${stats_file}.tmp" "$stats_file"
} 200>"/var/lock/oai-stats.lock"

main(){
    increment "$1"
}

main "$@"
