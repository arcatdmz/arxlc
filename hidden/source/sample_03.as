
; �� arX Launcher 10.0x	�A�g�v���O�����̃T���v�� (3)
;							 �ŏI�X�V�� 04/09/19
; �\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\

; ���C�����j���[��\�����āA�I�����ꂽ���ڂɂ��Ă̐�����\�����܂��B
; �X�Ƀ_�C�A���O��\�����A�����ꂽ�ꍇ�͂��̍��ڂ̋@�\�����s���܂��B

; sample_02.as �́u���� 113+(72/8) �Ȃ̂��H�v�ɂ��Ă� 40 �s�������������B

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
	gsel 0,1

	; ���C�����j���[��\�����Ă݂�
	hdtp_req �B,2
	hdtp_menu �B

	; �I�����ʂɉ��������������Ă݂�
	funcid=stat
	pos 5,5
	mes "�I�����ꂽ���j���[��ID: "+funcid
	repeat
	 if funcid=0	:mes "�����I������܂���ł����B"	:break
	 if funcid=1	:mes "�����`���[�͏I������܂��B"	:break
	 if funcid=2	:mes "�����`���[�͍ċN������܂��B"	:break
	 if funcid=3	:mes "�����`���[�̐�������\�����܂��B"	:break
	 if funcid=4	:mes "�g���@�\�̃��X�g��\�����܂��B"	:break
	 if funcid=10	:mes "���[�g�t�H���_���J���܂��B"	:break
	 if funcid<113	{
	  mes "���j���[�A�C�R���̑傫�����ύX����܂��B"
	  i=funcid-100*8
	  mes "�ύX��̑傫�� ... "+i+"px �l��"
	  break
	 }
	 if funcid=113	:mes "�A�v���A�C�R���ƃ��j���[�A�C�R���̑傫�������킹��ݒ肪�ύX����܂��B" :break
	 if funcid<130	{
	  mes "�A�v���A�C�R���̑傫�����ύX����܂��B"
	  mes "���j���[�A�C�R���̑傫���ɍ��킹��ݒ����������܂��B"
	  i=funcid-113*8
	  mes "�ύX��̑傫�� ... "+i+"px �l��"
	  break
	 }
	 if funcid<140	{
	  mes "���C����ʂ̘g�����ύX����܂��B"
	  i=funcid-130
	  mes "�ύX��̘g�� ... "+i+"px"
	  break
	 }
	 if funcid<148	{
	  mes "�A�v���A�C�R�����m�̊Ԋu���ύX����܂��B"
	  i=funcid-140
	  mes "�ύX��̊Ԋu ... "+i+"px"
	  break
	 }
	 if funcid=148	:mes "�����`���[�̍ŏ����\����؂�ւ��܂��B" :break
	 if funcid=149	:mes "�����`���[�̍őO�ʕ\����؂�ւ��܂��B" :break
	 if funcid=150	:mes "���C����ʂ̘g�̐F��ύX���܂��B"
	 if funcid=165	:mes "�}�E�X�J�[�\������ʒ[�ɗ����Ƃ��Ƀ��j���[��\������悤�ɂ��܂��B\n�X�ɃN���b�N���Ȃ��ƃ��j���[���\������Ȃ��ݒ�ł��B" :break
	 if funcid=166	:mes "�}�E�X�J�[�\������ʒ[�ɗ����Ƃ��Ƀ��j���[��\������悤�ɂ��܂��B" :break
	 ; ��70+'d', 70+'l', 70+'n', 70+'r', 70+'u'
	 if funcid=170	:mes "�}�E�X�J�[�\������ʉ��[�ɗ����Ƃ��Ƀ��j���[��\�����܂��B" :break
	 if funcid=178	:mes "�}�E�X�J�[�\������ʍ��[�ɗ����Ƃ��Ƀ��j���[��\�����܂��B" :break
	 if funcid=180	:mes "�}�E�X�J�[�\������ʒ[�ɗ��Ă����j���[��\�����Ȃ��悤�ɂ��܂��B" :break
	 if funcid=184	:mes "�}�E�X�J�[�\������ʉE�[�ɗ����Ƃ��Ƀ��j���[��\�����܂��B" :break
	 if funcid=187	:mes "�}�E�X�J�[�\������ʏ�[�ɗ����Ƃ��Ƀ��j���[��\�����܂��B" :break
	 if funcid>=192 {
	  mes "�I�����ꂽ�̂̓����`���[���ڂł��B"
	  ; �����`���[���ڂ̃t���p�X���擾�A�\�����Ă݂�
	  sdim path,512
	  hdtp_req �E,5
	  hdtp_req path,�E+funcid
	  mes "�t���p�X ... "+path
	  break
	 }
	 break
	loop

	; ���ۂɑI�����ꂽ���ڂ����s���Ă݂�H
	dialog "�I�����ꂽ���ڂ̋@�\�����s���܂����H\n\n(�ݒ荀�ڂ��I�����ꂽ�ꍇ�͐ݒ肪�ύX����܂��B)",2
	if stat=6 :hdtp_func funcid
	stop


; �\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\
; (C) arc��arcis 2004
; arX Launcher ���݃T�C�g �� http://hp.vector.co.jp/authors/VA022483/arxlc/?
