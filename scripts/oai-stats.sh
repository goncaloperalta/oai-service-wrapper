#!/bin/bash

function increment(){
    local stats_file="/var/log/oai-stats.json"
    local cause="$1"
    local timestamp=$(date -Iseconds)

    flock -w 10 200 || { echo "Failed to acquire lock"; exit 1; }

    jq --arg ts "$timestamp" --arg cause "$cause" --argjson max "150" '
        .total_restarts += 1
        | .cause[$cause] += 1
        | .restart_history = ((.restart_history // []) + [{"timestamp": $ts, "cause": $cause}])
        | .restart_history = .restart_history[-([$max, (.restart_history | length)] | min):]
    ' "$stats_file" > "${stats_file}.tmp" && mv "${stats_file}.tmp" "$stats_file"
} 200>"/var/lock/oai-stats.lock"

main(){
    increment "$1"
}

main "$@"
