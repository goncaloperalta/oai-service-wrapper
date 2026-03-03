#!/bin/bash

main(){
    chmod +x start-oai.sh
    cp install.sh /usr/local/bin/
    chmod +x oai-ue.service
    cp oai-ue.service /etc/systemd/system/
    
    systemctl daemon-reload
    systemctl enable oai-ue.service
    systemctl start oai-ue.service
}

main "$@"
