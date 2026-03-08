#!/bin/bash

increment(){
    jq ".total_restarts += 1 | .cause.$1 += 1" /var/log/oai-stats.json | tee /var/log/oai-temp.json && mv /var/log/oai-temp.json /var/log/oai-stats.json
}

main(){
    increment $1
}

main "$@"
