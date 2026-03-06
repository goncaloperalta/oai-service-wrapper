#!/bin/bash

main(){
    if ! ip a | grep -q "oaitun_ue1"; then
        systemctl restart oai-ue.service
        sudo -u goncalo DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus notify-send "Tunnel not found, oai-ue service restarted"
    fi
}

main "$@"
