#!/bin/bash

remindMe(){

uN=`uname -a`

AC_File="/sys/class/power_supply/ADP1/online"

if [ "${uN/"debian"}" != "$uN" ]; then
B_File="/sys/class/backlight/acpi_video1/brightness"
elif [ "${uN/"Ubuntu"}" != "$uN" ]; then
B_File="/sys/class/backlight/intel_backlight/brightness"
fi

initAC=`cat $AC_File`

while [ 1 ]
  do
    sleep 2
    CurrentAC=`cat $AC_File`
    if [ $CurrentAC -ne $initAC ]
      then
        CurrB=`cat $B_File`
        echo 0 >> $B_File
        sleep 1
        echo $CurrB >> $B_File
        initAC=$CurrentAC
    fi
  done
}

remindMe &

