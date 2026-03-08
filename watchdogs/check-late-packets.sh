#!/bin/bash

main(){
    if [ $(tail -n 10 /var/log/oai-ue.log | grep -o "L" | wc -l) -gt 10000 ] ; then
        systemctl kill -s SIGTERM oai-ue.service
        /usr/local/bin/oai-stats.sh late_packets
    fi
}

main "$@"
