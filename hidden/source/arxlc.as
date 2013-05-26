
; ■ arX Launcher					    お手軽ランチャー
; ―――――――――――――――――――――――――――――――――――――

	gsel 0,-1

; ―――――――――――――――――――――――――――――――――――――
; 命令拡張
; ―――――――――――――――――――――――――――――――――――――

; ミニ llmod + メニュー作成モジュール

	ll_libload D_GDI,"gdi32"
	ll_libload D_USER,"user32"
	ll_libload D_SHELL,"shell32"
	ll_libload D_KERNEL,"kernel32"
	ll_retset dllret
	#module "arxlc_mod"

		#deffunc dllproc str,val,int,int
		mref funcname,32 :mref prms,17 :mref prm_n,2 :mref dll_no,3
		ll_getproc func,funcname,dll_no
		ll_callfunc prms,prm_n,func
		return

		#deffunc imenu str,int,int,int,int
		mref s,32 :mref id,1 :mref hbitmap,2 :mref hsubmenu,3 :mref hmenu,4
		sdim string,512 :string=s
		; MENUITEMINFO構造体を作成
		dim mii,oschk@+11
		mii=oschk@*4+44,oschk@*$30+(hsubmenu!0*$4)+$12,0,0,id,hsubmenu
		if hbitmap!0 :mii.1+=$80 :mii.11=hbitmap :string="  "+string
		if string="" :mii.2=$800 :else :mii.2=0 :ll_getptr string :mii.9=dllret@ :strlen mii.10,string
		; メニュー追加
		prm=hmenu,-1,1 :ll_getptr mii :prm.3=dllret@
		dllproc "InsertMenuItemA",prm,4,D_USER@
		return

	#global


; ―――――――――――――――――――――――――――――――――――――
; 準備
; ―――――――――――――――――――――――――――――――――――――

; 定義

	noclickpop=1			; クリック無しでメニュー表示
	iconsize=32			; アイコン表示サイズ初期値
	bandmode='r'			; メニュー表示域初期値
	#const bandsize		1	; メニュー表示域幅
	#const foldermax	64	; フォルダ追加数の限界
	#const filemax		192	; ファイル追加数の限界(フォルダ当り)

; バッファの確保

	sdim folderlist,32768		; フォルダリスト
	sdim filelist,16384,foldermax	; ファイルリスト(フォルダ別)
	sdim curfolder,512		; 現在の処理対象フォルダ(初期化時使用)
	sdim s,512			; 汎用
	sdim ss,16384			; 〃

	; dim curfoldernum		; 現在の処理対象フォルダ番号
	dim hmenu,foldermax		; メニューハンドル(フォルダ別)
	dim hbmp,foldermax,filemax	; ビットマップハンドル(ファイル別)
	; dim i				; 汎用
	dim prm,37			; 〃

; 情報の取得

	; 動作オプション(コマンドライン)
	s=cmdline
	strlen i,s
	repeat i
	 peek i,s,cnt
	 if i='i' :strmid iconsize,s,prm,cnt-prm :int iconsize
	 if i='c' :noclickpop=0
	 if i='u'|(i='d')|(i='l') :bandmode=i
	 if i<'0'|(i>'9') :prm=cnt+1
	loop

	; loadlib.dll 関連
	ll_getptr ss	:pss=dllret
	ll_getptr i	:pi=dllret
	prm=148 :ll_getptr prm
	dllproc "GetVersionExA",dllret,1,D_KERNEL
	if prm.4=1&(prm.1>=10)|(prm.4=2&(prm.1>=5)) :oschk=1

; その他準備

	; メニュー構築用の初期化処理
	folderlist=exedir+"\n"
	onexit *exit
	buffer 3,,,0
	mref bmscr,67

	; フォルダアイコンの作成
	prm=15 :dllproc "GetSysColor",prm,1,D_USER
	color dllret&255,dllret>>8&255,dllret>>16&255
	boxf
	palcolor 0
	boxf 1,2,7,2
	boxf 1,3,14,13
	palcolor 255
	boxf 2,3,6,3
	boxf 2,5,13,12
	gosub *bitblt :hbmpfolder=i


; ―――――――――――――――――――――――――――――――――――――
; メニューの構築
; ―――――――――――――――――――――――――――――――――――――

