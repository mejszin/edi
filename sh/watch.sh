#!/bin/sh

while true; do
ruby ./rb/scripts/import_ftp.rb | entr -d ./trigger.sh

#find /home/ftpuser/ftp/ -type f -name "*.txt" | entr -d ./trigger.sh
done
