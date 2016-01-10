#!/bin/bash

remindMe(){

AC_File="/sys/class/power_supply/ADP1/online"
B_File="/sys/class/backlight/acpi_video1/brightness"

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

