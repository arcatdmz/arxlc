
; ■ arX Launcher 10.0x	連携プログラムのサンプル (3)
;							 最終更新日 04/09/19
; ―――――――――――――――――――――――――――――――――――――

; メインメニューを表示して、選択された項目についての説明を表示します。
; 更にダイアログを表示し、許可された場合はその項目の機能を実行します。

; sample_02.as の「何故 113+(72/8) なのか？」については 40 行をご覧下さい。

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
	gsel 0,1

	; メインメニューを表示してみる
	hdtp_req ③,2
	hdtp_menu ③

	; 選択結果に応じた処理をしてみる
	funcid=stat
	pos 5,5
	mes "選択されたメニューのID: "+funcid
	repeat
	 if funcid=0	:mes "何も選択されませんでした。"	:break
	 if funcid=1	:mes "ランチャーは終了されます。"	:break
	 if funcid=2	:mes "ランチャーは再起動されます。"	:break
	 if funcid=3	:mes "ランチャーの説明書を表示します。"	:break
	 if funcid=4	:mes "拡張機能のリストを表示します。"	:break
	 if funcid=10	:mes "ルートフォルダを開きます。"	:break
	 if funcid<113	{
	  mes "メニューアイコンの大きさが変更されます。"
	  i=funcid-100*8
	  mes "変更後の大きさ ... "+i+"px 四方"
	  break
	 }
	 if funcid=113	:mes "アプリアイコンとメニューアイコンの大きさを合わせる設定が変更されます。" :break
	 if funcid<130	{
	  mes "アプリアイコンの大きさが変更されます。"
	  mes "メニューアイコンの大きさに合わせる設定も解除されます。"
	  i=funcid-113*8
	  mes "変更後の大きさ ... "+i+"px 四方"
	  break
	 }
	 if funcid<140	{
	  mes "メイン画面の枠幅が変更されます。"
	  i=funcid-130
	  mes "変更後の枠幅 ... "+i+"px"
	  break
	 }
	 if funcid<148	{
	  mes "アプリアイコン同士の間隔が変更されます。"
	  i=funcid-140
	  mes "変更後の間隔 ... "+i+"px"
	  break
	 }
	 if funcid=148	:mes "ランチャーの最小化表示を切り替えます。" :break
	 if funcid=149	:mes "ランチャーの最前面表示を切り替えます。" :break
	 if funcid=150	:mes "メイン画面の枠の色を変更します。"
	 if funcid=165	:mes "マウスカーソルが画面端に来たときにメニューを表示するようにします。\n更にクリックしないとメニューが表示されない設定です。" :break
	 if funcid=166	:mes "マウスカーソルが画面端に来たときにメニューを表示するようにします。" :break
	 ; ↓70+'d', 70+'l', 70+'n', 70+'r', 70+'u'
	 if funcid=170	:mes "マウスカーソルが画面下端に来たときにメニューを表示します。" :break
	 if funcid=178	:mes "マウスカーソルが画面左端に来たときにメニューを表示します。" :break
	 if funcid=180	:mes "マウスカーソルが画面端に来てもメニューを表示しないようにします。" :break
	 if funcid=184	:mes "マウスカーソルが画面右端に来たときにメニューを表示します。" :break
	 if funcid=187	:mes "マウスカーソルが画面上端に来たときにメニューを表示します。" :break
	 if funcid>=192 {
	  mes "選択されたのはランチャー項目です。"
	  ; ランチャー項目のフルパスを取得、表示してみる
	  sdim path,512
	  hdtp_req ⑥,5
	  hdtp_req path,⑥+funcid
	  mes "フルパス ... "+path
	  break
	 }
	 break
	loop

	; 実際に選択された項目を実行してみる？
	dialog "選択された項目の機能を実行しますか？\n\n(設定項目が選択された場合は設定が変更されます。)",2
	if stat=6 :hdtp_func funcid
	stop


; ―――――――――――――――――――――――――――――――――――――
; (C) arc＠arcis 2004
; arX Launcher 特設サイト ＠ http://hp.vector.co.jp/authors/VA022483/arxlc/?
