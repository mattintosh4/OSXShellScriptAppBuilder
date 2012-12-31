#!/bin/bash
#
# OSXShellScriptAppBuilder (C) 2012 mattintosh4
#
# Usage:
#   bash <(curl https://raw.github.com/mattintosh4/OSXShellScriptAppBuilder/master/OSXShellScriptAppBuilder.sh) "module-name"

cat <<__EOF__

================================================================
              OSX Shell Script Application Builder
================================================================
author:
    mattintosh4

more info:
    https://github.com/mattintosh4/OSXShellScriptAppBuilder

__EOF__

[ -z "$1" ] && echo "モジュール名がありません" && exit

MODULE_PATH="https://raw.github.com/mattintosh4/OSXShellScriptAppBuilder/master/modules"

case "$1" in
	wine-explorer)
		MODULE="$MODULE_PATH/wine-explorer.sh";;
	macports-active-list-backup)
		MODULE="$MODULE_PATH/macports-active-list-backup.sh";;
	dot-file-switcher)
		MODULE="$MODULE_PATH/dot-file-switcher";;
	*) echo "モジュールが見つかりませんでした"; exit;;
esac

echo "=> モジュールをダウンロードしています。"
if ! curl -o ${FILE:=/tmp/tmp_$$} "$MODULE"; then
	echo "スクリプトのダウンロードに失敗しました。処理を中止します。"
	exit
fi

NAME="`awk 'NR==2' $FILE`"
NAME="${NAME#* }"
APP="$NAME".app
CONTENTS="$APP"/Contents
RESOURCES="$CONTENTS"/Resources
MACOS="$CONTENTS"/MacOS

if [ -e "$APP" ]; then
	echo "/!\ 同一名のアプリケーションが存在します。スクリプトを実行する前に削除して下さい。"
	exit
fi

echo "=> アプリケーション \"$APP\" の作成を開始します。"
mkdir -pv "$MACOS"

cat > "$CONTENTS"/Info.plist <<__EOF__
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>CFBundleDevelopmentRegion</key>
	<string>English</string>
	<key>CFBundleExecutable</key>
	<string>script</string>
	<key>CFBundleInfoDictionaryVersion</key>
	<string>6.0</string>
	<key>CFBundleName</key>
	<string>$NAME</string>
	<key>CFBundlePackageType</key>
	<string>APPL</string>
	<key>CFBundleSignature</key>
	<string>APPL</string>
</dict>
</plist>
__EOF__

mv $FILE "$MACOS"/script
chmod +x "$MACOS"/script

echo "=> ファイルをチェックしています。"
for f in "$CONTENTS"/Info.plist "$MACOS"/script
do
	echo -n "$f ... "
	if [ -f "$f" ]; then
		echo "OK"
	else
		echo "Not found"
	fi
done

echo "=> アプリケーション \"$APP\" の作成が完了しました。"
