#!/bin/sh

echo "Starting directory watcher..."

while true; do
find /home/ftpuser/ftp/ -type f -name "*.txt" | entr -d ./rb/scripts/import_ftp.rb
done