
; �� arX Launcher �̃o�[�W��������\��
;							 �ŏI�X�V�� 04/09/19
; �\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\

	; hdtp.as �p�̒�`
	; (arxlc �Ƃ̊ԂŃf�[�^�̂���������ۂ͉��L�̒l�ŌŒ�)

	#const	global	wm_xpi	$500
	#define	global	clsname	"oniwnd1"
	#define	global	appname	"arxlc"
	setfile=cmdline

	; ���ߊg��

	#include "hdtp.as"
	hdtp_init
	if stat<0 {
	 dialog "arX Launcher ���N�����Ă��܂���B\n�v���O�C�����I�����܂��B"
	 end
	}

	; sin/cos �e�[�u���\�z
	; �� �R�A�ƂȂ�}�N���[�����W�J�܂��̏����́A
	;�@�@sprocket ����̃T�C�g����]�p�����Ē����܂����B
	; �� �V��(�����ړI���o)�̂��߂̏����ł��B
	; �� ������Ȃ��Ă��C�ɂ��Ȃ��悤�ɂ��܂��傤(��)
	; �� arc��arcis �����̂Ƃ���悭�킩���Ă��܂���(��)

	; sin.i  ��  1024*sin(2��*i/1024)
	; cos.i  ��  1024*cos(2��*i/1024)

	dim sin,1025
	dim cos,1025
	cos.0    =  1024
	sin.256  =  1024
	cos.512  = -1024
	sin.768  = -1024
	cos.1024 = 1024

	repeat 256
	 ; ��[rad]
	 �� = cnt << 23 / 166886
	 ; sin(*1024)
		; sin��		= (�}�N���[�����W�J)
		sin.cnt = ��*��>>10*��>>13/3*��>>15*��>>17/5+��-(��*��>>10*��>>17/3)-(��*��>>10*��>>13/3*��>>15*��>>13/5*��>>13/6*��>>17/7)+4>>3
		; sin(2��-��)	=  sin��
		a = 1024 - cnt
		sin.a = -sin.cnt
		; sin(��+��)	= -sin��
		a = 512 + cnt
		sin.a = -sin.cnt
		; sin(��-��)	=  sin��
		a = 512 - cnt
		sin.a = sin.cnt
	 ; cos(*1024)
		; cos(��/2+��)	= -sin��
		a = 256 + cnt
		cos.a = -sin.cnt
		; cos(��/2-��)	=  sin��
		a = 256 - cnt
		cos.a =  sin.cnt
		; cos(3��/2+��)=  sin��
		a = 768 + cnt
		cos.a =  sin.cnt
		; cos(3��/2-��)= -sin��
		a = 768 - cnt
		cos.a = -sin.cnt
	loop

; ���S

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

; ���擾

	; �o�[�W�������(���l�^)
	hdtp_req appveri,31

	; �o�[�W�������(������^)
	appvers=""
	hdtp_req offset,6
	hdtp_req appvers,offset+1

	; ���̑����܂�
	sdim user,64 :i=64
	getptr puser,user
	getptr pi,i
	prm=puser,pi
	ll_libload D_ADVAPI,"advapi32"
	dllproc "GetUserNameA",prm,2,D_ADVAPI
	ll_libfree D_ADVAPI

; �\��

	font "Arial",12,16
	i=csry+10
	pos 15,i	:mes "version:"
	pos 80,i	:mes "\""+appvers+"\" ("+appveri+")"
	i=csry+5
	pos 15,i	:mes "user:"	:font "�l�r �S�V�b�N",12,16 :i++
	pos 80,i	:mes user
	gsel 3 :gcopy 0,0,0,320,240

; �g��

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

	; �o�n��

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

	; �o������

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


; �\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\
; (C) arc��arcis 2004
; arX Launcher ���݃T�C�g �� http://hp.vector.co.jp/authors/VA022483/arxlc/?
