
; ■ arX Launcher 10.0x	連携プログラムのサンプル (6)
;							 最終更新日 04/09/20
; ―――――――――――――――――――――――――――――――――――――

; ファイルリストを取得します。
; 少し難しいですが、できた時は正直自分で感動しました(TーT)。

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

	; メモリ領域の確保
	sdim list	,2048
	sdim filelist	,64
	;dim pid :dim hp
	;dim sel :dim sel_

	; 検索したフォルダ数の取得
	hdtp_req ⑤,4
	hdtp_req foldernum,⑤+3
	; フォルダ内ファイルリストの取得
	if foldernum {
	 ll_libload D_KERNEL,"kernel32"
	 ; arxlc のメイン画面ハンドルからプロセスハンドルを取得
	 getptr ppid,pid
	 prm=hwnd@hdtp,ppid	:dllproc "GetWindowThreadProcessId"	,prm,2,D_USER
	 prm=$10,0,pid		:dllproc "OpenProcess"			,prm,3,D_KERNEL
	 hp=dllret					; プロセスハンドル (arxlc)
	 ; ファイルリストのデータへのポインタを取得
	 ;			 　＆データ読み込み
	 hdtp_req ⑧,7
	 sdim filelist,16384,foldernum
	 repeat foldernum
	  getptr pfilelist.cnt,filelist.cnt		; 読み込み先 (プラグイン)
	  hdtp_req pfilelist_,⑧+cnt			; 　 〃 　元 (arxlc)
	  prm=hp,pfilelist_,pfilelist.cnt,16384,0	;
	  dllproc "ReadProcessMemory",prm,5,D_KERNEL	; 読む
	  i=cnt+1
	  list+="フォルダ ("+i+")\n"
	 loop
	 dllproc "CloseHandle",hp,1,D_KERNEL		; 後始末
	}

	; 画面の初期化
	font "ＭＳ ゴシック",14
	objmode 2,1
	objsize winx-10,25
	pos 5,5		:combox sel,120,list
	objsize winx-10,winy-40
	pos 5,35	:mesbox filelist,,,2
	gsel 0,1
	repeat
	 wait 5
	 if sel!sel_ :objprm 1,filelist.sel :sel_=sel
	loop


; ―――――――――――――――――――――――――――――――――――――
; (C) arc＠arcis 2004
; arX Launcher 特設サイト ＠ http://hp.vector.co.jp/authors/VA022483/arxlc/?