; ファイル検索

	repeat foldermax
	 curfoldernum=cnt

	 ; 検索するフォルダの取得
	 notesel folderlist
	 notemax prm
	 if curfoldernum>=prm :break
	 if curfoldernum=0 :gosub *newmenu :hmenu.curfoldernum=dllret
	 noteget curfolder,curfoldernum
	 curfolder+="\\"

	 ; カレントフォルダに設定
	 skiperr 1 :chdir curfolder :i=err :skiperr 0
	 if i :continue

	 ; フォルダ内サブフォルダ検索
	 dirlist ss,"*",5
	 notesel ss
	 notemax i
	 repeat foldermax-prm-i*(prm+i>foldermax)+i
	  noteget s,cnt
	  folderlist+=curfolder+s+"\n"
	  gosub *newmenu
	  hmenu.prm=dllret
	  imenu s,0,hbmpfolder,hmenu.prm,hmenu.curfoldernum
	  prm++
	 loop

	 ; フォルダ内ファイル検索
	 dirlist filelist.curfoldernum,"*.lnk",1
	 ss="" :dirlist ss,"*.url",1
	 filelist.curfoldernum+=ss
	 notesel filelist.curfoldernum
	 notemax prm
	 repeat filemax-prm*(prm>filemax)+prm
	  noteget s,cnt
	  ss=curfolder+s
	  noteadd ss,cnt,1
	  ; ファイルアイコン付加機能は Windows 98,2000 以降のみ
	  if oschk {
	   ; アイコン取得
	   prm=bmscr.14,pss,pi
	   dllproc "ExtractAssociatedIconA",prm,3,D_SHELL
	   hbmp.curfoldernum.cnt=dllret
	   ; 画面へ描画＆アイコンハンドル開放
	   gcopy 3,iconsize,iconsize,iconsize,iconsize
	   prm=bmscr.4,0,0,hbmp.curfoldernum.cnt,iconsize,iconsize,0,0,3
	   dllproc "DrawIconEx",prm,9,D_USER
	   dllproc "DestroyIcon",hbmp.curfoldernum.cnt,1,D_USER
	   ; 描画内容をビットマップオブジェクトに変換
	   gosub *bitblt :hbmp.curfoldernum.cnt=i
	  }
	  strlen i,s :strmid s,s,0,i-4
	  imenu s,curfoldernum+1*filemax+cnt,hbmp.curfoldernum.cnt,0,hmenu.curfoldernum
	 loop
	loop

; システムメニューの付加

	imenu "",0,0,0,hmenu
	imenu "フォルダを開く",10,0,0,hmenu
	imenu "arxlc の再起動",2,0,0,hmenu
	imenu "arxlc の終了",1,0,0,hmenu


; ―――――――――――――――――――――――――――――――――――――
; 操作待ち
; ―――――――――――――――――――――――――――――――――――――

; いわゆるメインループ

	repeat
	wait 5
	ginfo :stick i
	; メニューの表示
	if bandmode='u'&(prmy=0)|(bandmode='r'&(dispx-1=prmx))|(bandmode='l'&(prmx=0))|(bandmode='d'&(dispy-1=prmy))&(i&256!0|noclickpop) {
	 dllproc "SetForegroundWindow",bmscr.13,1,D_USER
	 prm=hmenu,$100,prmx,prmy,0,bmscr.13,0
	 dllproc "TrackPopupMenu",prm,7,D_USER
	 if dllret {
	  if dllret=1 :break
	  if dllret=2 {
	   prm=0,pss,509
	   dllproc "GetModuleFileNameA",prm,3,D_KERNEL
	   exec "\""+ss+"\" "+cmdline
	   break
	  }
	  if dllret=10	:exec exedir,16 :continue
	  i=dllret/filemax-1
	  notesel filelist.i
	  noteget s,dllret\filemax
	  skiperr 1 :exec s,16 :skiperr 0
	 }
	}
	loop


; ―――――――――――――――――――――――――――――――――――――
; 終了時処理
; ―――――――――――――――――――――――――――――――――――――

; 各種ハンドルの解放

*exit
	s="DeleteObject"
	repeat curfoldernum
	 if hmenu.cnt {
	  prm=cnt
	  dllproc "DestroyMenu",hmenu.prm,1,D_USER
	  repeat filemax
	   if hbmp.prm.cnt!0 :dllproc s,hbmp.prm.cnt,1,D_GDI
	  loop
	 }
	loop
	if hbmpfolder!0 :dllproc s,hbmpfolder,1,D_GDI
	end


; ―――――――――――――――――――――――――――――――――――――
; サブルーチン
; ―――――――――――――――――――――――――――――――――――――

; 新しくポップアップメニューを作成する

*newmenu
	dllproc "CreatePopupMenu",prm,0,D_USER
	return

; 画面上の (iconsize)px 四方をビットマップオブジェクトにする

*bitblt
	ss="CreateCompatible"
	prm=bmscr.4,iconsize,iconsize
	dllproc ss+"Bitmap",prm,3,D_GDI :i.1=dllret
	dllproc ss+"DC",bmscr.4,1,D_GDI :i=dllret
	dllproc "SelectObject",i,2,D_GDI
	prm=i,0,0,iconsize,iconsize,bmscr.4,0,0,$CC0020
	dllproc "BitBlt",prm,9,D_GDI
	dllproc "DeleteDC",i,1,D_GDI
	i=i.1
	return


; ―――――――――――――――――――――――――――――――――――――
; (C) arc＠arcis 2004
; arX Launcher 特設サイト ＠ http://hp.vector.co.jp/authors/VA022483/arxlc/?
