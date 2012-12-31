#!/bin/bash
# Dot File Switcher

FILE=/tmp/tmp_$$
cat > $FILE <<__EOF__
#!/bin/bash

(( `defaults read com.apple.finder AppleShowAllFiles` == 0 )) \
	&& defaults write com.apple.finder AppleShowAllFiles -bool TRUE \
	|| defaults write com.apple.finder AppleShowAllFiles -bool FALSE
echo "Finder を再起動します。よろしければ Enter を押して下さい。"
read
killall Finder
__EOF__
chmod +x $FILE
open $FILE