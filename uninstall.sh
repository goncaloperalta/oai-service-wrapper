#!/bin/bash

main(){
    systemctl disable oai-ue.service
    systemctl stop oai-ue.service
    systemctl daemon-reload

    rm -f /usr/local/bin/start-oai.sh
    rm -f /etc/systemd/system/oai-ue.service
}

main "$@"
