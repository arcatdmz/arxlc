
; ■ mklnk Component for arxlc ver.10.0x		 .lnk ファイル作成器
;							 最終更新日 04/09/19
; ―――――――――――――――――――――――――――――――――――――

; COM を利用してショートカットファイルを作成します。

	if cmdline="" :end
	title "mklnk"

; ◇ 初期化

	; 定義
	; kernel32.dll
	#const FNC_MultiByteToWideChar			1
	; ole32.dll
	#const FNC_CLSIDFromString			3
	#const FNC_IIDFromString			4
	; getcmdline
	#const cmdmax					5

	; 命令拡張
	#module "arxlc_mod"

		; エセ dllproc (本家 dllproc と微妙に互換)
		; ※ stat に結果が返らない、エラーダイアログが表示されない差異有り
		#deffunc dllproc str,val,int,int
			mref funcname,32 :mref prms,17 :mref prm_n,2 :mref dll_no,3
			ll_getproc func,funcname,dll_no
			ll_callfunc prms,prm_n,func
		return

		; 本家 getptr 互換
		#deffunc getptr val,val
			mref ptr,16 :mref pval,1025
			if (pval&$FFFF=2) :mref var,25 :else :mref var,17
			ll_getptr var :ptr=dllret@
		return

		; ポインタの分かっている関数を実行
		; ※ ll_getproc を先にメインで実行しておいてあるだけで、他は dllproc と同じ
		#define global dllprocp(%1,%2,%3=0) ll_callfunc %2,%3,%1

		; ANSI→UNICODE変換 (COM用)
		;	使用値	p1	/ 変換する文字列
		#deffunc uni val
			mref wc,24
			strlen prm.5,wc :prm.5++ :sdim mb,prm.5+1 :mb=wc
			prm=0,0,0,-1
			getptr prm.2,mb
			getptr prm.4,wc
			prm.5=prm.5*2
			dllprocp pfunc@.FNC_MultiByteToWideChar@,prm,6
		return

	#global
	mref stt@arxlc_mod,64
	mref ref@arxlc_mod,65

	; 変数の初期化
	sdim cmd,512,cmdmax
	sdim s,1024
	sdim ss,512
	;dim i :dim ii
	;dim prm,16
	dim prmex,37

; ◇ コマンドラインの解析
;	出力値	cmd.0		/ リンク先ファイル名
;		   .1		/ コマンドライン
;		   .2		/ リンク名
;		   .3		/ アイコンファイル名
;		   .4		/ アイコンインデックス

	s=cmdline
	gosub *getcmdline
	if cmd.2="" :end

; ◇ loadlib 関連の初期化

	; DLL 読み込み
	ll_retset dllret
	ll_libload D_OLE,"ole32"
	ll_libload D_GDI,"gdi32"
	ll_libload D_USER,"user32"
	ll_libload D_SHELL,"shell32"
	ll_libload D_KERNEL,"kernel32"

	; 関数読み込み
	;  ポインタ(頻出関数/複数回呼び出す関数については全て取得)
	;dim pfunc
	;   kernel32.dll
	ll_getproc pfunc.FNC_MultiByteToWideChar	,"MultiByteToWideChar"		,D_KERNEL
	;   ole32.dll
	;ll_getproc pfunc.FNC_CoInitialize		,"CoInitialize"			,D_OLE
	ll_getproc pfunc.FNC_CLSIDFromString		,"CLSIDFromString"		,D_OLE
	ll_getproc pfunc.FNC_IIDFromString		,"IIDFromString"		,D_OLE
	;ll_getproc pfunc.FNC_CoCreateInstance		,"CoCreateInstance"		,D_OLE
	;ll_getproc pfunc.FNC_CoUninitialize		,"CoUninitialize"		,D_OLE

	; ポインタ取得
	getptr ps,s :getptr pss,ss
	getptr pi,i :getptr pii,ii
	getptr pprmex,prmex

