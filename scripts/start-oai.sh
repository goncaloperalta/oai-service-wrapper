#!/bin/bash

echo -e "\n\033[0;34m[Systemd Service]\033[0m Starting OAI\033[0m\n"

cd /home/"user"/openairinterface5g/cmake_targets/ran_build/build
if [ "$1" = "ue" ]; then 
    # Add | ts "%Y-%m-%d %H:%M:%S" at the end of the script for timestamps on log file
    taskset -c 2,3 ./nr-uesoftmodem -C 765500000 --CO -55000000 -r 25 --numerology 0 --band 28 --ssb 53 --rfsim | ts "%Y-%m-%d %H:%M:%S"  # --log_config.global_log_level "debug" 
elif [ "$1" = "gnb" ]; then
    ./nr-softmodem -O ../../../../oai/conf_files/gnb.sa.band28.fr1.25PRB.rfsim.conf --rfsim
fi

/usr/local/bin/oai-stats.sh systemd_restart
