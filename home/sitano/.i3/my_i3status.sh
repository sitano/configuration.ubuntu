#!/bin/sh
# shell script to prepend i3status with more stuff

i3status --config ~/.i3/i3status.conf | while :
do
    read line
    echo "FMem" `awk '/MemFree/ {print $2/1024}' /proc/meminfo` "MB | " || exit 1
    echo $line || exit 1
done
