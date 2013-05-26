
; ■ arxlc インストーラ
;							 最終更新日 04/09/19
; ―――――――――――――――――――――――――――――――――――――

; arxlc の初期設定を行う他、
; 特殊コマンドラインが指定された arxlc.exe へのショートカットを作成します。

	if cmdline="initialize" :initmode=1

; ◇ 初期化

	; hdtp.as 用の定義
	; (arxlc との間でデータのやり取りをする際は下記の値で固定)
	#const	global	wm_xpi	$500
	#define	global	clsname	"oniwnd1"
	#define	global	appname	"arxlc"
	setfile=cmdline

	; 命令拡張と変数の初期化
	#include "hdtp.as"
	ll_libload D_SHELL,"shell32"
	ll_libload D_KERNEL,"kernel32"
	ll_getproc FNC_ShellExecuteExA,"ShellExecuteExA",D_SHELL
	ll_getproc FNC_GetFileAttributesA,"GetFileAttributesA",D_KERNEL
	sdim apppath,512	:getptr papppath,apppath
	sdim s,1024		:getptr ps,s
	sdim ss,512		:getptr pss,ss
	dim prm,16		:getptr pprm,prm
	;dim i :dim ii
	prm=0,papppath,512
	dllproc "GetModuleFileNameA",prm,3,D_KERNEL

	;  システム色の取得
	dim col,2,3 :prm=15
	repeat 2
	 dllproc "GetSysColor",prm,1,D_USER
	 col.cnt.0=dllret    &255
	 col.cnt.1=dllret>>8 &255
	 col.cnt.2=dllret>>16&255
	 prm++
	loop

	; 画面の初期化
	title "arxlc インストーラ"
	width 380,320
	redraw 2
	color col.0,col.0.1,col.0.2	:boxf
	color col.1,col.1.1,col.1.2	:boxf 0,0,winx,50
	i=0 :gosub *drwlogo :palcolor 255
	i=1 :gosub *drwlogo :palcolor 0

	; 初期設定(initialize)
	if initmode {
	;  画面の整備
	use_plugin=1
	font "ＭＳ ゴシック",28,17
	pos 5,6				:mes "初期設定"
	font "ＭＳ ゴシック",10,16
	pos 7,35			:mes "初回起動ですので、今後 arxlc をどのように使うか指定して下さい。"
	font "ＭＳ ゴシック",12		:objmode 2,1
	objsize winx-20,25
	pos 10,60			:chkbox "プラグイン(拡張機能)を利用する",use_plugin
	s ="プラグインを利用すると、本体に実装されていない拡張機能を実現できます。\n"
	s+="チェックを外すとプラグイン関連のファイルが幾つか削除され、以降はプラグインの機能を利用したくなってもランチャーを再ダウンロードする他無くなるため、通常はチェックを付けたままにした方が良いです。"
	pos 20,85			:mesbox s,winx-30,57,0
	pos 10,155			:objsize winx-20,18
	chkbox "デスクトップに arxlc のアイコンを作成する",mklnk_desktop
	chkbox "Windows 起動時に arxlc も起動する",mklnk_startup
	s= "それぞれ、「デスクトップ」と「スタートメニュー→プログラム→スタートアップ」に arxlc.exe へのショートカットを作成します。"
	pos 20,195			:mesbox s,winx-30,45,0
	pos winx-100,winy-53		:objsize 90,45
	button "OK",*ok_init

	; 違う環境へのインストール
	} else {
	;  hdtp の初期化
	hdtp_init
	if stat<0 {
	 dialog "arX Launcher が起動していません。\nプラグインを終了します。"
	 end
	}
	;  ランチャー情報の取得
	sdim rootdir,512
	sdim setfile,64
	hdtp_req ⑦,6
	hdtp_req apppath,⑦
	hdtp_req rootdir,⑦+3
	hdtp_req setfile,⑦+4
	;  画面の整備
	font "ＭＳ ゴシック",28,17
	pos 5,6				:mes "新しい環境にインストール"
	font "ＭＳ ゴシック",10,16
	pos 7,35			:mes "arxlc を、現在と違うフォルダをルートとして起動できます。"
	font "ＭＳ ゴシック",12		:objmode 2,1
	objsize winx-140,18
	pos 10,66			:mes "ルートフォルダ:"
	pos 108,63			:input rootdir
	objsize 20,18
	pos winx-30,63			:button "←",*sel_rootdir
	s ="arxlc は通常 arxlc.exe の入っているフォルダをルートとして起動しますが、特殊なコマンドライン(プログラムをどう実行するかというオプション)を含む arxlc.exe へのショートカットを作成し、そこから arxlc を起動すると、通常と異なるフォルダをルートとしてランチャー項目を検索させることができます。\n"
	s+="このプラグインは、そのような特殊コマンドラインを含むショートカットを簡単に作成できます。"
	pos 20,85			:mesbox s,winx-30,81,0
	objsize winx-118,18
	pos 10,180			:mes "設定ファイル名:"
	pos 108,177			:input setfile
	s ="作成したショートカットから起動した arxlc と通常どおり起動した arxlc が競合しないように、設定ファイル名は必ずルートごとに変えて下さい。"
	pos 20,199			:mesbox s,winx-30,57,0
	pos winx-100,winy-53		:objsize 90,45
	button "OK",*ok_mklnk
	}

	redraw 1
	gsel 0,1
	onexit *exit
	stop

