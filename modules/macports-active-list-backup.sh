#!/bin/bash
# MacPorts Active List Backup

FILE=/tmp/macports-active-list_`date +%Y-%m-%d`.txt
/opt/local/bin/port installed active | awk 'NR >= 2 { sub(/^[^+]+/, "", $2); print $1, $2 }' > $FILE
open $FILE
