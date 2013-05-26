
; ■ hdtp.as		 HSP Data Transfer Protocol 子プログラム用モジュール
;							 最終更新日 04/09/25
; ―――――――――――――――――――――――――――――――――――――

/*

 普遍性を感じさせるモジュール名ながら、arX Launcher 専用です(殴

 もう少し頑張れば、一般化して色々なHSP製プログラム間での
 データのやり取りに使えるようになりそうな気もします。

 arc＠arcis の前作 arX MusicPlayer にも HSP を利用したプラグイン機能は
 ありましたが、初期化処理のみならず終了時処理が必要だったり メモリ領域
 を共有したり、内部処理が複雑に過ぎた気がします。
 かと言って arXmp の場合、arxlc のように SendMessageA を利用して再生リ
 ストを送信したら場合によってはものすごい時間がかかりますし、 きっとあ
 れはあれでよかったんだと思います。うん。

 勝手に納得してしまいました。

 さて、では各命令の解説です。

 □ hdtp_init

	arxlc が起動しているか確認します。
	stat が 0 より小さければ以降の命令は使用できません。
	詳しくは、

		stat :	-1	起動していない
			-2	終了処理中である

	ということを意味します。

	※ 以降の命令を実行する前に必ず一回実行してください。
	※ この命令を実行する前に

		; hdtp.as 用の定義
		#const	global	wm_xpi	$500
		#define	global	clsname	"oniwnd1"
		#define	global	appname	"arxlc"
		setfile=cmdline

	というスクリプトを書いておく必要があります。

	※ プラグインとして起動された場合、コマンドライン(cmdline)には

		"@(設定ファイル名)"

	という文字列が入っており、これは呼び出し元の arxlc を
	識別するために用いられます。
	上で setfile=cmdline としているのはこのためであり、
	hdtp.as 内ではこの変数 setfile の中身から呼び出し元の arxlc を
	識別しているので、hdtp.as を使ってプラグインを開発する際は、
	起動オプション ([HSP(P)] - [起動オプション]) に

		@arxlc.dat

	と指定するか、

		setfile=cmdline

	の行を

		setfile="@arxlc.dat"

	として下さい。
	ただし、後者の場合は最終的にコンパイルする前に setfile=cmdline
	に戻すのを忘れないようにご注意下さい。

 □ hdtp_req (数値型変数),type

	type で指定された種類の情報を数値型変数に代入します。

 type	取得できる情報
 ￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣
 0	arxlc 設定内容を取得する際 infotype に指定すべき値。		 ①
	いわゆるオフセット。構造体へのポインタのようなもの(全然違う気もする)。
 1	arxlc のシステムが使用するメニューのハンドル取得用オフセット	 ②
 2	arxlc カテゴリーメニューのハンドル取得用オフセット		 ③
 3	各アプリに対応するメニューID取得用オフセット			 ④
 7	ショートカットファイル一覧のデータへのポインタ取得用オフセット	 ⑧
 4	その他の情報取得用オフセット					 ⑤
 (↑ここまで数値型情報のオフセット)
 5	各ランチャー項目に対応したファイルのフルパス情報取得用オフセット ⑥
 6	その他の情報取得用オフセット					 ⑦
 (↑ここまで文字列型情報のオフセット)
 (以降は実情報が取得される。①～⑤には↑で取得したオフセット値を代入する。)
 31	arxlc バージョン番号 (990など)
 ①	前回 arxlc が起動した際の arxlc バージョン番号
 ①+1	前回 arxlc が終了した際保存された設定項目の数
 ①+2	前回 arxlc が終了した時のメイン画面位置(Ｘ座標)
 ①+3	　　　　　　　　〃　　　　　　　　　　 (Ｙ座標)
 ①+4	メニューアイコンの大きさ
 ①+5	アプリアイコンの大きさ
 ①+6	↑をメニューアイコンの大きさに合わせる(1)か否(0)か
 ①+7	画面端にマウスカーソルが来た際メニューを表示する(※)か否('n')か
	※ 'u' 上端, 'r' 右端, 'd' 下端, 'l' 左端
 ①+9	画面端で、クリック無しでメニューを表示する(1)か否(0)か
 ①+10	メイン画面枠幅
 ①+11	アプリアイコンの間隔
 ①+12	メイン画面が最小化されている(1)か否(0)か
 ①+13	メイン画面が最前面表示されている(1)か否(0)か
 ①+15	現在アプリ登録されているランチャー項目の数
 ②	プログラムアイコンが右クリックされたり、ファイルやフォルダのドラッグ
	＆ドロップ先だった時に表示される拡張メニュー表示用メニューのハンドル
 ②+1	拡張メニューのハンドル
 ②+2	「見た目の設定」メニューのハンドル
 ②+3	「機能の設定」メニューのハンドル
 ③+idx	idx(0～)個目に検索したフォルダ内のサブフォルダ及びファイルリストを表
	示するメニューのハンドル。0 ならメインメニューのハンドルを取得する。
 ④+id	id+1 番目のアプリに対応したメニュー項目のID
 ⑤	メイン画面のハンドル
 ⑤+1	OS種別 (0=Windows95,NT4.0, 1=98, 2=Me,xp)
 ⑤+2	メニューにアイコンを表示する(0より大)か否(0)か
 ⑤+3	検索したフォルダの個数
 ⑧+idx	idx(0～)個目に検索したフォルダ内の、 ショートカットファイル一覧データ
	へのポインタ。利用例は sample_06.as をご覧下さい。    [hdtp.as 9.93-]

 メニューのハンドルは取得したところであんまり意味がない気もします(^^;

 □ hdtp_req (文字列変数),type

	type で指定された種類の情報を文字列型変数に代入します。

 type	取得できる情報
 ￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣
 ⑥+id	メニューIDが id の項目に対応するショートカットのフルパスを取得。
	id は (そのメニューが属するフォルダ番号)*192 + (フォルダ内での順番)
	というふうに決まっている。
	フォルダ番号は 1 から最大 64 まで。順番は 0 から最大 191 まで。
 ⑦	arxlc 本体(arxlc.exe)のフルパス
 ⑦+1	arxlc のバージョン
 ⑦+2	arxlc の起動オプション(cmdline)
 ⑦+3	arxlc のルートフォルダ(通常は exedir)		    [hdtp.as 9.92-]
 ⑦+4	arxlc の設定ファイル(通常は "arxlc.dat")	    [hdtp.as 9.92-]

 □ hdtp_func func,type

	func で指定された種類の機能を実行します。
	arxlc はメインメニューの該当項目をクリックした際と同じ挙動をします。

 func	機能
 ￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣
 arxlc.as 1237行以降の *runsysmenu を参照して下さい。
 例えば

 1	ランチャーの終了
 2	ランチャーの再起動
 3	ランチャーの説明書(readme.html)を表示
 4	拡張機能を表示(plus.xpi を起動)
 192～	このメニューIDに対応するランチャー項目を起動

 等のようになっています。
 sample_03.as で活用例を確認できます。

 尚、hdtp.as 9.92 以上では func がランチャー項目に対応するIDの場合のみ、
 type に以下の数値を指定することで、その項目の拡張メニューをクリックした
 際の機能を実行できます。

 type	機能
 ￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣
 0	リンク元を開く(type を指定しないときの動作と同じ)
 1	リンク元フォルダを開く
 2	アプリ登録/削除
 3	アプリ移動(←)(項目がアプリ登録されているときのみ有効)
 4	アプリ移動(→)(　　　　　　　　　〃　　　　　　　　　)
 5	リンク名の変更
 6	リンク先の変更(プロパティの表示)

 □ hdtp_menu id

	id で指定されたメニューを表示し、選択結果を stat に返します。

 id	表示されるメニュー
 ￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣
 ②	プログラムアイコンが右クリックされたり、ファイルやフォルダのドラッグ
	＆ドロップ先だった時に表示される拡張メニュー表示用メニュー
 ②+1	拡張メニュー
 ②+2	「見た目の設定」メニュー
 ②+3	「機能の設定」メニュー
 ③+idx	idx 個目に検索したフォルダ内のサブフォルダ及びファイルリストを表示す
	るメニュー。0 ならメインメニュー。

 ※②,③は hdtp_req と共通

 stat	選択結果
 ￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣￣
 0	キャンセル
 後は arxlc.as の中をご覧下さい(超手抜き(殴)。

 sample_03/04.as で活用例を確認できます。

*/

	; 親プログラムとの通信に利用するメッセージID (WM_USER=$400 以上)
	; ※親プログラム側の設定と共通
	;	#const	global	wm_xpi	$500
	; 親プログラムのメイン画面のクラス名
	;	#define	global	clsname	"oniwnd1"
	; 親プログラムのメイン画面のタイトル(キャプション)
	;	#define	global	appname	"arxlc"

	; hsgetmsg.as が #include されていない場合に備えて
	#ifndef get_message

		#uselib "hsgetmsg.dll"
		#func gm_setwndproc	gm_setwndproc	$202
		#func gm_setmessage	gm_setmessage	$202
		#func gm_getmessage	gm_getmessage	$202
		;dim msgval,16

	#endif

	; llmod.as が #include されていない場合に備えて
	#ifndef dllproc
	ll_retset dllret
	ll_libload D_USER,"user32"
	ll_getproc FNC_SendMessageA,"SendMessageA",D_USER
	#module

		; エセ dllproc (本家 dllproc と微妙に互換)
		; ※ stat に結果が返らない、エラーダイアログが表示されない差異有り
		#deffunc dllproc str,val,int,int
		mref funcname,32 :mref prms,17 :mref prm_n,2 :mref dll_no,3
		ll_getproc func,funcname,dll_no
		ll_callfunc prms,prm_n,func :return

		; エセ sendmsg 
		; ※ stat には結果が返らない
		#deffunc sendmsg val
		mref prms,16 :ll_callfunc prms,4,FNC_SendMessageA@ :return

		; 本家 getptr 互換
		#deffunc getptr val,val
		mref ptr,16 :mref pval,1025
		if (pval&$FFFF=2) :mref var,25 :else :mref var,17
		ll_getptr var :ptr=dllret@ :return

	#global
	#endif

	; hdtp モジュール
	#module "hdtp"

		#deffunc hdtp_init
		; 変数の初期化
		if hdtp_init_ {
		 mref bmscr,67
		 mref stt,64
		 sdim s ,512
		 sdim ss,512
		 getptr ps,s
		 getptr pss,ss
		}
		; arxlc ウィンドウの検索
		s =clsname
		ss=appname+setfile@
		prm=ps,pss
		hwnd=0
		repeat 2
		 dllproc "FindWindowA",prm,2,D_USER@
		 if dllret@ {
		  if cnt=0 :hwnd=dllret@ :ss+="(ending)"
		  if cnt=1 :hwnd=0:stt=-2 :break
		 } else :if cnt=0 :stt=-1 :break
		loop
		if hwnd=0 :return
		; メッセージ取得のための準備
		if hdtp_init_ {
		 gm_setwndproc@ bmscr.13
		 gm_setmessage@ bmscr.13,wm_xpi
		 hdtp_init_=0
		}
		stt=0
		return

		#deffunc hdtp_req val,int
		; 取得する情報の種類を特定
		mref pval,1024 :mref infotype,1
		prm=hwnd,wm_xpi,0,bmscr.13
		;  文字列型情報
		if pval&$FFFF=2 {
		 prm.2=infotype<<2+2
		 sdim data,1024
		 mref var,24
		 i=0
		;  数値型情報
		} else {
		 prm.2=infotype<<2
		 mref var,16
		}
		; 情報取得要請メッセージを送信
		sendmsg prm
		; 返信されてくる情報を取得
		repeat
		 gm_getmessage@ msgval@
		 if msgval@=bmscr.13&(msgval@.1=wm_xpi) {
		  ; 文字列型情報の取得
		  if pval&$FFFF=2 {
		   if msgval@.2=0 :var=data :sdim data,64 :break
		   wpoke data,i,msgval@.2&$FFFF	:i+=2
		   wpoke data,i,msgval@.2>>16	:i+=2
		  ; 数値型情報の取得
		  } else {
		   var=msgval@.2 :break
		  }
		 }
		 wait 1
		loop
		stt=0
		return

		#deffunc hdtp_func int,int
		mref funcid
		mref type,1
		prm=hwnd,wm_xpi,0,bmscr.13
		prm.2=funcid<<5+(type<<2)+1
		sendmsg prm
		stt=0
		return

		#deffunc hdtp_menu int
		mref id
		prm=hwnd,wm_xpi,0,bmscr.13
		prm.2=id<<2+3
		sendmsg prm
		repeat
		 gm_getmessage@ msgval@
		 if msgval@=bmscr.13&(msgval@.1=wm_xpi) :stt=msgval@.2 :break
		 wait 1
		loop
		return

	#global
	mref stt@hdtp,64
	hdtp_init_@hdtp=1


; ―――――――――――――――――――――――――――――――――――――
; (C) arc＠arcis 2004
; arX Launcher 特設サイト ＠ http://hp.vector.co.jp/authors/VA022483/arxlc/?
