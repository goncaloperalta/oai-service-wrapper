```
├── configs
|   ├── oai-logrotate           # logrotate config file
|   ├── oai-stats.json          # stat tracker for crashes
|   └── oai@.service            # systemd service
├── scripts
|   ├── oai-stats.sh            # script to manage stat counter
|   └── start-oai.sh            # script to start oai
├── watchdogs
|   ├── check-late-packets.sh   # looks for an high amount of late packets
|   └── check-tunnel.sh         # looks for oai tunnel interface
├── install.sh                  # install script, run as sudo 
├── README.md
└── uninstall.sh                # uninstall script, run as sudo
```
