#!/bin/bash
cd /home/user/openairinterface5g/cmake_targets/ran_build/build
3 sudo ./nr-uesoftmodem -C 765500000 --CO -55000000 -r 25 --numerology 0 --band 28 --ssb 53 --rfsim
