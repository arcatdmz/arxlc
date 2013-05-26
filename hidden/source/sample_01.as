
; ■ arX Launcher 10.0x	連携プログラムのサンプル (1)
;							 最終更新日 04/09/19
; ―――――――――――――――――――――――――――――――――――――

; アプリ登録されているショートカットのフルパスを全て取得、表示します。

	; hdtp.as 用の定義
	; (arxlc との間でデータのやり取りをする際は下記の値で固定)
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
	gsel 0,1

	; 実情報取得前の準備
	; (オフセットの取得)
	title "情報取得の準備中"
	hdtp_req ①,0
	hdtp_req ④,3
	hdtp_req ⑥,5

	; 実情報の取得
	; (アプリ登録されたショートカットファイルのフルパスを取得してみる)
	sdim path,512
	pos 5,5
	hdtp_req appnum,①+15	; アプリアイコンの個数を取得
	repeat appnum
	 i=cnt+1 :str i,2	;
	 title "フルパス情報取得中; no."+i
	 hdtp_req id,④+cnt	; 各アプリアイコンに対応するメニューのIDを取得
	 hdtp_req path,⑥+id	; メニューのIDに対応するショートカットのフルパス
	 mes i+". "+path :int i	; アプリの番号とフルパスの表示
	loop
	title "情報取得完了"
	stop


; ―――――――――――――――――――――――――――――――――――――
; (C) arc＠arcis 2004
; arX Launcher 特設サイト ＠ http://hp.vector.co.jp/authors/VA022483/arxlc/?
