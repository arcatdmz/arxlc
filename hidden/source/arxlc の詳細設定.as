
; �� arX Launcher 10.0x	�A�g�v���O�����̃T���v�� (5) ���ǔ�
;
title			"arxlc �̏ڍאݒ�"
;
;							 �ŏI�X�V�� 04/09/25
; �\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\

; �펯�O��ȃT�C�Y�ɂ��Ή������ݒ�ύX�c�[���ł��B

; ���c(sample_05.as)�̑��쐫�����サ�A
; �ݒ�̕ۑ����@���m���ɂ��܂����B

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

	; arxlc �̏����擾
	sdim apppath,512
	sdim setfile,512
	sdim cmdline_,1024
	hdtp_req �F,6
	hdtp_req apppath,�F	; arxlc.exe �t���p�X
	hdtp_req setfile,�F+4	; �ݒ�t�@�C����
	hdtp_req cmdline_,�F+2	; �N���I�v�V����
	setfile=exedir+"\\hidden\\"+setfile

	; ���݂̐ݒ���擾
	hdtp_req �@,0
	dim setting,5
	dim setting_,5
	dup iconsize		,setting
	dup sysiconsize		,setting.1
	dup mg_girth		,setting.2
	dup mg			,setting.3
	dup synciconsize	,setting.4
	hdtp_req iconsize	,�@+4
	hdtp_req sysiconsize	,�@+5
	hdtp_req synciconsize	,�@+6
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
	pos 325,155	:mes "�A�v���A�C�R���̑傫�������j���[�A�C�R���ɍ��킹��"
	pos 15,winy-50
	mes "���o�[���h���b�O���Ēl��ݒ�ł��܂��B"		:pos 15,csry+2
	mes "���l��傫���������Ăǂ��Ȃ��Ă��A�m��܂���(��)"	:pos 15,csry+2
	mes "�����j���[�A�C�R���̑傫���� 0 �ɂ���ƃA�C�R����\�����Ȃ��ݒ�ɂł��܂��B"
	objsize 25,19
	repeat 4
	 pos 200,25*cnt+51 :input setting.cnt
	 boxf 230,25*cnt+54,winx-16,25*cnt+66
	loop
	palcolor 255
	repeat 4
	 boxf 231,25*cnt+55,winx-17,25*cnt+65
	loop
	objsize 140,50
	pos winx-155,winy-60
	button "O K",*restart
	objsize 13,13
	pos 308,155	:chkbox "",synciconsize
	redraw 1
	mref bmscr,67

	gsel 0,1
	*main

	; �`�F�b�N�{�b�N�X����̐ݒ�ύX�����m
	if setting_.4!synciconsize {
	 ; �A�v���A�C�R���T�C�Y���̓{�b�N�X�g�p�ېݒ�
	 setting_.4=synciconsize
	 prm=bmscr.42,synciconsize=0
	 dllproc "EnableWindow",prm,2,D_USER
	 redraw 2
	 if synciconsize {
	  color 255,250,230 :boxf 231,80,winx-17,90
	  color 250,240,190
	  i=winx-16-231
	  i=setting.1>i*i+(setting.1<=i*setting.1)
	  boxf 231,80,230+i,90
	 } else :ii=1 :gosub *draw
	 redraw 1
	}

	; �o�[�̃h���b�O�����m
	getkey i,1
	repeat 4
	if i&(mousey>(25*cnt+54))&(mousey<=(25*cnt+66))&(mousex>230)&(mousex<(winx-10)) {
	 ; �A�v���A�C�R���̑傫�������j���[�A�C�R���ɍ��킹��ݒ�H
	 if cnt=1&synciconsize :continue
	 ; �h���b�O�J�n
	 ii=cnt
	 repeat
	  wait 5
	  getkey i,1
	  if i {
	   setting.ii=mousex-231
	   if setting.ii<0 :setting.ii=0
	   ; �\�����X�V
	   objprm ii,setting.ii
	   redraw 2
	   gosub *draw
	   redraw 1
	  } else :break
	 loop
	 objprm cnt,setting.cnt
	}
	loop	

	; ���̓{�b�N�X����̐ݒ�ύX�����m
	repeat 4
	 if setting.cnt!setting_.cnt {
	  ; �\�����X�V
	  if setting.cnt<0 :setting.cnt=0 :objprm cnt,setting.cnt
	  ii=cnt
	  redraw 2
	  gosub *draw
	  redraw 1
	 }
	loop

	wait 5
	goto *main

	; OK
	*restart
	; arxlc �̏I��
	hdtp_func 1
	repeat
	 ; �I���m�F
	 wait 5
	 hdtp_init
	 if stat=-1 :break
	loop
	; �ݒ�̓ǂݍ��݂Ə�������
	dim data,16
	bload setfile,data,64,0
	data.4=iconsize
	data.5=sysiconsize
	data.6=synciconsize
	data.10=mg_girth
	data.11=mg
	bsave setfile,data,64,0
	; arxlc �̋N��
	if cmdline_="" :exec apppath :else {
	 exec "\""+apppath+"\" "+cmdline_
	}
	end

	; �o�[��`��
	;  �g�p�l ii	/ �o�[�̔ԍ�(�ォ�� 0, 1, 2, 3)
	*draw
	setting_.ii=setting.ii
	palcolor 255
	boxf 231,25*ii+55,winx-17,25*ii+65
	color 200,0,0
	i=winx-16-231
	i=setting.ii>i*i+(setting.ii<=i*setting.ii)
	boxf 231,25*ii+55,230+i,25*ii+65
	return


; �\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\
; (C) arc��arcis 2004
; arX Launcher ���݃T�C�g �� http://hp.vector.co.jp/authors/VA022483/arxlc/?
