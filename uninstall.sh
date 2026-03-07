#!/bin/bash

main(){
    if ! [ $(id -u) = 0 ]; then
        echo "Must run as root"
        exit 1
    fi

    systemctl disable oai-ue.service
    systemctl stop oai-ue.service
    systemctl daemon-reload

    crontab -l | grep -v "/usr/local/bin/check-tunnel.sh" | crontab -
    rm -f /etc/cron.hourly/logrotate
    rm -f /etc/logrotate.d/oai-ue
    rm -f /usr/local/bin/start-oai.sh
    rm -f /usr/local/bin/check-tunnel.sh
    rm -f /etc/systemd/system/oai-ue.service
}

main "$@"
