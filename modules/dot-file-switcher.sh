#!/bin/bash
# Dot File Switcher

FILE=/tmp/tmp_$$
cat > $FILE <<__EOF__
#!/bin/bash
echo "ドットファイル表示切替のため Finder を再起動します。よろしければ Enter を押して下さい。"
read
(( `defaults read com.apple.finder AppleShowAllFiles` == 0 )) \
	&& defaults write com.apple.finder AppleShowAllFiles -bool TRUE \
	|| defaults write com.apple.finder AppleShowAllFiles -bool FALSE
killall Finder
__EOF__
chmod +x $FILE
open $FILE