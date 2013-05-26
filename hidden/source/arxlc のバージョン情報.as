
; ■ arX Launcher のバージョン情報を表示
;							 最終更新日 04/09/19
; ―――――――――――――――――――――――――――――――――――――

	; hdtp.as 用の定義
	; (arxlc との間でデータのやり取りをする際は下記の値で固定)

	#const	global	wm_xpi	$500
	#define	global	clsname	"oniwnd1"
	#define	global	appname	"arxlc"
	setfile=cmdline

	; 命令拡張

	#include "hdtp.as"
	hdtp_init
	if stat<0 {
	 dialog "arX Launcher が起動していません。\nプラグインを終了します。"
	 end
	}

	; sin/cos テーブル構築
	; ※ コアとなるマクローリン展開まわりの処理は、
	;　　sprocket さんのサイトから転用させて頂きました。
	; ※ 遊び(見た目的演出)のための準備です。
	; ※ 分からなくても気にしないようにしましょう(笑)
	; ※ arc＠arcis も実のところよくわかっていません(殴)

	; sin.i  ⇒  1024*sin(2π*i/1024)
	; cos.i  ⇒  1024*cos(2π*i/1024)

	dim sin,1025
	dim cos,1025
	cos.0    =  1024
	sin.256  =  1024
	cos.512  = -1024
	sin.768  = -1024
	cos.1024 = 1024

	repeat 256
	 ; θ[rad]
	 θ = cnt << 23 / 166886
	 ; sin(*1024)
		; sinθ		= (マクローリン展開)
		sin.cnt = θ*θ>>10*θ>>13/3*θ>>15*θ>>17/5+θ-(θ*θ>>10*θ>>17/3)-(θ*θ>>10*θ>>13/3*θ>>15*θ>>13/5*θ>>13/6*θ>>17/7)+4>>3
		; sin(2π-θ)	=  sinθ
		a = 1024 - cnt
		sin.a = -sin.cnt
		; sin(π+θ)	= -sinθ
		a = 512 + cnt
		sin.a = -sin.cnt
		; sin(π-θ)	=  sinθ
		a = 512 - cnt
		sin.a = sin.cnt
	 ; cos(*1024)
		; cos(π/2+θ)	= -sinθ
		a = 256 + cnt
		cos.a = -sin.cnt
		; cos(π/2-θ)	=  sinθ
		a = 256 - cnt
		cos.a =  sin.cnt
		; cos(3π/2+θ)=  sinθ
		a = 768 + cnt
		cos.a =  sin.cnt
		; cos(3π/2-θ)= -sinθ
		a = 768 - cnt
		cos.a = -sin.cnt
	loop

; ロゴ

	title "Thank you for your using!"
	buffer 3,320,240,0
	screen 0,320,240,2
	font "Arial",24,16
	gsel 0,1
	repeat $F
	 wait 5
	 redraw 2
	 color $FF,$FF,$FF			:boxf
	 color $F*cnt^$FF,$F*cnt^$FF,$F*cnt^$FF	:pos 15,15
	 mes "arX Launcher"
	 redraw 1
	loop
	pos csrx-1,csry
	repeat winx-10/10,1
	 wait 2
	 redraw 2
	 line cnt*10,csry
	 redraw 1
	loop

; 情報取得

	; バージョン情報(数値型)
	hdtp_req appveri,31

	; バージョン情報(文字列型)
	appvers=""
	hdtp_req offset,6
	hdtp_req appvers,offset+1

	; その他おまけ
	sdim user,64 :i=64
	getptr puser,user
	getptr pi,i
	prm=puser,pi
	ll_libload D_ADVAPI,"advapi32"
	dllproc "GetUserNameA",prm,2,D_ADVAPI
	ll_libfree D_ADVAPI

; 表示

	font "Arial",12,16
	i=csry+10
	pos 15,i	:mes "version:"
	pos 80,i	:mes "\""+appvers+"\" ("+appveri+")"
	i=csry+5
	pos 15,i	:mes "user:"	:font "ＭＳ ゴシック",12,16 :i++
	pos 80,i	:mes user
	gsel 3 :gcopy 0,0,0,320,240

; 波紋

	gsel 0
	#const cx	300
	#const cy	200
	#const v	2
	#const num	5
	#const lim	375
	#const cycle	180
	#const space	75
	#const spacet	36
	;#define cycle	lim/v
	;#define space	lim/num
	;#define spacet	(cycle/num)
	gmode 0,320,240
	;mref vram,66

	; 出始め

	repeat cycle
	 t=cnt\cycle
	 wait 5
	 redraw 2
	 pos 0,0 :gcopy 3,0,0
	 repeat num
	  if t<0 :continue
	  color t*$22/cycle+$CC,t*$11/cycle+$EE,t*$22/cycle+$DD
	  repeat 1024
	   pset t*cos.cnt*v/1024+cx,t*sin.cnt*v/1024+cy
	  loop
	  t=t-spacet\cycle
	 loop
	 redraw 1
	loop

	; 出っ放し

	repeat
	 t=cnt\cycle
	 wait 5
	 redraw 2
	 pos 0,0 :gcopy 3,0,0
	 repeat num
	  color t*$22/cycle+$CC,t*$11/cycle+$EE,t*$22/cycle+$DD
	  ;col=t*$11/cycle+$EE,t*$22/cycle+$DD,t*$22/cycle+$CC
	  repeat 1024
	   pset t*cos.cnt*v/1024+cx,t*sin.cnt*v/1024+cy
	   ;prm=t*cos.cnt*v/1024+cx,winy-(t*sin.cnt*v/1024+cy)+1
	   ;if prm<0|(prm>=winx)|(prm.1<0)|(prm.1>=winy) :continue
	   ;i=prm.1*winx+prm*3
	   ;repeat 3 :poke vram,i,col.cnt :i++ :loop
	  loop
	  t=t+spacet\cycle
	 loop
	 redraw 1
	loop


; ―――――――――――――――――――――――――――――――――――――
; (C) arc＠arcis 2004
; arX Launcher 特設サイト ＠ http://hp.vector.co.jp/authors/VA022483/arxlc/?
