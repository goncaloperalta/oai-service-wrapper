#!/bin/bash

main(){
    local node=$1

    if [[ "$node" != "ue" && "$node" != "gnb" ]]; then
        echo "Usage: $0 [ue|gnb]"
        exit 1
    fi

    if [ $(tail -n 10 /var/log/oai.log | grep -o "L" | wc -l) -gt 10000 ] ; then
        systemctl kill -s SIGTERM oai@${node}.service
        /usr/local/bin/oai-stats.sh late_packets
    fi
}

main "$@"
