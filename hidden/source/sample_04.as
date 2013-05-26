
; ■ arX Launcher 10.0x	連携プログラムのサンプル (4)
;							 最終更新日 04/09/19
; ―――――――――――――――――――――――――――――――――――――

; ランチャーの様々なメニューを表示、結果を取得します。

; メニューの選択をキャンセルしにくい(画面の他の部分をクリックしてもメニューが
; 中々消えてくれない)ことがあるようですが、我慢するしかありません(駄目じゃん)。


	; hdtp.as 用の定義
	#const	global	wm_xpi	$500
	#define	global	clsname	"oniwnd1"
	#define	global	appname	"arxlc"
	setfile=cmdline

	; 命令拡張
	#include "hdtp.as"

	; hdtp の初期化
	hdtp_init
	if stat<0 {
	 dialog "arX Launcher が起動していません。\nプラグインを終了します。"
	 end
	}

	; arxlc が起動時に検索したフォルダの個数(=カテゴリー数)
	hdtp_req ⑤,4
	hdtp_req catnum,⑤+3

	; メニュー表示の準備
	hdtp_req ②,1
	hdtp_req ③,2

	; 表示できるメニューの一覧
	sdim menu,1024
	menu+={"
	拡張メニュー表示用メニュー
	拡張メニュー
	見た目の設定
	機能の設定
	メインメニュー
	"}
	repeat catnum-1,1
	 menu+="カテゴリーメニュー ("+cnt+")\n"
	loop
	font "ＭＳ ゴシック",13	:objmode 2
	objsize winx-160,winy-10:pos 5,5
	listbox menusel,0,menu

	; メニューの表示ボタン
	objsize 145,200		:pos winx-150,5
	button "メニューの表示",*shwmenu
	stop

	; メニューの表示
	*shwmenu
	if menusel=-1 :dialog "表示するメニューを選択して下さい。" :stop
	;  メイン画面を使用不可に(※)
	prm=bmscr@hdtp.13,0 :dllproc "EnableWindow",prm,2,D_USER
	;  メニューを表示
	if menusel<4 :hdtp_menu ②+menusel :else {
	 hdtp_menu ③+menusel-4
	}
	;  結果の表示
	redraw 2
	palcolor 255	:boxf winx-150,210,winx,223
	palcolor 0	:pos winx-150,210
	mes "選択された項目: "+stat
	redraw 1
	;  メイン画面を使用可に(※)
	prm=bmscr@hdtp.13,1 :dllproc "EnableWindow",prm,2,D_USER
	stop

	; ----------------------------------------------------------------
	; (※)

	; dllproc は通常 llmod.as を #include しないと使えない命令ですが、
	; #include されていない際には hdtp.as 内で エセ dllproc 命令が定義
	; されるため、それを利用しています。D_USER しか使えない上、stat に
	; dllret の値が代入されないという差異があります。

	; bmscr@hdtp は、hdtp_init 時にモジュール内で読み込まれた BMSCR 構
	; 造体を流用しています。

	; いずれもかなりトリッキーなやり方なのであまり推奨できません(^^;
	; ----------------------------------------------------------------


; ―――――――――――――――――――――――――――――――――――――
; (C) arc＠arcis 2004
; arX Launcher 特設サイト ＠ http://hp.vector.co.jp/authors/VA022483/arxlc/?
