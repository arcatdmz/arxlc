
; �� arX Launcher 10.0x	�A�g�v���O�����̃T���v�� (5)
;							 �ŏI�X�V�� 04/09/19
; �\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\

; �펯�O��ȃT�C�Y�ɂ��Ή������ݒ�ύX�c�[���ł��B

	; hdtp.as �p�̒�`
	#const	global	wm_xpi	$500
	#define	global	clsname	"oniwnd1"
	#define	global	appname	"arxlc"
	setfile=cmdline

	; ���ߊg��
	#include "hdtp.as"

	; hdtp �̏�����
	hdtp_init
	if stat<0 {
	 dialog "arX Launcher ���N�����Ă��܂���B\n�v���O�C�����I�����܂��B"
	 end
	}

	; arxlc.exe �̃t���p�X�擾
	sdim path,512
	hdtp_req �F,6
	hdtp_req path,�F

	; ���݂̐ݒ���擾
	hdtp_req �@,0
	dim setting,4
	dim setting_,4
	dup iconsize		,setting
	dup sysiconsize		,setting.1
	dup mg_girth		,setting.2
	dup mg			,setting.3
	hdtp_req iconsize	,�@+4
	hdtp_req sysiconsize	,�@+5
	hdtp_req mg_girth	,�@+10
	hdtp_req mg		,�@+11

	; ��ʂ̏���
	redraw 2
	palcolor 0
	line 10,31,winx-11,31
	font "�l�r �S�V�b�N",16,1
	pos 15,15	:mes "arX Launcher �̏ڍאݒ�"
	font "�l�r �S�V�b�N",12 :objmode 2,1
	pos 15,55	:mes "���j���[�A�C�R���̑傫��:"
	pos 15,80	:mes "�A�v���A�C�R���̑傫��:"
	pos 15,105	:mes "���C����ʂ̘g��:"
	pos 15,130	:mes "�A�v���A�C�R���̊Ԋu:"
	pos 15,winy-22	:mes "���l��傫���������Ăǂ��Ȃ��Ă��A�m��܂���(��)"
	objsize 25,19
	repeat 4
	 pos 200,25*cnt+51 :input setting.cnt
	 boxf 230,25*cnt+54,winx-11,25*cnt+66
	loop
	palcolor 255
	repeat 4
	 boxf 231,25*cnt+55,winx-12,25*cnt+65
	loop
	objsize 140,50
	pos winx-150,winy-60
	button "O K",*restart
	redraw 1

	gsel 0,1
	*main

	getkey i,1

	; �ݒ�ύX�����m
	repeat 4
	 if i&(mousey>(25*cnt+54))&(mousey<=(25*cnt+66))&(mousex>230)&(mousex<(winx-10)) {
	  setting.cnt=mousex-231
	 }
	 if setting.cnt!setting_.cnt {
	  setting_.cnt=setting.cnt
	  objprm cnt,setting.cnt
	  palcolor 255
	  boxf 231,25*cnt+55,winx-12,25*cnt+65
	  color 200,0,0
	  i=winx-11-231
	  i=setting.cnt>i*i+(setting.cnt<=i*setting.cnt)
	  boxf 231,25*cnt+55,230+i,25*cnt+65
	 }
	loop

	wait 5
	goto *main

	*restart
	hdtp_func 1			; �����`���[�̏I��
	if sysiconsize=0 :sysiconsize=1	; �A�v���A�C�R���̑傫�� 0 �͑���ł��Ȃ��Ȃ邩�������
	exec "\""+path+"\" "+iconsize+"i"+sysiconsize+"a"+mg_girth+"b"+mg+"m"
	end


; �\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\
; (C) arc��arcis 2004
; arX Launcher ���݃T�C�g �� http://hp.vector.co.jp/authors/VA022483/arxlc/?
