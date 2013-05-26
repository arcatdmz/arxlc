
; ■ ランチャー項目を追加
;							 最終更新日 04/09/23
; ―――――――――――――――――――――――――――――――――――――

; ドラッグ＆ドロップされたファイルやフォルダをランチャー項目として追加します。

; ◇ 連携機能の初期化

	; hdtp.as 用の定義
	; (arxlc との間でデータのやり取りをする際は下記の値で固定)
	#const	global	wm_xpi	$500
	#define	global	clsname	"oniwnd1"
	#define	global	appname	"arxlc"
	sdim setfile,1024 :setfile=cmdline

	; 命令拡張と変数の初期化
	; ※ hdtp.as を最小構成 llmod として利用
	#include "hdtp.as"
	; user32.dll
	#const FNC_CreatePopupMenu			0
	#const FNC_TrackPopupMenu			1
	#const FNC_InsertMenuItemA			2
	#const FNC_DestroyMenu				3
	#const FNC_FillRect				4
	; kernel32.dll
	#const FNC_GetShortPathNameA			5
	;
	#const global foldermax				32
	#module "arxlc_mod"
		; ポインタの分かっている関数を実行
		; ※ ll_getproc を先にメインで実行しておいてあるだけで、他は dllproc と同じ
		#deffunc dllprocp int,val,int
			mref func :mref prms,17 :mref prm_n,2
			ll_callfunc prms,prm_n,func
		return
		; 文字入力 dialog (フォルダ選択メニュー付き)
		;	前提	wid 5 のウィンドウが無いこと
		;	使用値	"p1"	/ 入力内容初期値
		;		"p2"	/ ダイアログのタイトル
		;	戻り値	refstr	/ 入力内容
		#deffunc dialoginput str,str
			mref s,32 :string=s		; 初期値
			mref s,33			; タイトル
			if dialoginput_ {
			 screen 5,320,120,6 :mref bmscr,67
			 prmex@=0,0,winx,winy
			 prm=bmscr.4,pprmex@,hbrush@
			 dllprocp pfunc@.FNC_FillRect@,prm,3
			 color col@,col@.1,col@.2 :line 4,85,winx-6,85
			 font "ＭＳＰ ゴシック",12
			 color 0,0,0		:pos 6,10	:mes "作成するショートカットのファイル名を入力してください。"
			 objmode 2,1
			 objsize winx-82,25	:pos 5,50	:input string
			 font "ＭＳＰ ゴシック",10
			 objsize 70,25		:pos winx-75,50	:button "... フォルダ",*dir
			 font "ＭＳＰ ゴシック",12
			 objsize 65,25		:pos winx-150,92:button "OK",*ok
			 objmode 2,17
			 objsize 75,25		:pos winx-80,92	:button "キャンセル",*cancel
			 dialoginput_=0
			} else :gsel 5
			title s
			objprm 0,string
			gsel 5,1
			stop
			*dir
			if dialogdir_ {
			 ; メニューの生成
			 foldernum=0
			 folderlist="\\\n"
			 curfoldernum=0
			 mii=44,$30+$12,0,0,0,0,0,0,0,pstring2,0,0
			 ; 親メニュー
			 gosub *nmenu
			 prm=hmenu :mii.4=100
			 string2="(ルートフォルダ内に作成)" :gosub *imenu
			 gosub *imenu_border
			 ; 子メニュー
			 foldernum++
			 repeat foldermax
			  ; フォルダ内サブフォルダ検索
			  notesel folderlist
			  notemax i
			  if curfoldernum>=i :break
			  noteget curfolder,curfoldernum
			  dirlist tmplist,rootdir@+curfolder+"*",5
			  notesel tmplist
			  notemax i
			  ; サブフォルダをメニュー項目に追加
			  repeat  i
			   ; サブフォルダ名取得
			   if foldernum>=foldermax :break
			   noteget string2,cnt
			   if curfoldernum=0 :if string2="hidden" :continue
			   folderlist+=curfolder+string2+"\\\n"
			   gosub *nmenu
			   ; 一つ上の階層にサブメニューとして追加
			   prm=hmenu.curfoldernum :mii.4=0,hmenu.foldernum :gosub *imenu_sub
			   ; 自身の階層にメニュー項目を追加
			   string2="( "+string2+" フォルダ内に作成)"
			   prm=hmenu.foldernum :mii.4=foldernum+100,0 :gosub *imenu
			   gosub *imenu_border
			   ; 
			   foldernum++
			  loop
			  curfoldernum++
			 loop
			 dialogdir_=0
			}
			ginfo
			prm=hmenu,$182,prmx,prmy,0,bmscr.13,0
			dllprocp pfunc@.FNC_TrackPopupMenu@,prm,7
			if dllret@!0 {
			 ; 選択されたフォルダの取得
			 notesel folderlist
			 noteget string2,dllret@-100
			 strlen i,string2
			 strmid string2,string2,1,i-1
			 ; 入力されているファイル名の取得
			 i=0
			 repeat
			  instr ii,string,"\\",i
			  if ii=-1 :break
			  i+=ii+1
			 loop
			 strlen ii,string
			 strmid string,string,i,ii-i
			 ; 新しいファイル名の表示
			 string=string2+string
			 objprm 0,string
			}
			stop
			*cancel	:ref=""		:goto *@f
			*ok	:ref=string	:goto *@f
			*@	:gsel 5,-1	:return
			*nmenu
			dllprocp pfunc@.FNC_CreatePopupMenu@,prm
			hmenu.foldernum=dllret@	 :return
			*imenu_border
			mii.2=$800 :mii.4=0,0 :mii.9=0,0 :gosub *imenu
			mii.2=0 :mii.9=pstring2 :return
			*imenu_sub
			mii.1=$30+$12+$4 :gosub *imenu
			mii.1=$30+$12 :return
			*imenu
			if mii.9 :strlen mii.10,string2
			prm.1=-1,1,pmii
			dllprocp pfunc@.FNC_InsertMenuItemA@,prm,4
			return
	#global
	mref stt@arxlc_mod,64
	mref ref@arxlc_mod,65
	; 汎用変数
	sdim s,1024
	sdim ss,512
	;sdim code,4
	;dim i :dim ii
	;dim prm,16
	;dim prmex
	; dialoginput 命令用
	sdim string@arxlc_mod,512
	sdim string2@arxlc_mod,512
	;dim mii@arxlc_mod,12
	;dim pstring@arxlc_mod
	;dim pstring2@arxlc_mod
	dialoginput_@arxlc_mod=1
	dialogdir_@arxlc_mod=1
	sdim curfolder@arxlc_mod,512
	sdim tmplist@arxlc_mod,16384
	sdim folderlist@arxlc_mod,16384
	dim hmenu@arxlc_mod,foldermax

	; hdtp の初期化
	instr i,setfile,",",0
	if i!-1 {
	 strlen ii,setfile
	 strmid s,setfile,i+1,ii-i-1
	 strmid setfile,setfile,0, i
	}
	hdtp_init
	if stat<0 {
	 dialog "arX Launcher が起動していません。\nプラグインを終了します。"
	 end
	}

	; ランチャー情報の取得
	hdtp_req ⑦,6
	sdim apppath,512
	sdim rootdir,512
	sdim rootdir_,512
	hdtp_req apppath,⑦
	hdtp_req rootdir,⑦+3

