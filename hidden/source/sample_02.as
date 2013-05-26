
; ■ arX Launcher 10.0x	連携プログラムのサンプル (2)
;							 最終更新日 04/09/19
; ―――――――――――――――――――――――――――――――――――――

; アプリアイコンの大きさを 72×72 にして終了します。

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

	; アプリアイコンのサイズを 72×72 にしてみる
	; 何故 113+(72/8) なのか？については次のサンプル(sample_03.as)をご覧下さい。
	hdtp_func 113+(72/8)

	; ちなみに、sample_03.as をご覧頂ければ分かることですが...

	; ↓メニューアイコンのサイズを 64×64 にしてみる
	; hdtp_func 100+(64/8)
	; ↓メイン画面の枠幅を 5 にしてみる
	; hdtp_func 130+5
	; ↓アプリアイコンの間隔を 7 にしてみる
	; hdtp_func 140+7

	; なんてことも出来ます。

	; 尚、上記の設定を変更する過程ではランチャーが再起動するので、
	; 幾種もの設定を変更するには、その都度 hdtp_init を実行して
	; ランチャーとの情報のやり取りを初期化する必要があります。

	; また、常識外れなサイズにするにはコマンドラインを指定して
	; ランチャーを再起動する必要があるのですが、
	; その方法については sample_05.as で。

	end


; ―――――――――――――――――――――――――――――――――――――
; (C) arc＠arcis 2004
; arX Launcher 特設サイト ＠ http://hp.vector.co.jp/authors/VA022483/arxlc/?
