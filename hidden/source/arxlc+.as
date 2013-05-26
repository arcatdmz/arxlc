
; ■ arX Launcher 10.0x					    お手軽ランチャー
;							 最終更新日 04/09/25
; ―――――――――――――――――――――――――――――――――――――

	#define appname		"arxlc"
	#define appver		"9.93b2"
	#define appvers		appname+" v."+appver+setfile_ex
	#const appveri		9922


; □ 一言;
;
; API 使いすぎ ... orz
; ですが、このソフトウェア作成を通じて、
; 本当に色々なことを勉強させて頂きました。
; 作業がとても楽しかったです。
;
; 一年くらい前 API の使い方が分からず途方に暮れていた自分が懐かしく思えます。
;
; ここをご覧になっているのが HSP ユーザーの方でしたら、
; 是非 hdtp.as を利用してランチャーのプラグインを作って遊んでみて下さい。
;
; 大した連携はできませんが、"繋がってる" 感を楽しめます(´ー｀)。
; 詳細な説明は hidden フォルダ内の readme.txt に書いてあります。
;
; □ 注記;
;
; このスクリプトは、hsgetmsg.dll が無いと動作しません。
; hsgetmsg.dll(hsgmrtc.hrt) については次項 Copyright をご覧下さい。
;
; このスクリプト及びスクリプトをコンパイルして生成される実行ファイルを使用
; した結果いかなる事態に陥ったとしても arc＠arcis は一切保証できません。
;
; □ Copyright;
;
; 色々な方の多種多様なサイトで情報を調べさせて頂く中で、
; 著作権というものが一体何なのか分からなくなって来ました。
; とりあえずみんなが平和ならそれで良いと思います。
; ごめんなさい意味不明です。
;
; とにかくこの場を借りて、
; 有益な情報を公開されている全ての方々に御礼申し上げます。
;
; 尚、ファイルなどの形で配布されており著作権の所在が明確なものは
;
; hsgmrtc.hrt			ちょくと氏
; COM操作用マシン語コード	同上(lollipop モジュールより一部引用)
;
;	配布元; ちょくとのページ
;	http://yokohama.cool.ne.jp/chokuto/
;
; です。
;
; 情報収集の際に主として利用させて頂いたサイトは
;
;	ちょくとのページ
;	http://yokohama.cool.ne.jp/chokuto/
;
;	HSP-NEXT
;	http://www.silkroad.ne.jp/Sakura/
;
;	Codian
;	http://www.kab-studio.biz/Programing/Codian/
;
;	Win32 API by Object Pascal of Delphi
;	http://homepage2.nifty.com/Mr_XRAY/Halbow/
;
;	MSDN ライブラリ
;	http://www.microsoft.com/japan/msdn/library/
;
; です。
;
; このスクリプト全体の著作権は多分 arc＠arcis が保有していることになるもの
; と思いますが、参考になる部分がもしひとかけらでもあれば、ご自由に転用して
; 頂いて一向に構いません。
;
; ちなみに、モジュールで拡張している命令は、メインで使用している変数を内部
; で利用していたりかなり分かり辛いことをしているので転用には向きません(^^;
;
; □ 更新履歴;
;
;	04/09/06 (990)	初公開版
;	04/09/07 (991)	色のカスタマイズ機能付加
;	04/09/19 (992)	フォルダ登録数の限界を変更(64→32)
;			Windows XP SP2のメモリ保護機能(DEP)に対応
;			メニューアイコン非表示時の処理を少し軽量化
;			特殊なショートカット("マイ コンピュータ"等)に対応
;			特殊コマンドラインによるシステム設定変更機能を追加
;			(→設定ファイルとルートフォルダのパスを変更可能に)
;			システム使用オブジェクトファイルの拡張子を ax に変更
;			最小化ボタン押下時の挙動変更(画面サイズ変更→最小化)
;			コマンドライン指定の仕様上の問題を修正(synciconsize)
;	04/09/19 (993b)	hsgetmsg ver.1.3 → 1.4β に差し替え
;			dllprocp 命令(機能は ll_callfunc と同等)をマクロ化
;	04/09/25(993b2)	hsgetmsg ver.1.4β → 1.4β3 に差し替え
;			filelist.folderid への直接のアクセスを可能に(hdtp)

; ―――――――――――――――――――――――――――――――――――――
; 命令拡張
; ―――――――――――――――――――――――――――――――――――――

; ミニ llmod + 各種命令拡張

	; hsgmrt
	#uselib "hsgetmsg.dll"
	#func gm_setwndproc	gm_setwndproc	$202
	#func gm_setmessage	gm_setmessage	$202
	#func gm_getmessage	gm_getmessage	$202
	; loadlib
	ll_libload D_GDI,"gdi32"
	ll_libload D_USER,"user32"
	ll_libload D_SHELL,"shell32"
	ll_libload D_KERNEL,"kernel32"
	ll_libload D_OLE,"ole32"
	ll_retset dllret
	#const funcs					37
	; gdi32.dll
	#const FNC_CreateCompatibleDC			0
	#const FNC_CreateCompatibleBitmap		1
	#const FNC_SelectObject				2
	#const FNC_BitBlt				3
	#const FNC_DeleteObject				4
	#const FNC_DeleteDC				5
	; user32.dll
	#const FNC_SetForegroundWindow			6
	#const FNC_SetWindowLongA			31
	#const FNC_CreateWindowExA			29
	#const FNC_CreatePopupMenu			7
	#const FNC_TrackPopupMenu			8
	#const FNC_InsertMenuItemA			9
	#const FNC_GetMenuItemInfoA			10
	#const FNC_SetMenuItemInfoA			11
	#const FNC_DestroyMenu				12
	#const FNC_FillRect				13
	#const FNC_DrawIconEx				14
	#const FNC_DestroyIcon				15
	#const FNC_GetSysColor				32
	#const FNC_SendMessageA				30
	#const FNC_CloseWindow				34
	#const FNC_OpenIcon				35
	; shell32.dll
	#const FNC_SHFileOperationA			16
	#const FNC_SHGetPathFromIDListA			33
	#const FNC_Shell_NotifyIconA			17
	#const FNC_ShellExecuteExA			18
	#const FNC_DragAcceptFiles			19
	#const FNC_DragQueryFileA			20
	#const FNC_DragFinish				21
	#const FNC_ExtractIconExA			22
	#const FNC_ExtractAssociatedIconA		23
	; kernel32.dll
	#const FNC_MultiByteToWideChar			24
	#const FNC_GetFileAttributesA			25
	#const FNC_GetShortPathNameA			26
	#const FNC_VirtualProtect			36
	; ole32.dll
	#const FNC_CLSIDFromString			27
	#const FNC_IIDFromString			28
	; モジュール内で利用する値のため、#module より前で定義
	#const appmax		24	; 最もよく使うプログラム(アプリ)登録数の限界
	#const mg_left		15	; 閉じるボタン用領域幅
	; その他の命令拡張

	#module "arxlc_mod"

		; エセ dllproc (本家 dllproc と微妙に互換)
		; ※ stat に結果が返らない、エラーダイアログが表示されない差異有り
		#deffunc dllproc str,val,int,int
		mref funcname,32 :mref prms,17 :mref prm_n,2 :mref dll_no,3
		ll_getproc func,funcname,dll_no
		ll_callfunc prms,prm_n,func :return

		; ポインタの分かっている関数を実行
		; ※ ll_getproc を先にメインで実行しておいてあるだけで、他は dllproc と同じ
		#define global dllprocp(%1,%2,%3=0) ll_callfunc %2,%3,%1

		; 本家 getptr 互換
		#deffunc getptr val,val
		mref vptr,16 :mref pval_var,1025
		if (pval_var&$ffff=2) :mref var,25 :else :mref var,17
		ll_getptr var :vptr=dllret@
		return

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

		; メニュー項目の追加
		;	使用値	"p1"	/ 項目表示文字列
		;		p2	/ メニュー項目ID
		;		p3	/ ビットマップオブジェクトのハンドル(無ければ0)
		;		p4	/ 項目下のサブメニューのハンドル
		;		p5	/ 項目追加先のメニューのハンドル
		#deffunc imenu str,int,int,int,int
		mref s,32 :mref id,1 :mref hbitmap,2 :mref hsubmenu,3 :mref hmenu,4
		string=s
		;  MENUITEMINFO構造体を作成
		mii@=oschk@>0*4+44,(hsubmenu!0*$4)+(oschk@>0*$30)+$12,0,0,id,hsubmenu,0,0,0,0,0,0
		if hbitmap!0&(oschk_@>0) :mii@.1+=$80 :mii@.11=hbitmap :string="  "+string
		if string="" :mii@.2=$800 :else {
		 if string="|" :mii@.2=$10 :else {
		  mii@.2=0 :mii@.9=pstring :strlen mii@.10,string
		 }
		}
		;  メニュー追加
		prm=hmenu,-1,1,pmii@
		dllprocp pfunc@.FNC_InsertMenuItemA@,prm,4
		return

		; GetMenuItemInfoA
		;	使用値	p1	/ 調査する項目のあるメニューのハンドル
		;		p2	/ 調査する項目のID
		#deffunc getmii int,int
		mref hmenu :mref id,1
		prm=hmenu,id,0,pmii@ :dllprocp pfunc@.FNC_GetMenuItemInfoA@,prm,4
		return

		; SetMenuItemInfoA
		;	使用値	p1	/ 設定する項目のあるメニューのハンドル
		;		p2	/ 設定する項目のID
		#deffunc setmii int,int
		mref hmenu :mref id,1
		prm=hmenu,id,0,pmii@ :dllprocp pfunc@.FNC_SetMenuItemInfoA@,prm,4
		return

		; メニュー項目の表示文字列変更
		;	使用値	"p1"	/ 表示文字列
		;		p2	/ 変更する項目のID
		;		p3	/ 変更する項目のあるメニューのハンドル
		#deffunc tmenu str,int,int
		mref s,32 :mref id,1 :mref hmenu,2
		string=s
		; 下調べ
		mii@.1=oschk@>0*$30+(oschk_@>0*$80)+$10	; dwTypeData, hbmpItem の取得
		mii@.9=pstring2
		getmii hmenu,id
		; アイコン付きメニュー項目では文字列前にスペース付加
		if oschk_@>0 :mii@.1-=$80 :if mii@.11!0 :string="  "+string
		; 文字列変更
		mii@.9=pstring :strlen mii@.10,string
		setmii hmenu,id
		return

		; メニューのポップアップ
		;	使用値	p1	/ ポップアップするメニューのハンドル
		;		p2	/ マウス座標を命令内で取得する(0)か否(1)か
		;		p3	/ アクティブにするウィンドウのハンドル
		#deffunc pmenu int,int
		mref hmenu,0
		mref ginfo_flag,1
		if ginfo_flag=0	:ginfo
		dllprocp pfunc@.FNC_SetForegroundWindow@,hwnd@,1
		prm=hmenu,$182,prmx,prmy,0,hwnd@,0
		dllprocp pfunc@.FNC_TrackPopupMenu@,prm,7
		return

		; トレイアイコンの初期化
		#deffunc ntray
		prm=0 :prmex@=88,hwnd@,0,3,$499,hicon@
		gosub *@f
		return

		; トレイアイコン表示文字列の設定
		;	使用値	"p1"	/ 表示文字列
		#deffunc ttray str
		prm=1 :prmex@=88,hwnd@,0,4,$499,hicon@
		mref s,32 :poke prmex@,24,s
		gosub *@f
		return

		; トレイアイコンの消去
		#deffunc ctray
		prm=2 :prmex@=88,hwnd@,0,4,$499,hicon@
		gosub *@f
		return

		*@
		prm.1=pprmex@
		dllprocp pfunc@.FNC_Shell_NotifyIconA@,prm,2
		return

		; チップヘルプの設定
		;	使用値	p1	/ 表示文字列
		;		p2	/ アプリID (appmax 以上なら p3 以下を使用)
		;		p3-p7	/ 矩形領域
		#deffunc tiphelp str,int,int,int,int,int
		mref s,32 :mref appid,1
		; ToolInfo 構造体の作成
		;  準備(矩形領域の指定; 一行が長くなるから事前に)
		if appid>=appmax@ {
		 repeat 4 :mref ii,2+cnt :i.cnt=ii :loop
		} else {
		 i	=appid*(sysiconsize@+mg@)+mg@+mg_left@+mg_girth@,mg@+mg_girth@
		 i.2	=i+sysiconsize@,i.1+sysiconsize@
		}
		;  作成
		;	cbSize	,uFlags	,hwnd	,uId	,Rect		,hInst	,lpszText
		prmex@=	40	,16	,hwnd@	,appid	,i,i.1,i.2,i.3	,hinst@	,pstring
		; 前回作成したチップヘルプの削除 (WM_USER+5)
		if appid<appmax@ {
		 if apptip@.appid {
		  prm=hwnd_tip@,1029,0,pprmex@	:dllprocp pfunc@.FNC_SendMessageA@,prm,4
		 } else :apptip@.appid=1
		}
		; チップヘルプの登録 (WM_USER+4)
		string=s
		if string!"" {
		 prm=hwnd_tip@,1028,0,pprmex@	:dllprocp pfunc@.FNC_SendMessageA@,prm,4
		}
		return

		; ビットマップオブジェクトとデバイス間での gcopy
		;	使用値	p1	/ gcopy 先のデバイスコンテキスト(p7=0)またはビットマップオブジェクト(1)
		;		p2-p5	/ gcopy サイズ指定
		;		p6	/ gcopy 元のデバイスコンテキスト(p7=1)またはビットマップオブジェクト(0)
		;		p7	/ ビットマップオブジェクト判別用フラグ
		#deffunc bitbltex int,int,int,int,int,int,int
		mref hto,0 :mref px_,1 :mref py_,2 :mref sx,3 :mref sy,4 :mref hfrom,5
		mref bitmap,6	; 0 dc->bitmap / 1 hbitmap->dc
		px=px_ :py=py_
		if bitmap :hdcex@.1=hfrom :else :hdcex@.1=hto
		gosub *@f
		if bitmap :hfrom=hdcex@ :else :hto=hdcex@
		prm=hto,px,py,sx,sy,hfrom,0,0,$CC0020
		dllprocp pfunc@.FNC_BitBlt@,prm,9
		hdcex@.1=hbmpblank@ :gosub *@f
		return
		*@ :dllprocp pfunc@.FNC_SelectObject@,hdcex@,2 :return

		; ブラシによる boxf
		;	使用値	p1-p4	/ 矩形領域
		;		p5	/ ブラシのハンドル
		#deffunc boxf_ int,int,int,int,int,int
		mref left :mref top,1 :mref right,2 :mref bottom,3
		mref hdc,4 :mref hbrush,5
		prmex@=left,top,right,bottom
		prm=hdc,pprmex@,hbrush
		dllprocp pfunc@.FNC_FillRect@,prm,3
		return

		; 高速 exist
		;	使用値	p1	/ 存在を確認するファイルまたはフォルダ名
		;	戻り値	stat	/ 存在しない(0),ファイル(1),フォルダ(-1)
		#deffunc exist_ str
		mref s,32 :string=s
		dllprocp pfunc@.FNC_GetFileAttributesA@,pstring,1
		if dllret@=-1 :stt=0	:return	; 存在しない
		if dllret@&$10:stt=-1	:return	; フォルダ
		stt=1
		return

		; 高機能 exec
		; PIDL を使用した場合はその解放まで引き受けます。
		;	使用値	p1	/ ファイル
		;		p2	/ ファイルに渡すコマンドライン
		;		pidl@	/ アイテムIDリストへのポインタ
		;		tmp@	/ 動作モード
		#deffunc exec_ val,val
		mref s,24 :string=s
		mref ss,25 :string2=ss
		; SHELLEXECUTEINFO 構造体の作成
		prmex@=60,pidl@!0*4,hwnd@,ptmp@,pidl@=0*pstring,0,0,1,0,pidl@,0,0,0,0,0
		if string2!"" :prmex@.5=pstring2 ; コマンドライン
		dllprocp pfunc@.FNC_ShellExecuteExA@,pprmex@,1
		; PIDL 用メモリ領域の解放
		if pidl@!0 {
		 prmex@=pidl@ :prm=pprmex@,1,5,pMalloc@
		 ll_callfunc prm,4,pCallMethod@
		}
		return

		; 文字入力 dialog
		;	前提	wid 5 のウィンドウが無いこと
		;	使用値	"p1"	/ 入力内容初期値
		;		"p2"	/ ダイアログのタイトル
		;	戻り値	refstr	/ 入力内容
		#deffunc dialoginput str,str
		mref s,32 :string=s		; 初期値
		mref s,33			; タイトル
		if dialoginput_ {
		 screen 5,240,85,6 :mref bmscr,67
		 boxf_ 0,0,240,160,bmscr.4,hbrush@
		 color col@,col@.1,col@.2 :line 4,50,winx-6,50
		 font "ＭＳＰ ゴシック",12
		 objmode 2,1
		 objsize winx-10,25	:pos 5,15	:input string
		 objsize 65,25		:pos 90,57	:button "OK",*ok
		 objmode 2,17
		 objsize 75,25		:pos 160,57	:button "キャンセル",*cancel
		 dialoginput_=0
		} else :gsel 5
		title s
		objprm 0,string
		gsel 5,1
		stop
		*cancel	:ref=""		:goto *@f
		*ok	:ref=string	:goto *@f
		*@	:gsel 5,-1 :gsel 4,1 :return

	#global
	mref stt@arxlc_mod,64
	mref ref@arxlc_mod,65
	sdim string@arxlc_mod,512
	sdim string2@arxlc_mod,1024
	; dim pstring@arxlc_mod
	; dim pstring2@arxlc_mod
	getptr pstring@arxlc_mod,string@arxlc_mod
	getptr pstring2@arxlc_mod,string2@arxlc_mod
	dialoginput_@arxlc_mod=1


; ―――――――――――――――――――――――――――――――――――――
; 準備
; ―――――――――――――――――――――――――――――――――――――

; 定義

	sdim rootdir,512
		rootdir=	exedir
	#define	setdir		"hidden"
	#define setfile_default	"arxlc.dat"
		setfile_=	setfile_default
	#define	setfile		exedir+"\\"+setdir+"\\"+setfile_
	#define	extfile_	setdir+"\\plus.ax"
	#define	extfile		exedir+"\\"+extfile_
	#define	hlpfile		exedir+"\\readme.html"
	#const	wm_xpi		$500	; プラグインとの情報やり取り用
					; 　　　ウィンドウメッセージID
	#const	setmax_thisver	17	; 設定項目数
	#const	foldermax	32	; フォルダ追加数の限界
	#const	filemax		192	; ファイル追加数の限界(フォルダ当り)

; バッファの確保と初期設定値の代入

	; 文字列型
	sdim filelist,16384,foldermax	; ファイルリスト(フォルダ別)
	sdim curfolder,512		; 現在の処理対象フォルダ(初期化時使用)
	sdim myself,512			; 自分のファイル名
	sdim apptitle,256,appmax	; アプリのチップヘルプ表示文字列
	setfile_ex=""			; 設定ファイル名(タイトル表示用)
	sdim s,1024			; 汎用
	sdim ss,16384			; 〃
	sdim tmp,32768			; 〃
	; 数値型
	; dim msgval,16			; ウィンドウメッセージ取得先
	dup msg,msgval.1		; 〃　　　　　　　　　コード
	dup wprm,msgval.2		; 〃　　　　　　　　　wParam
	dup lprm,msgval.3		; 〃　　　　　　　　　lParam
	; dim oschk			; imenu 全般の動作判別用 OS 種別 (0=95/NT4.0, 1=98, 2=2000/xp)
	; dim oschk_			; imenu メニューアイコン動作判別用 OS 種別 (oschk=1,2 の環境で 0 にしても問題無し)
	; dim mii,12			; MENUITEMINFO 構造体
	; dim col,3			; システム色(影)
	dim appid,appmax		; アプリ情報
	dim apptip,appmax		; アプリのチップヘルプ初期化情報
	curappli=-1			; 現在アクティブなアプリの番号
	hov=-1,-1			; 自作ボタン上にマウスカーソルがある(1)か否(0)か
	dup hovclosebtn,hov.0		; 閉じるボタン上にマウスカーソルがある(1)か否(0)か
	dup hovminmzbtn,hov.1		; 最小化ボタン上にマウスカーソルがある(1)か否(0)か
	; dim curfoldernum		; 現在の処理対象フォルダ番号
	; dim pidl			; アイテムIDリストへのポインタ (ShellExecuteExA 用)
	; dim restart			; 終了処理時再起動フラグ (1=する, 0=しない)
	; dim i				; 汎用
	; dim ii			; 〃
	dim prmex,128			; 〃
	; 数値型(arxlc の設定)
	dim setting,setmax_thisver	; arxlc の設定
	; setting=appveri		; バージョン情報
	dup setmax,setting.1		; 前回終了時に保存された際の設定項目数
	dup mainx,	setting.2	; メイン画面の位置
	dup mainy,	setting.3	; ↓初期位置
	setting.2=dispx-sysiconsize/2,dispy-sysiconsize/2
	dup iconsize,	setting.4	; メニューアイコンの大きさ
	iconsize=		32	;
	dup sysiconsize,setting.5	; アプリアイコン(メイン画面に表示されるアイコン)の大きさ
	sysiconsize=		32	;
	dup synciconsize,setting.6	; アプリアイコンの大きさをメニューアイコンに合わせるか
	synciconsize=		1	;
	dup bandmode,	setting.7	; メニュー表示域('n' で表示「しない」)
	bandmode=	       'u'	;
	; dup bandsize,	setting.8	; メニュー表示域幅	※要望によっては変更機能を追加予定
	; bandsize=		1	;
	dup noclickpop,	setting.9	; クリック無しでメニューを表示するか(1)否(0)か
	noclickpop=		1	;
	dup mg_girth,	setting.10	; メイン画面枠幅
	mg_girth=		2	;
	dup mg,		setting.11	; アプリアイコン間隔
	mg=			2	;
	dup minimized,	setting.12	; 最小化フラグ
	dup forelock,	setting.13	; 最前面表示フラグ
	dup appnum,	setting.15	; 現在利用されているアプリ数
	dup cmg_girth,	setting.16	; メイン画面枠色
	; dup cmg,	setting.17	; アプリアイコン間隔色	※要望によっては変更機能を追加予定
	; dup cmg_shadow,setting.18	; 　　　　〃　　　影色	※
	; dup cbtn,	setting.19	; システムボタン色	※
	; dup cbtn_shadow,setting.20	; 　　　　〃　　影色	※
	;	mg_left
	;	 │ ┌sysiconsize
	;	 │ │┌mg      mg_girth+mg_hover
	;	 ↓ ↓↓        ↓
	;	┌┬─┬─┬…─┐←mg_girth
	;	││ａ│ap│... │←sysiconsize
	;	└┴─┴─┴…─┘←mg_girth+mg_hover
	;	↑mg_girth
	;#const mg_left		15	; 閉じるボタン用領域幅
	#const mg_hover	1		; アクティブ時、アプリアイコン移動幅
	; 数値型(ハンドル)
	; dim hicon			; プログラムの持つアイコンのハンドル
	; dim hbrush			; システム色のブラシのハンドル
	; dim hinst			; メイン画面のインスタンスハンドル
	; dim hwnd			; メイン画面のウィンドウハンドル
	; dim hdc			; メイン画面のデバイスコンテキスト
	; dim hdcex			; 一時処理用のデバイスコンテキスト
	dim hmenu,foldermax		; メニューハンドル(フォルダ別)
	; dim hmenus,16			; メニューハンドル(システム使用)
	dup hmenu_ex,hmenus		;
	dup hmenu_modlink,hmenus.1	;
	dup hmenu_setting1,hmenus.2	;
	dup hmenu_setting2,hmenus.3	;
	dim hbmp,foldermax,filemax	; ビットマップハンドル(ファイル別)

; 情報の取得

	; loadlib.dll 関連
	;  ポインタ
	getptr ps,s :getptr pss,ss :getptr ptmp,tmp
	getptr pi,i :getptr pii,ii
	getptr pprmex,prmex
	getptr pmii,mii
	dim pfilelist,foldermax		; 後で取得
	;  ポインタ(頻出関数/複数回呼び出す関数については全て取得)
	dim pfunc,funcs
	;   gdi32.dll
	ll_getproc pfunc.FNC_CreateCompatibleDC		,"CreateCompatibleDC"		,D_GDI
	ll_getproc pfunc.FNC_CreateCompatibleBitmap	,"CreateCompatibleBitmap"	,D_GDI
	ll_getproc pfunc.FNC_SelectObject		,"SelectObject"			,D_GDI
	ll_getproc pfunc.FNC_BitBlt			,"BitBlt"			,D_GDI
	ll_getproc pfunc.FNC_DeleteObject		,"DeleteObject"			,D_GDI
	ll_getproc pfunc.FNC_DeleteDC			,"DeleteDC"			,D_GDI
	;   user32.dll
	ll_getproc pfunc.FNC_GetSysColor		,"GetSysColor"			,D_USER
	;ll_getproc pfunc.FNC_GetSysColorBrush		,"GetSysColorBrush"		,D_USER
	ll_getproc pfunc.FNC_SetForegroundWindow	,"SetForegroundWindow"		,D_USER
	ll_getproc pfunc.FNC_SetWindowLongA		,"SetWindowLongA"		,D_USER
	ll_getproc pfunc.FNC_CreateWindowExA		,"CreateWindowExA"		,D_USER
	ll_getproc pfunc.FNC_CreatePopupMenu		,"CreatePopupMenu"		,D_USER
	ll_getproc pfunc.FNC_TrackPopupMenu		,"TrackPopupMenu"		,D_USER
	ll_getproc pfunc.FNC_InsertMenuItemA		,"InsertMenuItemA"		,D_USER
	ll_getproc pfunc.FNC_GetMenuItemInfoA		,"GetMenuItemInfoA"		,D_USER
	ll_getproc pfunc.FNC_SetMenuItemInfoA		,"SetMenuItemInfoA"		,D_USER
	ll_getproc pfunc.FNC_DestroyMenu		,"DestroyMenu"			,D_USER
	ll_getproc pfunc.FNC_FillRect			,"FillRect"			,D_USER
	ll_getproc pfunc.FNC_DrawIconEx			,"DrawIconEx"			,D_USER
	ll_getproc pfunc.FNC_DestroyIcon		,"DestroyIcon"			,D_USER
	ll_getproc pfunc.FNC_SendMessageA		,"SendMessageA"			,D_USER
	ll_getproc pfunc.FNC_CloseWindow		,"CloseWindow"			,D_USER
	ll_getproc pfunc.FNC_OpenIcon			,"OpenIcon"			,D_USER
	;   shell32.dll
	ll_getproc pfunc.FNC_SHFileOperationA		,"SHFileOperationA"		,D_SHELL
	ll_getproc pfunc.FNC_SHGetPathFromIDListA	,"SHGetPathFromIDListA"		,D_SHELL
	ll_getproc pfunc.FNC_Shell_NotifyIconA		,"Shell_NotifyIconA"		,D_SHELL
	ll_getproc pfunc.FNC_ShellExecuteExA		,"ShellExecuteExA"		,D_SHELL
	ll_getproc pfunc.FNC_DragAcceptFiles		,"DragAcceptFiles"		,D_SHELL
	ll_getproc pfunc.FNC_DragQueryFileA		,"DragQueryFileA"		,D_SHELL
	ll_getproc pfunc.FNC_DragFinish			,"DragFinish"			,D_SHELL
	ll_getproc pfunc.FNC_ExtractIconExA		,"ExtractIconExA"		,D_SHELL
	ll_getproc pfunc.FNC_ExtractAssociatedIconA	,"ExtractAssociatedIconA"	,D_SHELL
	;   kernel32.dll
	ll_getproc pfunc.FNC_MultiByteToWideChar	,"MultiByteToWideChar"		,D_KERNEL
	ll_getproc pfunc.FNC_GetFileAttributesA		,"GetFileAttributesA"		,D_KERNEL
	ll_getproc pfunc.FNC_GetShortPathNameA		,"GetShortPathNameA"		,D_KERNEL
	ll_getproc pfunc.FNC_VirtualProtect		,"VirtualProtect"		,D_KERNEL
	;ll_getproc pfunc.FNC_GetVersionExA		,"GetVersionExA"		,D_KERNEL
	;ll_getproc pfunc.FNC_GetModuleFileNameA	,"GetModuleFileNameA"		,D_KERNEL
	;   ole32.dll
	;ll_getproc pfunc.FNC_CoInitialize		,"CoInitialize"			,D_OLE
	ll_getproc pfunc.FNC_CLSIDFromString		,"CLSIDFromString"		,D_OLE
	ll_getproc pfunc.FNC_IIDFromString		,"IIDFromString"		,D_OLE
	;ll_getproc pfunc.FNC_CoCreateInstance		,"CoCreateInstance"		,D_OLE
	;ll_getproc pfunc.FNC_CoUninitialize		,"CoUninitialize"		,D_OLE
	;  ハンドル
	;   システム色のブラシ
	prm=15 :dllproc "GetSysColorBrush",prm,1,D_USER	:hbrush=dllret
	;  その他
	;   システム色
	dllprocp pfunc.FNC_GetSysColor,prm,1		:cbtn=dllret
	prm=16 :dllprocp pfunc.FNC_GetSysColor,prm,1	:cbtn_shadow=dllret
	col=dllret&255,dllret>>8&255,dllret>>16&255
	;   Windows のバージョン (98でoschk=1/Me,2000以降でoschk=2)
	prmex=148 :dllproc "GetVersionExA",pprmex,1,D_KERNEL
	if prmex.4=1&(prmex.1=10) :oschk=1 :else {
	 if prmex.4=1&(prmex.1>=10)|(prmex.4=2&(prmex.1>=5)) :oschk=2
	}
	oschk_=oschk
	;   プログラム本体の名前
	prm=0,0,512 :getptr prm.1,myself
	dllproc "GetModuleFileNameA",prm,3,D_KERNEL

	; 動作オプション

	;  特殊コマンドライン
	s=cmdline
	strlen i,s
	ii=0
	repeat i
	 if ii>=i :break
	 ; | 開始
	 instr prm,s,"|",ii
	 if prm=-1 :break
	 ii+=prm
	 ; | 終了
	 instr prm,s,"|",ii+1
	 if prm=-1 :break
	 ; コマンド取得
	 peek prm.1,s,ii+prm+2
	 if prm.1='R' :strmid rootdir ,s,ii+1,prm
	 if prm.1='S' :strmid setfile_,s,ii+1,prm
	 ; | 囲み範囲とコマンドを削除
	 strmid ss,s, ii+prm+3,i-(ii+prm+2)
	 strmid s,s,0,ii
	 i-=prm+2
	 s+=ss
	loop

	;  多重起動のチェック
	tmp="oniwnd1"
	ss =appname+"@"+setfile_
	prm=ptmp,pss
	dllproc "FindWindowA",prm,2,D_USER
	if dllret!0 {
	 ; 既に起動している arxlc を再起動
	 prm=dllret,wm_xpi,2<<5+(0<<2)+1,0
	 dllprocp pfunc.FNC_SendMessageA,prm,4
	 end
	}

	;  設定ファイル
	exist_ setfile
	if stat>0 {
	 bload setfile,setting,setmax*4,0
	 if appveri!setting {
	  dialog appname+" がバージョンアップされました。\n継続的なご利用ありがとうございます。",0,appvers
	 }
	 ; アプリの読み込みはメニュー構築後
	}

	;  コマンドライン
	prm=0
	repeat i
	 peek i,s,cnt
	 ; oschk_
	 if i='o'&(oschk>0) :strmid oschk_,s,prm,cnt-prm :int oschk_
	 ; icon-size
	 if i='i' :strmid iconsize,s,prm,cnt-prm :int iconsize
	 ; appli icon-size
	 if i='a' :strmid sysiconsize,s,prm,cnt-prm :int sysiconsize
	 ; x-coodinate
	 if i='x' :strmid mainx,s,prm,cnt-prm :int mainx
	 ; y-coordinate
	 if i='y' :strmid mainy,s,prm,cnt-prm :int mainy
	 ; border-width
	 if i='b' :strmid mg_girth,s,prm,cnt-prm :int mg_girth
	 ; margin-width
	 if i='m' :strmid mg,s,prm,cnt-prm :int mg
	 ; click neccesity for popping menu
	 if i='c' :noclickpop=0
	 ; sync icon-size
	 if i='s' :strmid synciconsize,s,prm,cnt-prm :int synciconsize
	 ; up, down, right or left edge of the desktop
	 if i='u'|(i='d')|(i='r')|(i='l')|(i='n') :bandmode=i
	 ; else
	 if i<'0'|(i>'9') :prm=cnt+1
	loop

	; メニューアイコンの大きさ 0 → 非表示
	if iconsize=0&(oschk>0) :oschk_=0
	; アプリアイコンの大きさ 0 → 32(デフォルトサイズ)に変更
	sysiconsize+=sysiconsize=0*32
	; アプリアイコンの大きさをメニューアイコンに合わせる
	if synciconsize {
	 if iconsize=0 :synciconsize=0 :else :sysiconsize=iconsize
	}

; COMの使用準備

	prm=0 :dllproc "CoInitialize",prm,1,D_OLE
	; lollipop オリジナル関数の用意
	;  インターフェースのメソッド呼び出し用マシン語の指定
	;  (lollipop モジュールより一部抜粋）
	dim CallMethod,11 ; 関数データ長 (11*4>)$2A(>(10*4))
	getptr pCallMethod,CallMethod
	prm=pCallMethod,44,$40,0 :dllprocp pfunc.FNC_VirtualProtect,prm,4
	CallMethod = $8bec8b55, $d2851455, $458b1974, $0c4d8b08, $34ff03eb, $fa7d4988, $8b028b52, $14ff104d, $b805eb88, $80004003, $0000c3c9
	;  CallMethod	... インターフェースのメソッド呼び出し関数
	;	prm=引数,引数の数,メソッドのインデックス,インターフェースポインタ
	;	※ メソッドのインデックス
	;		0	(Interface)	-> QueryInterface
	;		1	(Interface)	-> AddRef
	;		2	(Interface)	-> Release
	;		3	IShellLink	-> GetPath
	;		10	IShellLink	-> GetArguments
	;		5	IPersistFile	-> Load
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
	;  IMalloc
	getptr  prm,pMalloc
	dllproc "SHGetMalloc",prm,1,D_SHELL

; 画面などの準備

	; メイン画面の初期化
	bgscr 4,appmax+1*(sysiconsize+mg)+mg+mg_hover+(mg_girth*2)+mg_left,mg+mg_girth*2+sysiconsize+mg_hover,2,mainx,mainy,mg+mg_girth*2+mg_left+sysiconsize+mg_hover
	font "ＭＳ ゴシック",13,17
	mref bmscr,67
	hdc=bmscr.4
	hwnd=bmscr.13
	hinst=bmscr.14
	;  拡張スタイルに WS_EX_TOOLWINDOW を加える
	;  ※ ツールウィンドウは、通常のタイトルバーより小さいタイトルバーを持ち...
	;  　 ↑タイトルバーが元々無いウィンドウでこのスタイルを指定した場合には "小さいタイトルバーe.t.c." は関係無いらしい
	prm=hwnd,-20	:dllproc "GetWindowLongA",prm,2,D_USER
	prm.2=dllret|$80:dllproc "SetWindowLongA",prm,3,D_USER
	;  サブクラス化とメッセージの受付開始
	gm_setwndproc hwnd
	gm_setmessage hwnd,$201	 ; 左クリックの取得
	gm_setmessage hwnd,$205	 ; 右クリックの取得
	gm_setmessage hwnd,$233	 ; ドラッグ＆ドロップの取得
	gm_setmessage hwnd,$499  ; タスクトレイのメッセージを取得
	gm_setmessage hwnd,wm_xpi; プラグインからのメッセージを取得
	prm=hwnd,1
	dllprocp pfunc.FNC_DragAcceptFiles,prm,2
	;  チップヘルプ用の子ウィンドウ作成
	;   ※ COMCTL 初期化は不要らしい
	;	; Windows 98以降では InitCommonControlsEx を利用
	;	if oschk>0 {
	;	 prmex=8,
	;	 dllproc "InitCommonControlsEx",pprmex,1,D_COMCTL
	;	} else {
	;	 dllproc "InitCommonControls",prm,0,D_COMCTL
	;	}
	prm=0,ps,0,$40|1,$8000000,$8000000,$8000000,$8000000,hwnd,0,hinst,0
	s="tooltips_class32" :dllprocp pfunc.FNC_CreateWindowExA,prm,12
	hwnd_tip=dllret
	if setfile_=setfile_default :setfile_ex="" :else :setfile_ex=" (@"+setfile_+")"
	tiphelp appvers,0
	tiphelp "終了",appmax,0,0,mg_left,15
	tiphelp "最小化",appmax,0,15,mg_left,30
	; 画像関連の一時処理用バッファの初期化
	buffer 3,,,0
	mref bmscr,67

	if oschk_ {
	; 一時処理用デバイスコンテキストとビットマップオブジェクトを作成
	;  デバイスコンテキスト
	dllprocp pfunc.FNC_CreateCompatibleDC,hdc,1
	hdcex=dllret
	;  ビットマップオブジェクト
	prm=hdcex,1,1
	dllprocp pfunc.FNC_CreateCompatibleBitmap,prm,3
	hbmpblank=dllret
	; フォルダアイコン(ビットマップオブジェクト)を作成
	boxf_ 0,0,iconsize,iconsize,bmscr.4,hbrush
	palcolor 0
	boxf 1,2,7,2
	boxf 1,3,14,13
	palcolor 255
	boxf 2,3,6,3
	boxf 2,5,13,12
	prm=bmscr.4,iconsize,iconsize
	dllprocp pfunc.FNC_CreateCompatibleBitmap,prm,3 :hbmpfolder=dllret
	bitbltex hbmpfolder,0,0,iconsize,iconsize,bmscr.4
	}
	boxf_ 0,0,iconsize,iconsize,bmscr.4,hbrush

	; プログラムアイコンを取得＆メイン画面に描画
	gsel 4
	redraw 2
	color cmg_girth&$FF,cmg_girth>>8&$FF,cmg_girth>>16&$FF :boxf
	boxf_ mg_girth+mg_left,mg_girth,winx-mg_girth,winy-mg_girth,hdc,hbrush
	;  取得
	ss=myself
	prm=pss,0,pii,0,1
	dllprocp pfunc.FNC_ExtractIconExA,prm,5
	hicon=ii
	;  描画
	prmex=hdc,mg_girth+mg_left+mg,mg_girth+mg,hicon,sysiconsize,sysiconsize,0,0,3
	dllprocp pfunc.FNC_DrawIconEx,prmex,9
	prm=mg+mg_left+mg_girth,mg+mg_girth
	color col,col.1,col.2
	line prm,prm.1+sysiconsize,prm+sysiconsize,prm.1+sysiconsize
	line prm+sysiconsize,prm.1,prm+sysiconsize,prm.1+sysiconsize

; メニューの構築

	gsel 3

	tmp=rootdir+"\n"
	repeat foldermax
	 await
	 curfoldernum=cnt

	 ; 検索するフォルダの取得
	 notesel tmp
	 notemax prmex
	 if curfoldernum>=prmex :break
	 if curfoldernum=0 {
	  ; ルートメニュー
	  dllprocp pfunc.FNC_CreatePopupMenu,prm
	  hmenu.curfoldernum=dllret
	  ; ルート特殊用途メニュー
	  dllprocp pfunc.FNC_CreatePopupMenu,prm
	  hmenu_ex=dllret
	  imenu "(?)",100,0,0,hmenu_ex
	  imenu "→ヘルプ",101,0,0,hmenu_ex
	  imenu "",0,0,0,hmenu_ex
	  mii.1=1 :mii.3=$1003
	  setmii hmenu_ex,100
	 }
	 noteget curfolder,curfoldernum
	 curfolder+="\\"

	 ; カレントフォルダに設定
	 skiperr 1 :chdir curfolder :i=err :skiperr 0
	 if i :continue

	 ; フォルダ内サブフォルダ検索
	 dirlist ss,"*",5
	 notesel ss
	 notemax i
	 repeat i
	  if prmex>=foldermax :break
	  noteget s,cnt
	  if s="hidden" :continue
	  tmp+=curfolder+s+"\n"
	  dllprocp pfunc.FNC_CreatePopupMenu,prm
	  hmenu.prmex=dllret
	  imenu s,0,hbmpfolder,hmenu.prmex,hmenu.curfoldernum
	  if curfoldernum=0 :imenu s,0,hbmpfolder,hmenu.prmex,hmenu_ex
	  prmex++
	 loop

	 ; フォルダ内ファイル検索
	 getptr pfilelist.curfoldernum,filelist.curfoldernum
	 ;  プラグインからファイルリストのデータを読み込めるようにする
	 ;  (不要みたい。)
	 ;   prm=pfilelist.curfoldernum,16384,$4,0
	 ;   dllprocp pfunc.FNC_VirtualProtect,prm,4
	 dirlist filelist.curfoldernum,"*.lnk",1
	 ss="" :dirlist ss,"*.url",1
	 filelist.curfoldernum+=ss
	 if cnt!0 {
	  ss="" :dirlist ss,"*.exe",1
	  filelist.curfoldernum+=ss
	 }
	 notesel filelist.curfoldernum
	 notemax prm
	 repeat filemax-prm*(prm>filemax)+prm
	  await
	  noteget s,cnt
	  ss=curfolder+s
	  noteadd ss,cnt,1
	  ; ファイルアイコン付加は Windows 98,2000 以降のみ可
	  if oschk_ {
	   ; アイコンの取得(SHGetFileInfoA)
	   ;
	   ; ※ ExtractIconExA , SHGetFileInfoA 速度比較 (単位 ms)
	   ; Extract;	54.497 -> 55.218	721 ... ブート後 arxlc 初起動
	   ; 		02.121 -> 02.361	240
	   ; 		35.501 -> 35.752	251
	   ; 		00.924 -> 01.174	250
	   ; SHGetFI;	05.960 -> 06.210	250
	   ; 		43.761 -> 44.011	250
	   ; 		17.622 -> 17.872	250
	   ; 		15.061 -> 15.301	240
	   ; 殆ど差がない。
	   ;
	   ; ※ SHFILEINFO 構造体は冒頭部分(LONG 二つ分/8byte)だけ利用
	   ;	uFlags;				 使用しているフラグ
	   ;	SHGFI_ICON		$100		(*)
	   ;	SHGFI_DISPLAYNAME	$200
	   ;	SHGFI_TYPENAME		$400
	   ;	SHGFI_ATTRIBUTES	$800
	   ;	SHGFI_ICONLOCATION	$1000
	   ;	SHGFI_EXETYPE		$2000
	   ;	SHGFI_SYSICONINDEX	$4000
	   ;	SHGFI_LINKOVERLAY	$8000
	   ;	SHGFI_SELECTED		$10000
	   ;	SHGFI_ATTR_SPECIFIED	$20000
	   ;	SHGFI_LARGEICON		$0
	   ;	SHGFI_SMALLICON		$1
	   ;	SHGFI_OPENICON		$2
	   ;	SHGFI_SHELLICONSIZE	$4
	   ;	SHGFI_PIDL		$8
	   ;	SHGFI_USEFILEATTRIBUTES	$10
	   prm=pss,0,pprmex,8,$100
	   dllproc "SHGetFileInfoA",prm,5,D_SHELL
	   i=prmex
	   ;prm=bmscr.14,pss,pi
	   ;dllprocp pfunc.FNC_ExtractAssociatedIconA,prm,3
	   ;i=dllret
	   ; アイコンをビットマップオブジェクトに変換
	   prm=bmscr.4,iconsize,iconsize
	   dllprocp pfunc.FNC_CreateCompatibleBitmap,prm,3
	   hbmp.curfoldernum.cnt=dllret
	   hdcex.1=dllret
	   dllprocp pfunc.FNC_SelectObject,hdcex,2
	   boxf_ 0,0,iconsize,iconsize,hdcex,hbrush
	   prmex=hdcex,0,0,i,iconsize,iconsize,0,0,3
	   dllprocp pfunc.FNC_DrawIconEx,prmex,9
	   ; 後始末
	   dllprocp pfunc.FNC_DestroyIcon,i,1
	   hdcex.1=hbmpblank
	   dllprocp pfunc.FNC_SelectObject,hdcex,2
	  }
	  ; メニュー項目追加
	  strlen i,s :strmid s,s,0,i-4
	  imenu s,curfoldernum+1*filemax+cnt,hbmp.curfoldernum.cnt,0,hmenu.curfoldernum
	  if curfoldernum=0 :imenu s,curfoldernum+1*filemax+cnt,hbmp.curfoldernum.cnt,0,hmenu_ex
	 loop

	loop

	; 設定メニューを作成
	;  (1)
	dllprocp pfunc.FNC_CreatePopupMenu,prm
	hmenu_setting1=dllret
	imenu "16×16 (以降、単位は全て pixel)\t[メニューアイコン]",102,0,0,hmenu_setting1
	imenu "24×24",103,0,0,hmenu_setting1
	imenu "32×32",104,0,0,hmenu_setting1
	imenu "48×48",106,0,0,hmenu_setting1
	imenu "64×64",108,0,0,hmenu_setting1
	imenu "96×96",112,0,0,hmenu_setting1
	imenu "",0,0,0,hmenu_setting1
	imenu "↑メニューアイコンに合わせる\t[アプリアイコン]",113,0,0,hmenu_setting1
	imenu "16×16",115,0,0,hmenu_setting1
	imenu "24×24",116,0,0,hmenu_setting1
	imenu "32×32",117,0,0,hmenu_setting1
	imenu "48×48",119,0,0,hmenu_setting1
	imenu "64×64",121,0,0,hmenu_setting1
	imenu "96×96",125,0,0,hmenu_setting1
	imenu "|",0,0,0,hmenu_setting1
	imenu "0　[メイン画面の枠幅]",130,0,0,hmenu_setting1
	imenu "1",131,0,0,hmenu_setting1
	imenu "2",132,0,0,hmenu_setting1
	imenu "3",133,0,0,hmenu_setting1
	imenu "4",134,0,0,hmenu_setting1
	imenu "6",136,0,0,hmenu_setting1
	imenu "8",138,0,0,hmenu_setting1
	imenu "",0,0,0,hmenu_setting1
	imenu "1　[アプリアイコンの間隔]",141,0,0,hmenu_setting1
	imenu "2",142,0,0,hmenu_setting1
	imenu "3",143,0,0,hmenu_setting1
	imenu "4",144,0,0,hmenu_setting1
	imenu "6",146,0,0,hmenu_setting1
	imenu "7",147,0,0,hmenu_setting1
	imenu "",0,0,0,hmenu_setting1
	imenu "画面枠色の変更",150,0,0,hmenu_setting1
	imenu "",0,0,0,hmenu_setting1
	imenu "メイン画面を最小化",148,0,0,hmenu_setting1
	imenu "メイン画面を常に最前面表示",149,0,0,hmenu_setting1
	;  (2)
	dllprocp pfunc.FNC_CreatePopupMenu,prm
	hmenu_setting2=dllret
	imenu "表示しない\t[マウスで画面端をポイントした際にメニューを...]",'n'+70,0,0,hmenu_setting2
	imenu "表示する",166,0,0,hmenu_setting2
	imenu "クリックした時のみ表示する",165,0,0,hmenu_setting2
	imenu "",0,0,0,hmenu_setting2
	imenu "上端で表示\t[↑どの画面端で表示するか]",'u'+70,0,0,hmenu_setting2
	imenu "右端で表示",'r'+70,0,0,hmenu_setting2
	imenu "下端で表示",'d'+70,0,0,hmenu_setting2
	imenu "左端で表示",'l'+70,0,0,hmenu_setting2
	;  チェックマークを付す
	mii.1=1 :mii.3=8
	if iconsize\8=0 :setmii hmenu_setting1,iconsize/8+100
	if synciconsize  :setmii hmenu_setting1,113 :else {
	 if sysiconsize\8=0 :setmii hmenu_setting1,sysiconsize/8+113
	}
	if mg_girth<8 :setmii hmenu_setting1,mg_girth+130
	if mg<8 :setmii hmenu_setting1,mg+140
	if forelock :setmii hmenu_setting1,149
	gosub *chkmenu_setting2
	; メインメニューにシステム項目を付加
	imenu "",0,0,0,hmenu
	imenu "見た目の設定",0,0,hmenu_setting1,hmenu
	imenu "機能の設定",0,0,hmenu_setting2,hmenu
	imenu "ルートフォルダを開く",10,0,0,hmenu
	imenu "説明書を見る",3,0,0,hmenu
	exist_ extfile
	if stat>0 :imenu "拡張機能",4,0,0,hmenu
	imenu "",0,0,0,hmenu
	imenu appname+" の再起動",2,0,0,hmenu
	imenu appname+" の終了",1,0,0,hmenu

	; リンク項目への操作用拡張メニューを作成
	dllprocp pfunc.FNC_CreatePopupMenu,prm
	hmenu_modlink=dllret
	imenu "アプリ登録/削除",20,0,0,hmenu_modlink
	imenu "アプリ移動(←)",23,0,0,hmenu_modlink
	imenu "アプリ移動(→)",24,0,0,hmenu_modlink
	imenu "",0,0,0,hmenu_modlink
	imenu "リンク名の変更",21,0,0,hmenu_modlink
	imenu "リンク先の変更",22,0,0,hmenu_modlink
	imenu "",0,0,0,hmenu_modlink
	imenu "リンク元を開く",18,0,0,hmenu_modlink
	imenu "リンク元フォルダを開く",19,0,0,hmenu_modlink
	mii.1=1 :mii.3=$1000
	setmii hmenu_modlink,18

; アプリの読み込み

	gsel 4
	title appname+"@"+setfile_
	gsel 4,1
	if appnum {
	 prm=0
	 i=appnum :appnum=0
	 repeat i
	  bload setfile,s,512,setmax*4+(cnt*512)
	  dllret=0
	  repeat foldermax
	   i=cnt
	   if hmenu.cnt!0 {
	    notesel filelist.cnt
	    notemax ii
	    repeat ii
	     noteget ss,cnt
	     if s=ss :dllret=i+1*filemax+cnt :break
	    loop
	    if dllret :break
	   }
	  loop
	  if dllret :gosub *modappli
	 loop
	}
	onexit *exit

	ntray
	ttray appvers
	gsel 4,1+forelock
	if minimized :gosub *minimize_


; ―――――――――――――――――――――――――――――――――――――
; 操作待ち
; ―――――――――――――――――――――――――――――――――――――

; いわゆるメインループ

*main
	wait 1
	gm_getmessage msgval
	stick i
	ginfo 2	:prm=-prmx,-prmy
	ginfo	:prm=prm+prmx,prm.1+prmy
	; マウスカーソルが画面端にあり、その他の条件を満たすときメインメニューを表示
	if bandmode='u'&(prmy=0)|(bandmode='r'&(dispx-1=prmx))|(bandmode='l'&(prmx=0))|(bandmode='d'&(dispy-1=prmy))&(i&256!0|noclickpop) :goto *shwsysmenu
	; マウスカーソルの位置に対応した表示
	i.3=prm>=0&(prm-mg_girth<mg_left)&(prm.1>=0)
	i  =prm.1<15&i.3
	i.1=i=0&(prm.1<30)&i.3
	repeat 2
	; 閉じる/最小化ボタン
	if i.cnt!hov.cnt {
	 redraw 2
	 prm=cnt
	 repeat 2
	  if cnt=0 :color cmg_girth&$FF,cmg_girth>>8&$FF,cmg_girth>>16&$FF :else {
	   hov.prm=i.prm
	   if i.prm :color cbtn&$FF,cbtn>>8&$FF,cbtn>>16&$FF :else {
	    color cbtn_shadow&$FF,cbtn_shadow>>8&$FF,cbtn_shadow>>16&$FF
	   }
	  }
	  if prm=1 {
	   pos 5+hovminmzbtn,22+hovminmzbtn
	   line csrx+8,csry
	  } else {
	   pos 2+hovclosebtn,2+hovclosebtn
	   mes "×"
	  }
	 loop
	 redraw 1
	}
	loop
	;  位置がメイン画面内かつアイコン領域内なら i にはアプリアイコン番号が入る
	;  ※ i=0 : arxlc アイコン)
	i=prm-mg_left-mg_girth-mg
	i=minimized=0&(i>0)&(mg_girth+mg<=prm.1)&(mg_girth+mg+sysiconsize>prm.1)&(i\(sysiconsize+mg)<sysiconsize)*(i/(sysiconsize+mg)+1) :i--
	;  アプリアイコン番号が 0 以上アプリ数以下なら
	if i>=0&(i<=appnum) {
	 if i!curappli {
	  gosub *resappli
	  gosub *hovappli
	 }
	} else :gosub *resappli
	; メイン画面への操作に対処
	if msgval=hwnd {
	 ; (プラグインからの要請)
	 if msg=wm_xpi {
	  ; ※ 4byte = 2進法で(8*4=)32桁
	  ; *0 情報取得要請
	  ; *00 設定等の数値情報
	  if wprm&3=0 {
	   wprm=wprm>>2
	   repeat
		prm=-1
		; 情報開始オフセット
		;  数値型情報
		;   arxlc 設定項目内容
		if wprm=0	:prm=32	:break
		;   システム使用メニューのハンドル
		if wprm=1	:prm=64	:break
		;   各カテゴリーメニューのハンドル
		if wprm=2	:prm=80	:break
		;   アプリID
		if wprm=3	:prm=144:break
		;   その他の情報
		if wprm=4	:prm=192:break
		;   ショートカットファイル一覧データへのポインタ
		if wprm=7	:prm=196:break
		;  文字列型情報
		;   ランチャー項目に対応したファイルのフルパス情報
		if wprm=5	:prm=192:break
		;   その他の情報
		if wprm=6	:prm=0  :break
		;   非対応の情報
		if wprm<31	:break
		; 数値型情報
		;  arxlc バージョン番号
		if wprm=31	:prm=appveri :break
		;  arxlc 設定項目内容
		if wprm<64	{
		 wprm-32 :if wprm<setmax_thisver :prm=setting.wprm
		 break		}
		;  システム使用メニューのハンドル
		if wprm<80	{
		 wprm-=64 :if wprm<4 :prm=hmenus.wprm
		 break		}
		;  各カテゴリーメニューのハンドル
		if wprm<144	:wprm-=80 :prm=hmenu.wprm :break
		;  アプリアイコンに対応するメニュー項目のID
		if wprm<192	{
		 wprm-=144 :if wprm<appnum :prm=appid.wprm
		 break		}
		;  その他の情報
		if wprm=192 :prm=hwnd :break
		if wprm=193 :prm=oschk :break
		if wprm=194 :prm=oschk_ :break
		if wprm=195 :prm=curfoldernum :break
		;  ショートカットファイル一覧データへのポインタ
		if wprm<(196+foldermax) {
		 wprm-=196
		 prm=pfilelist.wprm
		 break		}
		break
	   loop
	   prmex=lprm,wm_xpi,prm,0 :dllprocp pfunc.FNC_SendMessageA,prmex,4
	   goto *main
	  }
	  ; *10 ランチャー項目等の文字列情報
	  if wprm&3=2 {
	   wprm=wprm>>2
	   repeat
		s=""
		; 下記以外の情報
		if wprm=0 :s=myself :break
		if wprm=1 :s=appvers :break
		if wprm=2 :s=cmdline :break
		if wprm=3 :s=rootdir :break
		if wprm=4 :s=setfile_:break
		if wprm<192 :break
		; ランチャー項目に対応したファイルのフルパス情報
		; 12480 = (filemax*64+192)
		if wprm<12480 {
		 wprm-=192
		 prm=wprm/filemax-1,wprm\filemax
		 if prm>=0 {
		  notesel filelist.prm
		  noteget s,prm.1
		 }
		}
		break
	   loop
	   prm=lprm,wm_xpi,0,0
	   if s!"" {
	    strlen i,s
	    poke prmex,0,s
	    ; 4byte 単位でデータを送信するので、データ量が 4 で割り切れない時は
	    ; 残りを全て 0 にする。
	    if i\4 :repeat 4-(i\4),i :poke prmex,cnt,0 :loop
	    repeat i/4+(i\4!0)
	     prm.2=prmex.cnt :dllprocp pfunc.FNC_SendMessageA,prm,4
	     wait 1
	    loop
	    prm.2=0
	   }
	   dllprocp pfunc.FNC_SendMessageA,prm,4
	   goto *main
	  }
	  ; *1 情報適用要請
	  ; *01 擬似メニュークリック
	  if wprm&3=1 {
	   wprm=wprm>>2
	   ; *00001
	   if wprm&7=0 :prmex=wprm>>3 :goto *runsysmenu
	   ; *00101
	   ;   ～
	   ; *11101
	   dllret=wprm&7+18
	   i=wprm>>3
	   goto *runextmenu
	  }
	  ; *11 メニューのポップアップと結果送信
	  if wprm&3=3 {
	   wprm=wprm>>2 :prm=0
	   repeat
		;  システム使用メニュー
		if wprm<80	{
		 wprm-=64 :if wprm<4 :prm=hmenus.wprm
		 if wprm=0 :tmenu "(?)",100,hmenu_ex
		 break		}
		;  各カテゴリーメニュー
		if wprm<144	:wprm-=80 :prm=hmenu.wprm :break
		break
	   loop	   
	   if prm {
	    pmenu prm :prm.2=dllret,0
	   } else :prm.2=0,0
	   prm=lprm,wm_xpi
	   dllprocp pfunc.FNC_SendMessageA,prm,4
	   goto *main
	  }
	 }
	 ; (タスクトレイへの操作)
	 if msg=$499&(lprm=$201|(lprm=$205)) {
	  msg=lprm
	  ; 最小化/元に戻す
	  if msg=$201 :hovminmzbtn=1
	  ; メインメニューの表示
	  if msg=$205 {
	   msg=$201
	   if curappli>=0 :gosub *resappli
	   i=0 :gosub *hovappli
	  }
	 }
	 ; クリックされた
	 if msg=$201 {
	  if hovclosebtn:goto *exit
	  if hovminmzbtn:goto *minimize
	  if curappli=0 :goto *shwsysmenu
	  if curappli>0 :i=curappli-1 :dllret=appid.i :goto *exesysmenu
	  repeat 1
	   i=0 :objsend -28,$A1,2,i,0
	   stick i,256
	   if i&256 :continue
	   wait 20
	  loop
	 }	 
	 ; 右クリックされた
	 if msg=$205 {
	  if curappli>=0 {
	   if curappli=0 {
	    tmenu "拡張メニュー",100,hmenu_ex :pmenu hmenu_ex
	    if dllret=101 :dialog "選択した項目についての拡張メニューを表示します。\n拡張メニューでは項目のアプリ登録や削除、プロパティ表示などが行えます。\n\n※アプリ登録された項目はメイン画面に表示され、すばやく起動、操作できるようになります。\n※拡張メニューはメインメニューで項目を [Ctrl] キーを押しながら選択しても表示できます。",0,"拡張メニュー - "+appvers :dllret=0
	    i=dllret
	   } else :i=curappli-1 :i=appid.i
	   if i>0 :goto *shwextmenu
	  }
	 }
	 ; ドラッグ＆ドロップされた
	 if msg=$233 {
	  ; ドラッグ＆ドロップされた位置のアプリを取得
	  if curappli>=0 {
	   ; arxlc アイコン上
	   if curappli=0 {
	    tmenu "アプリの選択",100,hmenu_ex
	    repeat
	     pmenu hmenu_ex,1
	     if dllret=101 :dialog "ドラッグ＆ドロップしたファイルを開くプログラムを選択して下さい。\n\n※プログラム以外を選択すると単にその項目のファイルが開くだけとなります。",0,"アプリの選択 - "+appvers :continue
	     break
	    loop
	   ; その他のアプリアイコン上
	   } else :i=curappli-1 :dllret=appid.i
	   if dllret>0 {
	    gosub *getlink
	    ; 有効なアプリ上にドラッグ＆ドロップされていたらそれに渡すコマンドラインを整備
	    if tmp="EXE" {
	     ; ファイル数を取得
	     prm=wprm,-1,0,0
	     dllprocp pfunc.FNC_DragQueryFileA,prm,4
	     ; ファイル名を取得
	     i=0
	     repeat dllret
	      prm=wprm,cnt,ptmp,512
	      dllprocp pfunc.FNC_DragQueryFileA,prm,4
	      ; ファイル名の加工
	      ;  Windows Me/2000/xp
	      if oschk=2 {
	       tmp="\""+tmp+"\""
	      ;  Windows 95,98,NT4.0
	      } else {
	       prm=ptmp,ptmp,512
	       dllprocp pfunc.FNC_GetShortPathNameA,prm,3
	      }
	      strlen ii,tmp
	      if i+ii>=1023 :break
	      if cnt!0 :s+=" "
	      s+=tmp
	      i+=ii+1
	     loop
	     tmp=""
	    } else :tmp="open"
	    exec_ ss,s
	    ; 処理を完了
	    dllprocp pfunc.FNC_DragFinish,wprm,1
	   }
	  }
	 }
	}
	wait 3
	goto *main


; ―――――――――――――――――――――――――――――――――――――
; 終了時処理
; ―――――――――――――――――――――――――――――――――――――

; 後始末

*exit
	title appname+"@"+setfile_+"(ending)"
	; 各種ハンドルの解放
	;  オブジェクトとメニュー
	repeat curfoldernum
	 if hmenu.cnt {
	  prm=cnt
	  dllprocp pfunc.FNC_DestroyMenu,hmenu.prm,1
	  repeat filemax
	   if hbmp.prm.cnt :dllprocp pfunc.FNC_DeleteObject,hbmp.prm.cnt,1
	  loop
	 }
	loop
	repeat 4 :dllprocp pfunc.FNC_DestroyMenu,hmenus.cnt,1 :loop
	if hdcex	:dllprocp pfunc.FNC_DeleteDC,hdcex,1
	if hbmpfolder	:dllprocp pfunc.FNC_DeleteObject,hbmpfolder,1
	if hbmpblank	:dllprocp pfunc.FNC_DeleteObject,hbmpblank,1
	if hbrush	:dllprocp pfunc.FNC_DeleteObject,hbrush,1
	;  COM 関連
	prm=0,0,2
	if pShellLink	:prm.3=pShellLink	:ll_callfunc prm,4,pCallMethod
	if pPersistFile :prm.3=pPersistFile	:ll_callfunc prm,4,pCallMethod
	if pMalloc	:prm.3=pMalloc		:ll_callfunc prm,4,pCallMethod
	dllproc "CoUninitialize",prm,0,D_OLE
	;  タスクトレイ関連
	ctray
	dllprocp pfunc.FNC_DestroyIcon,hicon,1
	; 設定の保存
	;  hidden フォルダの存在確認
	chdir exedir
	skiperr 1 :chdir setdir
	if err {
	 skiperr 0
	 skiperr 1
	 mkdir setdir
	 if err :end
	}
	skiperr 0
	;  保存の実行
	if oschk_=0 :iconsize=0
	setting=appveri
	setmax=setmax_thisver
	if minimized :gsel 4,1 :dllprocp pfunc.FNC_OpenIcon,hwnd,1
	ginfo 2 :mainx=prmx :mainy=prmy
	bsave setfile,setting,setmax*4
	repeat appnum
	 i=appid.cnt/filemax-1
	 notesel filelist.i
	 noteget s,appid.cnt\filemax
	 bsave setfile,s,512,cnt*512+(setmax*4)
	loop
	if restart :exec "\""+myself+"\" "+cmdline
	end


; ―――――――――――――――――――――――――――――――――――――
; 処理
; ―――――――――――――――――――――――――――――――――――――

; メニューの表示

*shwsysmenu
	pmenu hmenu
	if dllret=0 :goto *main
	; システムメニュー
	prmex=dllret
	goto *runsysmenu

; メニュー項目の実行
;	使用値	prmex	/ 選択されたメニューのID

*runsysmenu
	;  設定
	;   (2)
	if prmex>=165&(prmex<filemax) {
	 ; 既存のチェックマークを全て外す
	 mii.1=1 :mii.3=0
	 setmii hmenu_setting2,bandmode+70
	 setmii hmenu_setting2,165+noclickpop
	 ; 設定
	 repeat
	  if prmex<=166 {
	   if bandmode='n' :bandmode='u'
	   noclickpop=166-prmex=0
	   break
	  }
	  bandmode=prmex-70
	  break
	 loop
	 ; チェックなどの表示状態を更新
	 gosub *chkmenu_setting2
	 goto *main
	}
	;   (1)
	if prmex>=100&(prmex<filemax) {
	 if prmex=148 :goto *minimize
	 if prmex=150 {
	  dialog "",33,"メイン画面の枠色"
	  if stat=1 {
	   cmg_girth=rval+(gval<<8)+(bval<<16)
	   ; 枠色更新
	   redraw 2
	   color rval,gval,bval
	   ginfo 6			; 画面初期化サイズ取得
	   boxf 0,0,prmx,mg_girth-1
	   boxf 0,mg_girth,mg_left+mg_girth-1,prmy-1
	   boxf mg_left+mg_girth,mg*2+mg_girth+sysiconsize+mg_hover,prmx-1,prmy-1
	   boxf winx-mg_girth,mg_girth-1,prmx-1,prmy-mg_girth-1
	   hov=-1,-1
	  }
	  goto *main
	 }
	 ; 選択項目の現在のチェック状況を調べる
	 mii.3=0
	 mii.1=1 :getmii hmenu_setting1,prmex
	 if prmex=149 {
	  mii.3=mii.3&8=0*8
	  setmii hmenu_setting1,149
	  forelock=mii.3&8!0
	  gsel 4,1+forelock
	  goto *main
	 }
	 if mii.3&8 :goto *main
	 ; 設定に変更があったら
	 repeat
	  if prmex<113 {
	   iconsize=prmex-100*8
	   if oschk_=0 :oschk_=oschk
	   break
	  }
	  if prmex=113 :synciconsize=(mii.3^8) :break
	  if prmex<130 :sysiconsize=prmex-113*8 :synciconsize=0 :break
	  if prmex<140 :mg_girth=prmex-130 :break
	  if prmex<148 :mg=prmex-140 :break
	  break
	 loop
	 if prmex=148 :goto *main
	 ; 再起動
	 prmex=2
	}
	;  拡張機能
	if prmex=4 {
	 tmp="" :pidl=0
	 s="run:"+extfile_+",@"+setfile_
	 exec_ myself,s
	 goto *main
	}
	;  arxlc の説明書
	if prmex=3 {
	 exist_ hlpfile
	 if stat>0 :exec hlpfile,16
	 goto *main
	}
	;  arxlc の終了と再起動
	if prmex<=2 :restart=prmex-1 :goto *exit
	;  ルートフォルダを開く
	if prmex=10 :exec rootdir,16 :goto *main
	; ランチャーメニュー
	dllret=prmex
	goto *exesysmenu

; ランチャー項目のクリックに対処
;	使用値	dllret	/ 選択されたメニューのID

*exesysmenu
	; [Ctrl] キーを押しながらだと拡張メニュー表示
	getkey i,17
	if i :i=dllret :goto *shwextmenu
	; リンク元の取得
	gosub *getlink
	; [Shift] キーを押しながらだとフォルダを開く
	getkey i,16
	; 開く
	if tmp="EXE" :tmp="" :else :tmp="open"
	exec_ ss,s
	goto *main

; 拡張メニューの表示
;	使用値	i	/ 拡張メニューを表示するリンクに対応したメインメニューのID

*shwextmenu
	; 表示の準備
	; 選択項目の現在のチェック状況を調べる
	ii=i/filemax-1
	mii.1=1 :getmii hmenu.ii,i
	;  項目がアプリか否かに応じて、[メニュー移動] の使用可否を設定
	mii.3=mii.3&8=0*3
	setmii hmenu_modlink,23
	setmii hmenu_modlink,24
	; 拡張メニューの表示
	pmenu hmenu_modlink
	if dllret=0 :goto *main
	goto *runextmenu

; 拡張メニュー項目の実行
;	使用値	i	/ 拡張メニュー項目を実行するリンクに対応したメインメニューのID
;		dllret	/ 選択されたメニューのID

*runextmenu
	ii=i/filemax-1
	; アプリ登録/削除
	if dllret=20 {
	 dllret=i
	 gosub *resappli
	 gosub *modappli
	 goto *main
	}
	; アプリ移動
	if dllret>22 {
	 ii=-1
	 repeat appnum
	  if appid.cnt=i :ii=cnt :break
	 loop
	 ; (←)
	 if dllret=23 :i=ii+1 :ii=0 :else {
	 ; (→) … if dllret=24
	 i=ii+1 :ii=1 }
	 gosub *movappli :goto *main
	}
	; リンクへの操作
	notesel filelist.ii
	noteget s,i\filemax
	;  リンク元を開く
	if dllret<20 {
	 ; (リンク元ファイルを開く)
	 if dllret=18 {
	  dllret=i :gosub *getlink
	 ; (リンク元フォルダを開く) … if dllret=19
	 } else {
	  dllret=i :gosub *getlink
	  gosub *getfolderlgt
	  strmid ss,ss,0,i
	  tmp=""
	 }
	 if tmp="EXE" :tmp="" :else :tmp="open"
	 exec_ ss,s
	 goto *main
	}
	;  リンク名の変更
	if dllret=21 {
	 prmex.10=i
	 ss="";sdim ss,512 :getptr pss,ss
	 ss=s :s="" ;sdim s,512 :getptr ps,s
	 gosub *getfolderlgt:strlen ii,ss
	 strmid s,ss,0,i	; フォルダパス
	 strmid ss,ss,i,ii-i	; ファイル名(拡張子付き)
	 gosub *getext :i++ :strlen ii,ss
	 strmid tmp,ss,ii-i,i	; 拡張子(.付き)
	 strmid ss,ss,0,ii-i	; ファイル名(拡張子無し)
	 dialoginput ss,"リンク名の変更"
	 if refstr!"" {
	  ss=s+ss+tmp
	  tmp=s+refstr+tmp
	  ; s, ss の内容を一度空にしておかないと誤動作を起こす
	  sdim s ,512 :s =tmp :getptr ps ,s  :tmp=ss
	  sdim ss,512 :ss=tmp :getptr pss,ss
	  ; ファイル名の変更を実行
	  prmex=hwnd,4,pss,ps,$40,pi,0,0
	  dllprocp pfunc.FNC_SHFileOperationA,pprmex,1
	  if dllret=0 {
	   ; 成功したらデータ書き換え
	   i=prmex.10/filemax-1
	   notesel filelist.i
	   noteadd s,prmex.10\filemax,1
	   ; メニュー表示文字列も変更
	   s=refstr
	   tmenu s,prmex.10,hmenu.i
	   if i=0 :tmenu s,prmex.10,hmenu_ex
	   ; アプリ登録されていたらチップヘルプ表示文字列も変更
	   ii=-1
	   repeat appnum
	    if appid.cnt=prmex.10 :ii=cnt :break
	   loop
	   if ii>=0 :apptitle.ii=s :tiphelp s,ii+1
	  }
	 }
	}
	;  リンク先の変更
	if dllret=22 {
	 tmp="properties" :pidl=0
	 ss=""
	 exec_ s,ss
	 goto *main
	}
	goto *main

; 最小化/元に戻す

*minimize
	mii.1=1
	getmii hmenu_setting1,148
	minimized=mii.3&8=0
	gosub *minimize_
	goto *main


; ―――――――――――――――――――――――――――――――――――――
; サブルーチン
; ―――――――――――――――――――――――――――――――――――――

; リンク元の取得
;	前提	このサブルーチンから戻った後 exec_ 命令を実行する必要がある
;	使用値	dllret	/ 元を取得するリンクに対応するメニューID
;	戻り値	ss	/ リンク元ファイル
;		s	/ リンク元ファイルに渡すコマンドライン
;		tmp	/ リンク元ファイルの拡張子
;		pidl	/ ITEMIDLIST へのポインタ(exec_ 用)

*getlink
	i=dllret/filemax-1
	notesel filelist.i
	noteget ss,dllret\filemax
	gosub *getext
	s=""
	if tmp="LNK" {
	 ; COM によるリンク元ファイルの取得
	 uni ss
	 ;  IPersistFile->Load
	 prmex=pss,0
	 prm=pprmex,2,5,pPersistFile
	 ll_callfunc prm,4,pCallMethod
	 ;
	 ;   資料の中にはこの後 Resolve メソッドの実行を必要とする旨の記述があるものもあったが、
	 ;   リンク先ファイルやフォルダが存在するか確認して 存在しない場合は移動先を検索する処理
	 ;   なので、別に無くても良さそう。
	 ;
	 ;  IShellLink->GetPath
	 prmex=pss,512,pprmex,0
	 prm=pprmex,4,3,pShellLink
	 ll_callfunc prm,4,pCallMethod
	 exist_ ss
	 if stat=0 {
	  ;  IShellLink->GetIDList
	  ;
	  ;   ここでシェルによって作成された ITEMIDLIST 構造体のメモリ領域は、
	  ;   サブルーチンから戻った後の exec_ 命令内で解放する。
	  ;
	  prmex=pi
	  prm=pprmex,1,4,pShellLink
	  ll_callfunc prm,4,pCallMethod
	  pidl=i
	  prm=pidl,pss
	  dllprocp pfunc.FNC_SHGetPathFromIDListA,prm,2
	 } else :pidl=0
	 ;  IShellLink->GetArguments
	 prmex=ps,512
	 prm=pprmex,2,10,pShellLink
	 ll_callfunc prm,4,pCallMethod
	 ; リンク元ファイルの拡張子を取得
	 gosub *getext
	} else :pidl=0
	return

; メイン画面の最小化/元に戻す
;	使用値	minimized / 最小化する(1)か否(0)か

*minimize_
	; width (appnum+1*(sysiconsize+mg)+mg+mg_girth+mg_hover)*(minimized=0)+mg_left+mg_girth,mg+mg_girth*2+sysiconsize+mg_hover
	if minimized {
	 dllprocp pfunc.FNC_CloseWindow,hwnd,1
	 gsel 4,-1
	} else {
	 gsel 4,1+forelock
	 dllprocp pfunc.FNC_OpenIcon,hwnd,1
	}
	mii.3=minimized*8
	setmii hmenu_setting1,148
	return

; アプリの登録または解除
;	使用値	dllret	/ 登録または解除するアプリに対応するメニューID

*modappli
	redraw 2
	; 情報取得
	i=dllret/filemax-1 :ii=dllret
	prm=hmenu.i,ii
	mii.1=1 :getmii prm,prm.1
	; 登録解除
	if mii.3&8 {
	 ; 残っているデータとチップヘルプを左にシフト
	 repeat appmax
	  if appid.cnt=ii :prmex.10=cnt :break
	 loop
	 tiphelp "",appnum
	 appnum--
	 repeat appnum-prmex.10,prmex.10
	  ii=cnt+1
	  appid.cnt=appid.ii
	  apptitle.cnt=apptitle.ii
	  tiphelp apptitle.cnt,cnt+1
	 loop
	 ; アプリアイコンも左にシフト
	 pos prmex.10+1*(sysiconsize+mg)+mg_girth+mg_left,mg_girth
	 gcopy 4,prmex.10+2*(sysiconsize+mg)+mg_girth+mg_left,mg_girth,appnum-prmex.10*(sysiconsize+mg)+mg+mg_girth+mg_hover,winy-mg_girth
	 mii.3-=8
	; 登録
	} else {
	 appid.appnum=ii
	 notesel filelist.i
	 ii=ii\filemax
	 noteget ss,ii
	 boxf_ appnum+1*(sysiconsize+mg)+mg+mg_girth+mg_left,mg_girth,appnum+2*(sysiconsize+mg)+mg_left+mg+mg_hover+mg_girth,winy-mg_girth,hdc,hbrush
	 prmex=appnum+1*(sysiconsize+mg)+mg+mg_left+mg_girth,mg+mg_girth
	 ; アプリアイコンの描画
	 if oschk_ {
	  bitbltex bmscr.4,0,0,iconsize,iconsize,hbmp.i.ii,1
	  pos prmex,prmex.1
	  gzoom sysiconsize,sysiconsize,3,0,0,iconsize,iconsize
	 } else {
	  prmex.2=hdc,pss,pi
	  dllprocp pfunc.FNC_ExtractAssociatedIconA,prmex.2,3
	  if dllret {
	   i=dllret
	   prmex.2=hdc,prmex,prmex.1,i,sysiconsize,sysiconsize,0,0,3
	   dllprocp pfunc.FNC_DrawIconEx,prmex.2,9
	   dllprocp pfunc.FNC_DestroyIcon,i,1
	  }
	 }
	 ; 影の描画
	 color col,col.1,col.2
	 line prmex,prmex.1+sysiconsize,prmex+sysiconsize,prmex.1+sysiconsize
	 line prmex+sysiconsize,prmex.1,prmex+sysiconsize,prmex.1+sysiconsize
	 ; チップヘルプ登録
	 gosub *getfolderlgt
	 strlen ii,ss
	 strmid ss,ss,i,ii-i
	 gosub *getext
	 strlen ii,ss
	 strmid apptitle.appnum,ss,0,ii-i-1
	 tiphelp apptitle.appnum,appnum+1
	 ; アプリ登録完了！
	 appnum++
	 mii.3+=8
	}
	width appnum+1*(sysiconsize+mg)+mg+mg_girth+mg_hover+mg_left+mg_girth,mg+mg_girth*2+sysiconsize+mg_hover
	; width (appnum+1*(sysiconsize+mg)+mg+mg_girth+mg_hover)*(minimized=0)+mg_left+mg_girth,mg+mg_girth*2+sysiconsize+mg_hover
	setmii prm,prm.1
	if prm=hmenu :setmii hmenu_ex,prm.1
	redraw 1
	return

; アプリアイコンを移動する
;	使用値	i	/ 移動するアプリアイコンの番号(1-)
;		ii	/ 移動の向き(0=左,1=右)

*movappli
	if 2-ii>i|(appnum-ii<i) :return
	gosub *resappli
	redraw 2
	i--
	ii=ii*2-1
	; 移動元アイコンを一時退避
	gsel 3
	prm=i+1*(sysiconsize+mg)+mg+mg_left+mg_girth,mg+mg_girth
	gcopy 4,prm,prm.1,sysiconsize,sysiconsize
	; 移動先アイコンを移動元の位置に持ってくる
	gsel 4
	pos prm,prm.1
	gcopy 4,ii*(mg+sysiconsize)+prm,prm.1,sysiconsize,sysiconsize
	; 退避しておいた移動元アイコンを移動先の位置に持ってくる
	pos ii*(mg+sysiconsize)+prm,prm.1
	gcopy 3,0,0,sysiconsize,sysiconsize
	; メニューIDの入れ替え
	ii+=i
	prmex		= appid.i
	s		= apptitle.i
	appid.i		= appid.ii
	apptitle.i	= apptitle.ii
	appid.ii	= prmex
	apptitle.ii	= s
	; チップヘルプの登録
	tiphelp apptitle.i,i+1
	tiphelp apptitle.ii,ii+1
	redraw 1
	return

; アプリアイコンをアクティブにする(mg_hoverだけ右下に移動表示)
;	使用値	i	/ アクティブにするアプリアイコンの番号(1-)
;	戻り値	curappli/ アクティブなアプリアイコンの番号

*hovappli
	prm=i*(sysiconsize+mg)+mg+mg_left+mg_girth,mg+mg_girth
	redraw 2
	pos prm+mg_hover,prm.1+mg_hover
	gcopy 4,prm,prm.1,sysiconsize,sysiconsize
	color col,col.1,col.2
	line prm,prm.1-1,prm,prm.1+sysiconsize
	line prm,prm.1,prm+sysiconsize,prm.1
	curappli=i
	redraw 1
	return

; アクティブだったアプリアイコンを元に戻す
;	使用値	curappli/ アクティブなアプリアイコンの番号
;	戻り値	curappli/ -1

*resappli
	if curappli>=0 {
	 redraw 2
	 prm=curappli*(sysiconsize+mg)+mg+mg_left+mg_girth,mg+mg_girth
	 pos prm,prm.1
	 gcopy 4,prm+mg_hover,prm.1+mg_hover,sysiconsize,sysiconsize
	 color col,col.1,col.2
	 line prm,prm.1+sysiconsize,prm+sysiconsize,prm.1+sysiconsize
	 line prm+sysiconsize,prm.1,prm+sysiconsize,prm.1+sysiconsize
	 curappli=-1
	 redraw 1
	}
	return

; [機能の設定] メニューにチェックを付ける
;	前提	mii.1=1, mii.3=8
;	使用値	bandmode, noclickpop

*chkmenu_setting2
	mii.3=8
	setmii hmenu_setting2,bandmode+70
	if bandmode!'n' {
	 setmii hmenu_setting2,165+noclickpop
	 mii.3=bandmode='u'*8 :setmii hmenu_setting2,'u'+70
	 mii.3=bandmode='r'*8 :setmii hmenu_setting2,'r'+70
	 mii.3=bandmode='d'*8 :setmii hmenu_setting2,'d'+70
	 mii.3=bandmode='l'*8 :setmii hmenu_setting2,'l'+70
	} else {
	 mii.3=3
	 setmii hmenu_setting2,'u'+70
	 setmii hmenu_setting2,'r'+70
	 setmii hmenu_setting2,'d'+70
	 setmii hmenu_setting2,'l'+70
	}
	return

; ファイル名中のルートフォルダパス長を取得
;	使用値	ss	/ ファイル名
;	戻り値	i	/ フォルダパス長

*getfolderlgt
	i=0
	repeat
	 instr ii,ss,"\\",i
	 if ii=-1 :break
	 i+=ii+1
	loop
	return

; ファイルの拡張子を取得する
;	使用値	ss	/ ファイル名
;	戻り値	tmp	/ 拡張子代入先
;		i	/ 拡張子長

*getext
	i=0
	repeat
	 instr ii,ss,".",i
	 if ii=-1 :break
	 i+=ii+1
	loop
	strlen ii,ss
	strmid tmp,ss,i,ii-i
	strlen i,tmp
	repeat i,0
	 peek ii,tmp,cnt
	 if (ii>='a')&(ii<='z') :ii-=32
	 poke tmp,cnt,ii
	loop
	return


; ―――――――――――――――――――――――――――――――――――――
; (C) arc＠arcis 2004
; arX Launcher 特設サイト ＠ http://hp.vector.co.jp/authors/VA022483/arxlc/?
