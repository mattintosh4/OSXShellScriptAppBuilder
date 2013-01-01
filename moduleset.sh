MODULE_PREFIX="https://raw.github.com/mattintosh4/OSXShellScriptAppBuilder/master/modules"
case "$1" in
	wine-explorer)
		MODULE="$MODULE_PREFIX/wine-explorer.sh";;
	macports-active-list-backup)
		MODULE="$MODULE_PREFIX/macports-active-list-backup.sh";;
	dot-file-switcher)
		MODULE="$MODULE_PREFIX/dot-file-switcher.sh";;
	*) echo "モジュールが見つかりませんでした"; exit;;
esac