; ◇ loadlib 関連の初期化

	; DLL 読み込み
	;ll_libload D_USER,"user32"
	ll_libload D_KERNEL,"kernel32"

	; ポインタ取得(変数)
	getptr pstring@arxlc_mod,string@arxlc_mod
	getptr pstring2@arxlc_mod,string2@arxlc_mod
	getptr pmii@arxlc_mod,mii@arxlc_mod
	getptr pprmex,prmex

	; ポインタ取得(関数)
	;dim pfunc
	;   user32.dll
	;ll_getproc pfunc.FNC_GetSysColor		,"GetSysColor"			,D_USER
	;ll_getproc pfunc.FNC_GetSysColorBrush		,"GetSysColorBrush"		,D_USER
	ll_getproc pfunc.FNC_CreatePopupMenu		,"CreatePopupMenu"		,D_USER
	ll_getproc pfunc.FNC_TrackPopupMenu		,"TrackPopupMenu"		,D_USER
	ll_getproc pfunc.FNC_InsertMenuItemA		,"InsertMenuItemA"		,D_USER
	ll_getproc pfunc.FNC_DestroyMenu		,"DestroyMenu"			,D_USER
	ll_getproc pfunc.FNC_FillRect			,"FillRect"			,D_USER

	; その他
	;  システム色
	prm=15 :dllproc "GetSysColorBrush",prm,1,D_USER	:hbrush=dllret
	prm=16 :dllproc "GetSysColor"     ,prm,1,D_USER	:col=dllret&255,dllret>>8&255,dllret>>16&255

