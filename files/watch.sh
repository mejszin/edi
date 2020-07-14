#!/bin/sh

while true; do
#ls -d /home/ftpuser/ftp/* |entr -d ./first.sh
find /home/ftpuser/ftp/ -type f -name "*.txt" | entr -d ./first.sh
done
