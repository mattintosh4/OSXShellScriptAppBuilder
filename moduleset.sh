MODULE_PATH='https://raw.github.com/mattintosh4/OSXShellScriptAppBuilder/master/modules'
case "$1" in
	"wine-explorer"					) MODULE_PATH="$MODULE_PATH/wine-explorer.sh";;
	"macports-active-list-backup"	) MODULE_PATH="$MODULE_PATH/macports-active-list-backup.sh";;
	"dot-file-switcher"				) MODULE_PATH="$MODULE_PATH/dot-file-switcher.sh";;
	*								) echo "モジュールが見つかりませんでした"; exit;;
esac
echo "=> モジュールをダウンロードしています。"
if ! curl -o "$2" "$MODULE_PATH"; then
	echo "スクリプトのダウンロードに失敗しました。処理を中止します。"
	exit
fi