; ◇ ルートフォルダの選択

*sel_rootdir
	; 選択ダイアログ表示
	if pMalloc=0 :gosub *initcom
	ss="ルートフォルダを選択して下さい。"
	prm=bmscr.13@hdtp,0,ps,pss,3,0,0,0
	ll_callfunc pprm,1,FNC_SHBrowseForFolderA
	if dllret {
	 ; 結果の取得と使用されたメモリ領域の解放
	 prm=dllret,ps :ll_callfunc prm,2,FNC_SHGetPathFromIDListA
	 prm=pidl :prmex=pprm,1,5,pMalloc :ll_callfunc prmex,4,pCallMethod
	 ; 結果の表示
	 rootdir=s
	 objprm 0,rootdir
	}
	stop

; ◇ OK (初期設定)

*ok_init
	gsel 0,-1
	skiperr 1
	chdir exedir+"\\hidden\\"
	; プラグイン関連のファイルを削除
	if use_plugin=0 {
	 delete "plus.ax"
	 delete "mklnk.ax"
	 delete "arxlc インストーラ.xpi"
	 delete "arxlc のバージョン情報.xpi"
	 delete "arxlc の詳細設定.xpi"
	 delete "ランチャー項目の追加.xpi"
	 delete "readme ... arxlc インストーラ.xpi"
	 delete "readme ... arxlc のバージョン情報.xpi"
	 delete "readme ... arxlc の詳細設定.xpi"
	 delete "readme ... ランチャー項目の追加.xpi"
	; プラグイン利用のショートカット項目を作成
	} else {
	 chdir exedir :mkdir "プラグインの機能"
	 s="\"run:hidden\\ランチャー項目の追加.xpi,@arxlc.dat,\",\"プラグインの機能\\ランチャー項目の追加\"":gosub *mklnk
	 s="\"run:hidden\\arxlc の詳細設定.xpi,@arxlc.dat\",\"プラグインの機能\\arxlc の詳細設定\"":gosub *mklnk
	 s="\"run:hidden\\arxlc インストーラ.xpi,@arxlc.dat\",\"プラグインの機能\\arxlc を新しい環境にインストール\"":gosub *mklnk
	 s=exedir+"\\プラグインの機能\\arxlc を新しい環境にインストール.lnk" :gosub *chklnk
	 chdir exedir+"\\hidden\\"
	}
	; arxlc へのショートカットを作成
	if mklnk_desktop|mklnk_startup :gosub *initcom
	if mklnk_desktop {
	 i=$10 :gosub *getfolder :ss=s
	 s=",\""+s+"\\arX Launcher\""	:gosub *mklnk
	 s=ss+"\\arX Launcher.lnk" :gosub *chklnk
	}
	if mklnk_startup {
	 i=$7 :gosub *getfolder :ss=s
	 s=",\""+s+"\\arX Launcher\""	:gosub *mklnk
	 s=ss+"\\arX Launcher.lnk" :gosub *chklnk
	}
	delete "startup.dat"
	skiperr 0
	wait 10
	exec exedir+"\\arxlc.exe"
	goto *exit

