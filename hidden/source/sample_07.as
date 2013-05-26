
; ■ arX Launcher 10.0x	連携プログラムのサンプル (7)
#define apptitle	"arXmp Controller"
;							 最終更新日 04/09/25
; ―――――――――――――――――――――――――――――――――――――

; arxmp を制御します。
; 全然 arxlc と連携してません。こんなのもアリです。

; ※ 拡張機能から起動すると音楽を [再生] します。
;    ショートカットのコマンドラインに
;	"C:\...\arxlc.exe" run:hidden\sample_07.xpi,prev
;    などと指定することで他の機能を利用できます。

; ※ mbmod.as は arc＠arcis のサイト内で配布しています。
; 04/09/23 の時点での最新版は
;	http://www.prenavi.net/~arcis/data/?mbmod.lzh

	; hdtp.as をミニ llmod.as として利用
	; (hdtp_*** による連携機能は不使用)
	#include "hdtp.as"
	; mbmod.as 用に少し拡充
	ll_libload D_KERNEL,"kernel32"

	; mbmod.as は arxmp とのデータ通信に使用
	; (詳細は arxmp 開発者用ページを参照して下さい)
	#include "mbmod.as"
	#define global xpi_playerinfo	"xmp400_info"
	#const global xpimsg_command	$504

	; arxmp の情報を取得
	sdim info,1024
	sdim s,512 :sdim ss,512
	mbload xpi_playerinfo,info
	if stat=2 {
	 dialog "arX MusicPlayer が起動していません。",0,apptitle
	 end
	}
	notesel info
	notemax i
	repeat i
	 noteget s,cnt
	 strmid ss,s,0,8
	 if ss="syshwnd=" {
	  strlen i,s
	  strmid s,s,8,i-8
	  break
	 }
	loop
	syshwnd=s :int syshwnd

	; arxmp に命令を送信
	;	#const menuFunc			700
	;	;   音楽再生
	;	#const objMusic_Play		8
	;	#const objMusic_PlayPrev	9
	;	#const objMusic_PlayNext	10
	;	#const objMusic_Pause		11
	;	#const objMusic_Stop		12
	prm=syshwnd,xpimsg_command,700,bmscr@hdtp.13
	repeat
	 if cmdline="prev"	:prm.2+=9	:break
	 if cmdline="next"	:prm.2+=10	:break
	 if cmdline="pause"	:prm.2+=11	:break
	 if cmdline="stop"	:prm.2+=12	:break
	 prm.2+=8 ;="play"
	 break
	loop
	sendmsg prm
	end
	

; ―――――――――――――――――――――――――――――――――――――
; (C) arc＠arcis 2004
; arX Launcher 特設サイト ＠ http://hp.vector.co.jp/authors/VA022483/arxlc/?
