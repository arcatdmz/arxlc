
; ■ arX Launcher 10.0x	連携プログラムのサンプル (5) 改良版
;
title			"arxlc の詳細設定"
;
;							 最終更新日 04/09/25
; ―――――――――――――――――――――――――――――――――――――

; 常識外れなサイズにも対応した設定変更ツールです。

; 元祖(sample_05.as)の操作性を向上し、
; 設定の保存方法を確実にしました。

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

	; arxlc の情報を取得
	sdim apppath,512
	sdim setfile,512
	sdim cmdline_,1024
	hdtp_req ⑦,6
	hdtp_req apppath,⑦	; arxlc.exe フルパス
	hdtp_req setfile,⑦+4	; 設定ファイル名
	hdtp_req cmdline_,⑦+2	; 起動オプション
	setfile=exedir+"\\hidden\\"+setfile

	; 現在の設定を取得
	hdtp_req ①,0
	dim setting,5
	dim setting_,5
	dup iconsize		,setting
	dup sysiconsize		,setting.1
	dup mg_girth		,setting.2
	dup mg			,setting.3
	dup synciconsize	,setting.4
	hdtp_req iconsize	,①+4
	hdtp_req sysiconsize	,①+5
	hdtp_req synciconsize	,①+6
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
	pos 325,155	:mes "アプリアイコンの大きさをメニューアイコンに合わせる"
	pos 15,winy-50
	mes "※バーをドラッグして値を設定できます。"		:pos 15,csry+2
	mes "※値を大きくしすぎてどうなっても、知りません(笑)"	:pos 15,csry+2
	mes "※メニューアイコンの大きさを 0 にするとアイコンを表示しない設定にできます。"
	objsize 25,19
	repeat 4
	 pos 200,25*cnt+51 :input setting.cnt
	 boxf 230,25*cnt+54,winx-16,25*cnt+66
	loop
	palcolor 255
	repeat 4
	 boxf 231,25*cnt+55,winx-17,25*cnt+65
	loop
	objsize 140,50
	pos winx-155,winy-60
	button "O K",*restart
	objsize 13,13
	pos 308,155	:chkbox "",synciconsize
	redraw 1
	mref bmscr,67

	gsel 0,1
	*main

	; チェックボックスからの設定変更を検知
	if setting_.4!synciconsize {
	 ; アプリアイコンサイズ入力ボックス使用可否設定
	 setting_.4=synciconsize
	 prm=bmscr.42,synciconsize=0
	 dllproc "EnableWindow",prm,2,D_USER
	 redraw 2
	 if synciconsize {
	  color 255,250,230 :boxf 231,80,winx-17,90
	  color 250,240,190
	  i=winx-16-231
	  i=setting.1>i*i+(setting.1<=i*setting.1)
	  boxf 231,80,230+i,90
	 } else :ii=1 :gosub *draw
	 redraw 1
	}

	; バーのドラッグを検知
	getkey i,1
	repeat 4
	if i&(mousey>(25*cnt+54))&(mousey<=(25*cnt+66))&(mousex>230)&(mousex<(winx-10)) {
	 ; アプリアイコンの大きさをメニューアイコンに合わせる設定？
	 if cnt=1&synciconsize :continue
	 ; ドラッグ開始
	 ii=cnt
	 repeat
	  wait 5
	  getkey i,1
	  if i {
	   setting.ii=mousex-231
	   if setting.ii<0 :setting.ii=0
	   ; 表示を更新
	   objprm ii,setting.ii
	   redraw 2
	   gosub *draw
	   redraw 1
	  } else :break
	 loop
	 objprm cnt,setting.cnt
	}
	loop	

	; 入力ボックスからの設定変更を検知
	repeat 4
	 if setting.cnt!setting_.cnt {
	  ; 表示を更新
	  if setting.cnt<0 :setting.cnt=0 :objprm cnt,setting.cnt
	  ii=cnt
	  redraw 2
	  gosub *draw
	  redraw 1
	 }
	loop

	wait 5
	goto *main

	; OK
	*restart
	; arxlc の終了
	hdtp_func 1
	repeat
	 ; 終了確認
	 wait 5
	 hdtp_init
	 if stat=-1 :break
	loop
	; 設定の読み込みと書き換え
	dim data,16
	bload setfile,data,64,0
	data.4=iconsize
	data.5=sysiconsize
	data.6=synciconsize
	data.10=mg_girth
	data.11=mg
	bsave setfile,data,64,0
	; arxlc の起動
	if cmdline_="" :exec apppath :else {
	 exec "\""+apppath+"\" "+cmdline_
	}
	end

	; バーを描画
	;  使用値 ii	/ バーの番号(上から 0, 1, 2, 3)
	*draw
	setting_.ii=setting.ii
	palcolor 255
	boxf 231,25*ii+55,winx-17,25*ii+65
	color 200,0,0
	i=winx-16-231
	i=setting.ii>i*i+(setting.ii<=i*setting.ii)
	boxf 231,25*ii+55,230+i,25*ii+65
	return


; ―――――――――――――――――――――――――――――――――――――
; (C) arc＠arcis 2004
; arX Launcher 特設サイト ＠ http://hp.vector.co.jp/authors/VA022483/arxlc/?