; ◇ OK (特殊ショートカットの作成)

*ok_mklnk
	exist exedir+"\\hidden\\"+setfile
	if strsize!-1 {
	 dialog "既に同名の設定ファイルが存在します。\n必ず新しい設定ファイル名を入力して下さい。",0,"arxlc インストーラ"
	 stop
	}
	; ルートディレクトリ末尾に \ は付けない
	strlen ii,rootdir
	i=0
	repeat ii
	 if i>=ii :break
	 instr prm,s,"\\",i
	 if prm=-1 :break
	 i+=prm+1
	loop
	if i=ii :strmid rootdir,rootdir,0,i-1
	; ショートカットの作成
	s="\"|"+rootdir+"|R|"+setfile+"|S\",\""+rootdir+"\\arX Launcher\"" :gosub *mklnk
	dialog "arxlc へのショートカットを以下のフォルダ内に作成しました。\n\n"+rootdir+"\n\n作成されたショートカットを開くと上記のフォルダがルートとなってメニュー項目が検索されます。\n\nなお、このままでは作成されたショートカットまでメニュー項目に追加されてしまいますので、\n使用前に便利の良いフォルダ内に移動しておいて下さい。",0,"arxlc インストーラ"
	exec rootdir,16
	goto *exit

; ◇ プログラムの終了

*exit
	if pMalloc :prm=0,0,2,pMalloc :ll_callfunc prm,4,pCallMethod
	end

; ◇ サブルーチン

; ロゴ描画
; i	/ 描画開始位置

*drwlogo
	font "Arial Black",21,16 :pos 8+i,winy-60+i :mes "arxlc."
	font "Arial Black",36,16 :pos 6+i,winy-50+i :mes "Installer"
	return

; arxlc.exe へのショートカットを作成
; s	/ 作成オプション

*mklnk
	s="run:hidden\\mklnk.ax,\""+apppath+"\","+s
	prm=60,0,bmscr.13@hdtp,0,papppath,ps,0,1,0,0,0,0,0,0,0
	ll_callfunc pprm,1,FNC_ShellExecuteExA
	return

; ショートカットの作成が完了したか確認
; s	/ ショートカットのファイル名

*chklnk
	repeat 25
	 wait 20
	 ll_callfunc ps,1,FNC_GetFileAttributesA
	 if dllret!-1 :break
	loop
	return

; 特殊フォルダパスの取得
; i	/ CSIDL

*getfolder
	; フォルダパスの取得
	prm=0,i,ppidl	:ll_callfunc prm,3,FNC_SHGetSpecialFolderLocation
	prm=pidl,ps	:ll_callfunc prm,2,FNC_SHGetPathFromIDListA
	; 使用されたメモリ領域の解放
	prmex=ppidl,1,5,pMalloc
	ll_callfunc prmex,4,pCallMethod
	return

; COM の初期化(解放は *exit で)

*initcom
	; CallMethod 関数
	dim CallMethod,11 ; 関数データ長 (11*4>)$2A(>(10*4))
	getptr pCallMethod,CallMethod
	prm=pCallMethod,44,$40,0 :dllproc "VirtualProtect",prm,4,D_KERNEL
	CallMethod = $8bec8b55, $d2851455, $458b1974, $0c4d8b08, $34ff03eb, $fa7d4988, $8b028b52, $14ff104d, $b805eb88, $80004003, $0000c3c9
	; その他関数
	ll_getproc FNC_SHGetSpecialFolderLocation,"SHGetSpecialFolderLocation",D_SHELL
	ll_getproc FNC_SHGetPathFromIDListA,"SHGetPathFromIDListA",D_SHELL
	ll_getproc FNC_SHBrowseForFolderA,"SHBrowseForFolderA",D_SHELL
	; COM インターフェース取得
	getptr prm,pMalloc
	getptr ppidl,pidl
	dllproc "SHGetMalloc",prm,1,D_SHELL
	return


; ―――――――――――――――――――――――――――――――――――――
; (C) arc＠arcis 2004
; arX Launcher 特設サイト ＠ http://hp.vector.co.jp/authors/VA022483/arxlc/?
