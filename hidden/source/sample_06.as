
; �� arX Launcher 10.0x	�A�g�v���O�����̃T���v�� (6)
;							 �ŏI�X�V�� 04/09/20
; �\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\

; �t�@�C�����X�g���擾���܂��B
; ��������ł����A�ł������͐��������Ŋ������܂���(T�[T)�B

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

	; �������̈�̊m��
	sdim list	,2048
	sdim filelist	,64
	;dim pid :dim hp
	;dim sel :dim sel_

	; ���������t�H���_���̎擾
	hdtp_req �D,4
	hdtp_req foldernum,�D+3
	; �t�H���_���t�@�C�����X�g�̎擾
	if foldernum {
	 ll_libload D_KERNEL,"kernel32"
	 ; arxlc �̃��C����ʃn���h������v���Z�X�n���h�����擾
	 getptr ppid,pid
	 prm=hwnd@hdtp,ppid	:dllproc "GetWindowThreadProcessId"	,prm,2,D_USER
	 prm=$10,0,pid		:dllproc "OpenProcess"			,prm,3,D_KERNEL
	 hp=dllret					; �v���Z�X�n���h�� (arxlc)
	 ; �t�@�C�����X�g�̃f�[�^�ւ̃|�C���^���擾
	 ;			 �@���f�[�^�ǂݍ���
	 hdtp_req �G,7
	 sdim filelist,16384,foldernum
	 repeat foldernum
	  getptr pfilelist.cnt,filelist.cnt		; �ǂݍ��ݐ� (�v���O�C��)
	  hdtp_req pfilelist_,�G+cnt			; �@ �V �@�� (arxlc)
	  prm=hp,pfilelist_,pfilelist.cnt,16384,0	;
	  dllproc "ReadProcessMemory",prm,5,D_KERNEL	; �ǂ�
	  i=cnt+1
	  list+="�t�H���_ ("+i+")\n"
	 loop
	 dllproc "CloseHandle",hp,1,D_KERNEL		; ��n��
	}

	; ��ʂ̏�����
	font "�l�r �S�V�b�N",14
	objmode 2,1
	objsize winx-10,25
	pos 5,5		:combox sel,120,list
	objsize winx-10,winy-40
	pos 5,35	:mesbox filelist,,,2
	gsel 0,1
	repeat
	 wait 5
	 if sel!sel_ :objprm 1,filelist.sel :sel_=sel
	loop


; �\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\
; (C) arc��arcis 2004
; arX Launcher ���݃T�C�g �� http://hp.vector.co.jp/authors/VA022483/arxlc/?
