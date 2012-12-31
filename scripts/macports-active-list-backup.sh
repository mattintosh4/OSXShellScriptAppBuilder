#!/bin/bash
# MacPorts Active List Backup
f=/tmp/macports-installed_`date +%Y-%m-%d`.txt
awk 'NR >= 2 { sub(/^[^+]+/, "", $2); print $1, $2 }' <(/opt/local/bin/port installed active) > $f
open $f
