
; �� arX Launcher 10.0x	�A�g�v���O�����̃T���v�� (2)
;							 �ŏI�X�V�� 04/09/19
; �\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\

; �A�v���A�C�R���̑傫���� 72�~72 �ɂ��ďI�����܂��B

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

	; �A�v���A�C�R���̃T�C�Y�� 72�~72 �ɂ��Ă݂�
	; ���� 113+(72/8) �Ȃ̂��H�ɂ��Ă͎��̃T���v��(sample_03.as)�������������B
	hdtp_func 113+(72/8)

	; ���Ȃ݂ɁAsample_03.as ������������Ε����邱�Ƃł���...

	; �����j���[�A�C�R���̃T�C�Y�� 64�~64 �ɂ��Ă݂�
	; hdtp_func 100+(64/8)
	; �����C����ʂ̘g���� 5 �ɂ��Ă݂�
	; hdtp_func 130+5
	; ���A�v���A�C�R���̊Ԋu�� 7 �ɂ��Ă݂�
	; hdtp_func 140+7

	; �Ȃ�Ă��Ƃ��o���܂��B

	; ���A��L�̐ݒ��ύX����ߒ��ł̓����`���[���ċN������̂ŁA
	; �����̐ݒ��ύX����ɂ́A���̓s�x hdtp_init �����s����
	; �����`���[�Ƃ̏��̂���������������K�v������܂��B

	; �܂��A�펯�O��ȃT�C�Y�ɂ���ɂ̓R�}���h���C�����w�肵��
	; �����`���[���ċN������K�v������̂ł����A
	; ���̕��@�ɂ��Ă� sample_05.as �ŁB

	end


; �\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\
; (C) arc��arcis 2004
; arX Launcher ���݃T�C�g �� http://hp.vector.co.jp/authors/VA022483/arxlc/?
