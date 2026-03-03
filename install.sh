#!/bin/bash

main(){
    chmod +x start-oai.sh
    cp start-oai.sh /usr/local/bin/
    cp oai-ue.service /etc/systemd/system/
    
    systemctl daemon-reload
    systemctl enable oai-ue.service
    systemctl start oai-ue.service
}

main "$@"
