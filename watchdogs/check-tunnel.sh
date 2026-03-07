#!/bin/bash

main(){
    if ! { ip link show oaitun_ue1 > /dev/null 2>&1 && ping -I oaitun_ue1 -c 1 10.0.0.5 > /dev/null 2>&1; }; then
        systemctl kill -s SIGTERM oai-ue.service
    fi
}

main "$@"
