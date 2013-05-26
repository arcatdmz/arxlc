
; ■ arX Launcher 10.0x	連携プログラムのサンプル (5)
;							 最終更新日 04/09/19
; ―――――――――――――――――――――――――――――――――――――

; 常識外れなサイズにも対応した設定変更ツールです。

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

	; arxlc.exe のフルパス取得
	sdim path,512
	hdtp_req ⑦,6
	hdtp_req path,⑦

	; 現在の設定を取得
	hdtp_req ①,0
	dim setting,4
	dim setting_,4
	dup iconsize		,setting
	dup sysiconsize		,setting.1
	dup mg_girth		,setting.2
	dup mg			,setting.3
	hdtp_req iconsize	,①+4
	hdtp_req sysiconsize	,①+5
	hdtp_req mg_girth	,①+10
	hdtp_req mg		,①+11

	; 画面の準備
	redraw 2
	palcolor 0
	line 10,31,winx-11,31
	font "ＭＳ ゴシック",16,1
	pos 15,15	:mes "arX Launcher の詳細設定"
	font "ＭＳ ゴシック",12 :objmode 2,1
	pos 15,55	:mes "メニューアイコンの大きさ:"
	pos 15,80	:mes "アプリアイコンの大きさ:"
	pos 15,105	:mes "メイン画面の枠幅:"
	pos 15,130	:mes "アプリアイコンの間隔:"
	pos 15,winy-22	:mes "※値を大きくしすぎてどうなっても、知りません(笑)"
	objsize 25,19
	repeat 4
	 pos 200,25*cnt+51 :input setting.cnt
	 boxf 230,25*cnt+54,winx-11,25*cnt+66
	loop
	palcolor 255
	repeat 4
	 boxf 231,25*cnt+55,winx-12,25*cnt+65
	loop
	objsize 140,50
	pos winx-150,winy-60
	button "O K",*restart
	redraw 1

	gsel 0,1
	*main

	getkey i,1

	; 設定変更を検知
	repeat 4
	 if i&(mousey>(25*cnt+54))&(mousey<=(25*cnt+66))&(mousex>230)&(mousex<(winx-10)) {
	  setting.cnt=mousex-231
	 }
	 if setting.cnt!setting_.cnt {
	  setting_.cnt=setting.cnt
	  objprm cnt,setting.cnt
	  palcolor 255
	  boxf 231,25*cnt+55,winx-12,25*cnt+65
	  color 200,0,0
	  i=winx-11-231
	  i=setting.cnt>i*i+(setting.cnt<=i*setting.cnt)
	  boxf 231,25*cnt+55,230+i,25*cnt+65
	 }
	loop

	wait 5
	goto *main

	*restart
	hdtp_func 1			; ランチャーの終了
	if sysiconsize=0 :sysiconsize=1	; アプリアイコンの大きさ 0 は操作できなくなるから避ける
	exec "\""+path+"\" "+iconsize+"i"+sysiconsize+"a"+mg_girth+"b"+mg+"m"
	end


; ―――――――――――――――――――――――――――――――――――――
; (C) arc＠arcis 2004
; arX Launcher 特設サイト ＠ http://hp.vector.co.jp/authors/VA022483/arxlc/?
