
; �� arX Launcher 10.0x	�A�g�v���O�����̃T���v�� (1)
;							 �ŏI�X�V�� 04/09/19
; �\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\

; �A�v���o�^����Ă���V���[�g�J�b�g�̃t���p�X��S�Ď擾�A�\�����܂��B

	; hdtp.as �p�̒�`
	; (arxlc �Ƃ̊ԂŃf�[�^�̂���������ۂ͉��L�̒l�ŌŒ�)
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
	gsel 0,1

	; �����擾�O�̏���
	; (�I�t�Z�b�g�̎擾)
	title "���擾�̏�����"
	hdtp_req �@,0
	hdtp_req �C,3
	hdtp_req �E,5

	; �����̎擾
	; (�A�v���o�^���ꂽ�V���[�g�J�b�g�t�@�C���̃t���p�X���擾���Ă݂�)
	sdim path,512
	pos 5,5
	hdtp_req appnum,�@+15	; �A�v���A�C�R���̌����擾
	repeat appnum
	 i=cnt+1 :str i,2	;
	 title "�t���p�X���擾��; no."+i
	 hdtp_req id,�C+cnt	; �e�A�v���A�C�R���ɑΉ����郁�j���[��ID���擾
	 hdtp_req path,�E+id	; ���j���[��ID�ɑΉ�����V���[�g�J�b�g�̃t���p�X
	 mes i+". "+path :int i	; �A�v���̔ԍ��ƃt���p�X�̕\��
	loop
	title "���擾����"
	stop


; �\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\
; (C) arc��arcis 2004
; arX Launcher ���݃T�C�g �� http://hp.vector.co.jp/authors/VA022483/arxlc/?
