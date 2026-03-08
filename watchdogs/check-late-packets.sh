#!/bin/bash

main(){
    if [ $(tail -n 10 /var/log/oai-ue.log | grep -o "L" | wc -l) -gt 200 ] ; then
        systemctl kill -s SIGTERM oai-ue.service
    fi
}

main "$@"
