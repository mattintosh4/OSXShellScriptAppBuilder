#!/bin/bash
# Dot File Switcher

FILE=/tmp/tmp_$$
PREF="com.apple.finder"
PROP="AppleShowAllFiles"
cat > $FILE <<__EOF__
case `defaults read $PREF $PROP` in
	0) defaults write $PREF $PROP -bool ON;;
	1) defautls write $PREF $PROP -bool OFF;;
esac
echo "Finder を再起動します。よろしければ Enter を押して下さい。"
read
killall Finder
__EOF__
chmod +x $FILE
open $FILE
