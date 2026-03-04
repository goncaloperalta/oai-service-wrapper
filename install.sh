#!/bin/bash

main(){
    if ! [ $(id -u) = 0 ]; then
       echo "Must run as root"
       exit 1
    fi

    chmod +x start-oai.sh
    cp start-oai.sh /usr/local/bin/
    cp oai-ue.service /etc/systemd/system/

    chmod +x check-tunnel.sh
    cp check-tunnel.sh /usr/local/bin/
    (crontab -l ; echo "*/1 * * * * /usr/local/bin/check-tunnel.sh") | crontab -

    systemctl daemon-reload
    systemctl enable oai-ue.service
    systemctl start oai-ue.service
}

main "$@"
