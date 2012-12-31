#!/bin/bash

if [ -z "$1" ]; then
	echo "/!\ 引数がありません。スクリプトの URL を指定して下さい。"
	exit
fi

echo "=> スクリプトファイルをダウンロードしています。"
curl -o ${FILE:=/tmp/tmp_$$} "$1" && {
	NAME=`awk 'NR==2' $FILE | cut -d' ' -f2-`
	APP="$NAME".app
	CONTENTS="$APP"/Contents
	RESOURCES="$CONTENTS"/Resources
	MACOS="$CONTENTS"/MacOS
} || echo "スクリプトのダウンロードに失敗しました。処理を中止します。" && exit

[ -e "$APP" ] \
	&& echo "/!\ 同一名のアプリケーションが存在します。スクリプトを実行する前に削除して下さい。" \
	&& exit \
	|| echo "=> アプリケーション \"$APP\" を作成します。"

mkdir -p "$MACOS"

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
	<key>CFBundleShortVersionString</key>
	<string>1.0</string>
	<key>CFBundleSignature</key>
	<string>APPL</string>
	<key>CFBundleVersion</key>
	<string>1.0.0</string>
</dict>
</plist>
__EOF__

mv $FILE "$MACOS"/script
chmod +x "$MACOS"/script

echo "=> ファイルをチェックします。"
for f in "$CONTENTS"/Info.plist "$MACOS"/script
do
    echo -n "$f"...
    test -f "$f" && echo "OK" || echo "MISS"
done

echo "=> アプリケーション \"$APP\" が作成されました。"