; ◇ COMの使用準備

	prm=0 :dllproc "CoInitialize",prm,1,D_OLE
	; lollipop オリジナル関数の用意
	;  インターフェースのメソッド呼び出し用マシン語の指定
	;  (lollipop モジュールより一部抜粋）
	dim CallMethod,11 ; 関数データ長 (11*4>)$2A(>(10*4))
	getptr pCallMethod,CallMethod
	prm=pCallMethod,44,$40,0 :dllproc "VirtualProtect",prm,4,D_KERNEL
	CallMethod = $8bec8b55, $d2851455, $458b1974, $0c4d8b08, $34ff03eb, $fa7d4988, $8b028b52, $14ff104d, $b805eb88, $80004003, $0000c3c9
	;  CallMethod	... インターフェースのメソッド呼び出し関数
	;	prm=引数,引数の数,メソッドのインデックス,インターフェースポインタ
	;	※ メソッドのインデックス
	;		0	(Interface)	-> QueryInterface
	;		1	(Interface)	-> AddRef
	;		2	(Interface)	-> Release
	;		3	IShellLink	-> GetPath
	;		10	IShellLink	-> GetArguments
	;		17	IShellLink	-> SetIconLocation
	;		20	IShellLink	-> SetPath
	;		5	IPersistFile	-> Load
	;		6	IPersistFile	-> Save
	; 各インターフェースの準備
	;  IShellLink
	s ="{00021401-0000-0000-C000-000000000046}"; CLSID_ShellLink
	ss="{000214EE-0000-0000-C000-000000000046}"; IID_IShellLinkA
	uni s :uni ss
	prm=ps,pi	:dllprocp pfunc.FNC_CLSIDFromString,prm,2
	prm=pss,pii	:dllprocp pfunc.FNC_IIDFromString,prm,2
	prm=pi,0,1,pii
	getptr prm.4,pShellLink
	dllproc "CoCreateInstance",prm,5,D_OLE
	;  IPersistFile
	ss="{0000010b-0000-0000-C000-000000000046}"; IID_IPersistFile
	uni ss
	prm=pss,pii
	dllprocp pfunc.FNC_IIDFromString,prm,2
	prmex=pii
	getptr prmex.1,pPersistFile
	prm=pprmex,2,0,pShellLink
	ll_callfunc prm,4,pCallMethod

; ◇ ショートカットの作成

	 ; ショートカットの内容指定
	 ;  リンク先ファイル
	 s=cmd
	 prmex=ps
	 prm=pprmex,1,20,pShellLink
	 ll_callfunc prm,4,pCallMethod
	 ;  コマンドライン
	 if cmd.1!"" {
	  s=cmd.1
	  prmex=ps
	  prm=pprmex,1,11,pShellLink
	  ll_callfunc prm,4,pCallMethod
	 }
	 ;  アイコンファイル名
	 if cmd.3!"" {
	  s=cmd.3
	  instr i,s,":",0
	  if i=-1 :s=exedir+"\\"+s
	  ; アイコンインデックスも同時に指定
	  i=cmd.4 :int i
	  prmex=ps,i
	  prm=pprmex,2,17,pShellLink
	  ll_callfunc prm,4,pCallMethod
	 }
	 ; 保存
	 if cmd.2!"" {
	  s=cmd.2
	  instr i,s,":",0
	  if i=-1 :s=exedir+"\\"+s
	  s+=".lnk"
	  uni s
	  prmex=ps,1
	  prm=pprmex,2,6,pPersistFile
	  ll_callfunc prm,4,pCallMethod
	 }

; ◇ 後処理

	; インターフェースの解放
	if pShellLink {
	 prm=0,0,2,pShellLink
	 ll_callfunc prm,4,pCallMethod
	}
	if pPersistFile {
	 prm=0,0,2,pPersistFile
	 ll_callfunc prm,4,pCallMethod
	}
	dllproc "CoUninitialize",prm,0,D_OLE
	end

; ◇ コマンドラインパラメータの切り分け
;	入力値	s	/ コマンドライン
;	出力値	cmd.*	/ 切り分けられたコマンドライン

*getcmdline
	strlen lgt,s
	cur=0
	idx=0
	repeat
	 if idx>lgt :break
	 instr i,s,",",idx
	 instr i.1,s,"\"",idx
	 ; " で囲まれた範囲を切り出す( " を , より前に発見)
	 if i.1!-1&(i.1<i|(i=-1)) {
	  idx+=i.1+1
	  instr i,s,"\"",idx
	  if i=-1 :i=lgt-idx
	  i.1=i+1
	 ; , までを切り出す
	 } else :i.1=i
	 if i=-1 :i=lgt-idx
	 strmid cmd.cur,s,idx,i
	 cur++
	 idx+=i.1+1
	 if cur>=cmdmax :break
	loop
	return


; ―――――――――――――――――――――――――――――――――――――
; (C) arc＠arcis 2004
; arX Launcher 特設サイト ＠ http://hp.vector.co.jp/authors/VA022483/arxlc/?
