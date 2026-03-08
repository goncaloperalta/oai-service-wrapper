```
├── configs
|   ├── oai-logrotate        # logrotate config file
|   ├── oai-stats.json       # stat tracker for crashes
|   └── oai@.service         # systemd service
├── scripts
|   ├── oai-stats.sh         # script to manage stat counter
|   └── start-oai.sh         # script to start oai
├── watchdogs
|   ├── check-late-packets   # looks for an high ammount of late packets
|   └── check-tunnel.sh      # looks for oai tunnel interface
├── install.md               # install script, run as sudo 
├── README.md
└── uninstall.md             # uninstall script, run as sudo
```
