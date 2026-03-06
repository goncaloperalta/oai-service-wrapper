#!/bin/bash

main(){
    if ! [ $(id -u) = 0 ]; then
       echo "Must run as root"
       exit 1
    fi

    cp configs/oai-ue /etc/logrotate.d/
    cp scripts/start-oai.sh /usr/local/bin/
    cp configs/oai-ue.service /etc/systemd/system/

    cp watchdogs/check-tunnel.sh /usr/local/bin/
    (crontab -l ; echo "*/1 * * * * /usr/local/bin/check-tunnel.sh") | crontab -

    systemctl daemon-reload
    systemctl enable oai-ue.service
    systemctl start oai-ue.service
}

main "$@"
