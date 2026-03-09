#!/bin/bash

cd /home/"user"/openairinterface5g/cmake_targets/ran_build/build
if [ "$1" = "ue" ]; then
    ./nr-uesoftmodem -C 765500000 --CO -55000000 -r 25 --numerology 0 --band 28 --ssb 53 --rfsim --log_config.global_log_level "debug"
elif [ "$1" = "gnb" ]; then
    ./nr-softmodem -O ../../../../oai/conf_files/gnb.sa.band28.fr1.25PRB.rfsim.conf --rfsim
fi

/usr/local/bin/oai-stats.sh systemd_restart
