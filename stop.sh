#!/bin/bash
sudo kill -9  `ps -elf | grep "/bin/bash ./battery.sh" | awk 'NR==1{print $4}'`
