#!/bin/bash

main(){
    if ! ip a | grep -q "oaitun_ue1"; then
        kill -SIGTERM $(systemctl show --property MainPID oai-ue.service | cut -d= -f2)
    fi
}

main "$@"
