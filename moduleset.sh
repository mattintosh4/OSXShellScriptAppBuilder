MODULE_PATH="https://raw.github.com/mattintosh4/OSXShellScriptAppBuilder/master/modules/$1.sh"
echo "=> モジュールをダウンロードしています。"
if ! curl --progress-bar -o "$2" "$MODULE_PATH"; then
	echo "モジュールのダウンロードに失敗しました。モジュール名が正しいか確認して下さい。処理を中止します。"
	exit
fi
