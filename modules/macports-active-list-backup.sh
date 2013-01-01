#!/bin/bash --login
# MacPorts Active List Backup

FILE=/tmp/macports-active-list_`date +%Y-%m-%d`.txt
port installed active | awk 'NR >= 2 { sub(/^[^+]+/, "", $2); print $1, $2 }' > $FILE
open $FILE
