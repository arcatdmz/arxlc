
; �� arX Launcher 10.0x	�A�g�v���O�����̃T���v�� (4)
;							 �ŏI�X�V�� 04/09/19
; �\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\

; �����`���[�̗l�X�ȃ��j���[��\���A���ʂ��擾���܂��B

; ���j���[�̑I�����L�����Z�����ɂ���(��ʂ̑��̕������N���b�N���Ă����j���[��
; ���X�����Ă���Ȃ�)���Ƃ�����悤�ł����A�䖝���邵������܂���(�ʖڂ����)�B


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

	; arxlc ���N�����Ɍ��������t�H���_�̌�(=�J�e�S���[��)
	hdtp_req �D,4
	hdtp_req catnum,�D+3

	; ���j���[�\���̏���
	hdtp_req �A,1
	hdtp_req �B,2

	; �\���ł��郁�j���[�̈ꗗ
	sdim menu,1024
	menu+={"
	�g�����j���[�\���p���j���[
	�g�����j���[
	�����ڂ̐ݒ�
	�@�\�̐ݒ�
	���C�����j���[
	"}
	repeat catnum-1,1
	 menu+="�J�e�S���[���j���[ ("+cnt+")\n"
	loop
	font "�l�r �S�V�b�N",13	:objmode 2
	objsize winx-160,winy-10:pos 5,5
	listbox menusel,0,menu

	; ���j���[�̕\���{�^��
	objsize 145,200		:pos winx-150,5
	button "���j���[�̕\��",*shwmenu
	stop

	; ���j���[�̕\��
	*shwmenu
	if menusel=-1 :dialog "�\�����郁�j���[��I�����ĉ������B" :stop
	;  ���C����ʂ��g�p�s��(��)
	prm=bmscr@hdtp.13,0 :dllproc "EnableWindow",prm,2,D_USER
	;  ���j���[��\��
	if menusel<4 :hdtp_menu �A+menusel :else {
	 hdtp_menu �B+menusel-4
	}
	;  ���ʂ̕\��
	redraw 2
	palcolor 255	:boxf winx-150,210,winx,223
	palcolor 0	:pos winx-150,210
	mes "�I�����ꂽ����: "+stat
	redraw 1
	;  ���C����ʂ��g�p��(��)
	prm=bmscr@hdtp.13,1 :dllproc "EnableWindow",prm,2,D_USER
	stop

	; ----------------------------------------------------------------
	; (��)

	; dllproc �͒ʏ� llmod.as �� #include ���Ȃ��Ǝg���Ȃ����߂ł����A
	; #include ����Ă��Ȃ��ۂɂ� hdtp.as ���� �G�Z dllproc ���߂���`
	; ����邽�߁A����𗘗p���Ă��܂��BD_USER �����g���Ȃ���Astat ��
	; dllret �̒l���������Ȃ��Ƃ������ق�����܂��B

	; bmscr@hdtp �́Ahdtp_init ���Ƀ��W���[�����œǂݍ��܂ꂽ BMSCR �\
	; ���̂𗬗p���Ă��܂��B

	; ����������Ȃ�g���b�L�[�Ȃ����Ȃ̂ł��܂萄���ł��܂���(^^;
	; ----------------------------------------------------------------


; �\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\
; (C) arc��arcis 2004
; arX Launcher ���݃T�C�g �� http://hp.vector.co.jp/authors/VA022483/arxlc/?
