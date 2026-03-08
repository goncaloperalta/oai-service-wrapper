#!/bin/bash

main(){
    if ! { ip link show oaitun_ue1 && ping -I oaitun_ue1 -c 1 15.0.0.1; }; then
        systemctl kill -s SIGTERM oai@ue.service
        /usr/local/bin/oai-stats.sh tunnel_missing
    fi
}

main "$@"