; ◇ コマンドラインの解析
;	出力値	filelist	/ ドラッグ＆ドロップされたファイルのリスト

	; "ファイルパス.1" "ファイルパス.2" ...

	sdim filelist,1024

	; ダイアログを表示
	if s="" {

	dialog "*",16,"ショートカットを作成するファイル"
	if stat=0 :end
	filelist=refstr

	; 解析(ファイルのリスト分割)
	} else {

	instr i,s,"\"",0
	strlen ii,s

	;  ショートパス名の連続(半角スペース区切り)
	if i=-1 {
	 i=0
	 repeat ii
	  if i>=ii :break
	  instr prm,s," ",i
	  if prm=-1 :prm=ii-i
	  strmid ss,s,i,prm
	  filelist+=ss+"\n"
	  i+=prm+1
	 loop
	;  ロングパス名の連続(ダブルクォート囲み+半角スペース区切り)
	} else {
	 i=1
	 s+=" \""
	 repeat ii
	  if i>=ii :break
	  instr prm,s,"\" \"",i
	  if prm=-1 :prm=ii-i
	  strmid ss,s,i,prm
	  filelist+=ss+"\n"
	  i+=prm+3
	 loop
	}

	}

; ◇ ショートカットの作成

	notesel filelist
	notemax max
	cur=1
	if rootdir!exedir :rootdir_=rootdir+"\\"

	*mklnk
	; リンク先ファイルの名前を取得
	noteget s,cur-1	:ss=s
	code="\\"	:gosub *instr_
	strlen ii,s
	strmid ss,s,i,ii-i
	code="."	:gosub *instr_
	if i!0 :strmid ss,ss,0,i-1
	; リンクのファイル名を決定
	dialoginput ss,"ショートカットの作成("+cur+"/"+max+")"
	; リンクを作成
	if refstr!"" {
	 exec "\""+apppath+"\" run:hidden\\mklnk.ax,\""+s+"\",,\""+rootdir_+refstr+"\""
	}
	if cur<max :cur++ :goto *mklnk

; ◇ 後処理

	; メニューハンドルの解放
	repeat foldermax
	 if hmenu@arxlc_mod.cnt :dllprocp pfunc.FNC_DestroyMenu,hmenu@arxlc_mod.cnt,1
	loop

	; 再起動の確認
	dialog "作成したショートカットをランチャー項目として認識させるため、\narxlc を再起動します。よろしいですか？\n\n※他に起動しているプラグインがある場合は終了して下さい。",2
	if stat=6 :wait 20 :hdtp_func 2 ; ランチャーの再起動

	end


; ss 内で code が最後に出てくる箇所を取得

*instr_
	i=0
	repeat
	 instr ii,ss,code,i
	 if ii=-1 :break
	 i+=ii+1
	loop
	return


; ―――――――――――――――――――――――――――――――――――――
; (C) arc＠arcis 2004
; arX Launcher 特設サイト ＠ http://hp.vector.co.jp/authors/VA022483/arxlc/?
