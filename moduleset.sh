LOCALE_PREFIX='https://raw.github.com/mattintosh4/OSXShellScriptAppBuilder/master/modules'
MODULE_NAME="$1"
echo $MODULE_NAME
case "$MODULE_NAME" in
	wine-explorer				) MODULE_LOCALE="$LOCALE_PREFIX/wine-explorer.sh";;
	macports-active-list-backup	) MODULE_LOCALE="$LOCALE_PREFIX/macports-active-list-backup.sh";;
	dot-file-switcher			) MODULE_LOCALE="$LOCALE_PREFIX/dot-file-switcher.sh";;
	*							) echo "モジュールが見つかりませんでした"; exit;;
esac
export MODULE_LOCALE
