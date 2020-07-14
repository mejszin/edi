#!/bin/sh

while true; do
find /home/ftpuser/ftp/ -type f -name "*.txt" | entr -d ./trigger.sh
done
