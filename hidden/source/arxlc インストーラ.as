
; �� arxlc �C���X�g�[��
;							 �ŏI�X�V�� 04/09/19
; �\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\

; arxlc �̏����ݒ���s�����A
; ����R�}���h���C�����w�肳�ꂽ arxlc.exe �ւ̃V���[�g�J�b�g���쐬���܂��B

	if cmdline="initialize" :initmode=1

; �� ������

	; hdtp.as �p�̒�`
	; (arxlc �Ƃ̊ԂŃf�[�^�̂���������ۂ͉��L�̒l�ŌŒ�)
	#const	global	wm_xpi	$500
	#define	global	clsname	"oniwnd1"
	#define	global	appname	"arxlc"
	setfile=cmdline

	; ���ߊg���ƕϐ��̏�����
	#include "hdtp.as"
	ll_libload D_SHELL,"shell32"
	ll_libload D_KERNEL,"kernel32"
	ll_getproc FNC_ShellExecuteExA,"ShellExecuteExA",D_SHELL
	ll_getproc FNC_GetFileAttributesA,"GetFileAttributesA",D_KERNEL
	sdim apppath,512	:getptr papppath,apppath
	sdim s,1024		:getptr ps,s
	sdim ss,512		:getptr pss,ss
	dim prm,16		:getptr pprm,prm
	;dim i :dim ii
	prm=0,papppath,512
	dllproc "GetModuleFileNameA",prm,3,D_KERNEL

	;  �V�X�e���F�̎擾
	dim col,2,3 :prm=15
	repeat 2
	 dllproc "GetSysColor",prm,1,D_USER
	 col.cnt.0=dllret    &255
	 col.cnt.1=dllret>>8 &255
	 col.cnt.2=dllret>>16&255
	 prm++
	loop

	; ��ʂ̏�����
	title "arxlc �C���X�g�[��"
	width 380,320
	redraw 2
	color col.0,col.0.1,col.0.2	:boxf
	color col.1,col.1.1,col.1.2	:boxf 0,0,winx,50
	i=0 :gosub *drwlogo :palcolor 255
	i=1 :gosub *drwlogo :palcolor 0

	; �����ݒ�(initialize)
	if initmode {
	;  ��ʂ̐���
	use_plugin=1
	font "�l�r �S�V�b�N",28,17
	pos 5,6				:mes "�����ݒ�"
	font "�l�r �S�V�b�N",10,16
	pos 7,35			:mes "����N���ł��̂ŁA���� arxlc ���ǂ̂悤�Ɏg�����w�肵�ĉ������B"
	font "�l�r �S�V�b�N",12		:objmode 2,1
	objsize winx-20,25
	pos 10,60			:chkbox "�v���O�C��(�g���@�\)�𗘗p����",use_plugin
	s ="�v���O�C���𗘗p����ƁA�{�̂Ɏ�������Ă��Ȃ��g���@�\�������ł��܂��B\n"
	s+="�`�F�b�N���O���ƃv���O�C���֘A�̃t�@�C��������폜����A�ȍ~�̓v���O�C���̋@�\�𗘗p�������Ȃ��Ă������`���[���ă_�E�����[�h���鑼�����Ȃ邽�߁A�ʏ�̓`�F�b�N��t�����܂܂ɂ��������ǂ��ł��B"
	pos 20,85			:mesbox s,winx-30,57,0
	pos 10,155			:objsize winx-20,18
	chkbox "�f�X�N�g�b�v�� arxlc �̃A�C�R�����쐬����",mklnk_desktop
	chkbox "Windows �N������ arxlc ���N������",mklnk_startup
	s= "���ꂼ��A�u�f�X�N�g�b�v�v�Ɓu�X�^�[�g���j���[���v���O�������X�^�[�g�A�b�v�v�� arxlc.exe �ւ̃V���[�g�J�b�g���쐬���܂��B"
	pos 20,195			:mesbox s,winx-30,45,0
	pos winx-100,winy-53		:objsize 90,45
	button "OK",*ok_init

	; �Ⴄ���ւ̃C���X�g�[��
	} else {
	;  hdtp �̏�����
	hdtp_init
	if stat<0 {
	 dialog "arX Launcher ���N�����Ă��܂���B\n�v���O�C�����I�����܂��B"
	 end
	}
	;  �����`���[���̎擾
	sdim rootdir,512
	sdim setfile,64
	hdtp_req �F,6
	hdtp_req apppath,�F
	hdtp_req rootdir,�F+3
	hdtp_req setfile,�F+4
	;  ��ʂ̐���
	font "�l�r �S�V�b�N",28,17
	pos 5,6				:mes "�V�������ɃC���X�g�[��"
	font "�l�r �S�V�b�N",10,16
	pos 7,35			:mes "arxlc ���A���݂ƈႤ�t�H���_�����[�g�Ƃ��ċN���ł��܂��B"
	font "�l�r �S�V�b�N",12		:objmode 2,1
	objsize winx-140,18
	pos 10,66			:mes "���[�g�t�H���_:"
	pos 108,63			:input rootdir
	objsize 20,18
	pos winx-30,63			:button "��",*sel_rootdir
	s ="arxlc �͒ʏ� arxlc.exe �̓����Ă���t�H���_�����[�g�Ƃ��ċN�����܂����A����ȃR�}���h���C��(�v���O�������ǂ����s���邩�Ƃ����I�v�V����)���܂� arxlc.exe �ւ̃V���[�g�J�b�g���쐬���A�������� arxlc ���N������ƁA�ʏ�ƈقȂ�t�H���_�����[�g�Ƃ��ă����`���[���ڂ����������邱�Ƃ��ł��܂��B\n"
	s+="���̃v���O�C���́A���̂悤�ȓ���R�}���h���C�����܂ރV���[�g�J�b�g���ȒP�ɍ쐬�ł��܂��B"
	pos 20,85			:mesbox s,winx-30,81,0
	objsize winx-118,18
	pos 10,180			:mes "�ݒ�t�@�C����:"
	pos 108,177			:input setfile
	s ="�쐬�����V���[�g�J�b�g����N������ arxlc �ƒʏ�ǂ���N������ arxlc ���������Ȃ��悤�ɁA�ݒ�t�@�C�����͕K�����[�g���Ƃɕς��ĉ������B"
	pos 20,199			:mesbox s,winx-30,57,0
	pos winx-100,winy-53		:objsize 90,45
	button "OK",*ok_mklnk
	}

	redraw 1
	gsel 0,1
	onexit *exit
	stop

; �� ���[�g�t�H���_�̑I��

*sel_rootdir
	; �I���_�C�A���O�\��
	if pMalloc=0 :gosub *initcom
	ss="���[�g�t�H���_��I�����ĉ������B"
	prm=bmscr.13@hdtp,0,ps,pss,3,0,0,0
	ll_callfunc pprm,1,FNC_SHBrowseForFolderA
	if dllret {
	 ; ���ʂ̎擾�Ǝg�p���ꂽ�������̈�̉��
	 prm=dllret,ps :ll_callfunc prm,2,FNC_SHGetPathFromIDListA
	 prm=pidl :prmex=pprm,1,5,pMalloc :ll_callfunc prmex,4,pCallMethod
	 ; ���ʂ̕\��
	 rootdir=s
	 objprm 0,rootdir
	}
	stop

; �� OK (�����ݒ�)

*ok_init
	gsel 0,-1
	skiperr 1
	chdir exedir+"\\hidden\\"
	; �v���O�C���֘A�̃t�@�C�����폜
	if use_plugin=0 {
	 delete "plus.ax"
	 delete "mklnk.ax"
	 delete "arxlc �C���X�g�[��.xpi"
	 delete "arxlc �̃o�[�W�������.xpi"
	 delete "arxlc �̏ڍאݒ�.xpi"
	 delete "�����`���[���ڂ̒ǉ�.xpi"
	 delete "readme ... arxlc �C���X�g�[��.xpi"
	 delete "readme ... arxlc �̃o�[�W�������.xpi"
	 delete "readme ... arxlc �̏ڍאݒ�.xpi"
	 delete "readme ... �����`���[���ڂ̒ǉ�.xpi"
	; �v���O�C�����p�̃V���[�g�J�b�g���ڂ��쐬
	} else {
	 chdir exedir :mkdir "�v���O�C���̋@�\"
	 s="\"run:hidden\\�����`���[���ڂ̒ǉ�.xpi,@arxlc.dat,\",\"�v���O�C���̋@�\\\�����`���[���ڂ̒ǉ�\"":gosub *mklnk
	 s="\"run:hidden\\arxlc �̏ڍאݒ�.xpi,@arxlc.dat\",\"�v���O�C���̋@�\\\arxlc �̏ڍאݒ�\"":gosub *mklnk
	 s="\"run:hidden\\arxlc �C���X�g�[��.xpi,@arxlc.dat\",\"�v���O�C���̋@�\\\arxlc ��V�������ɃC���X�g�[��\"":gosub *mklnk
	 s=exedir+"\\�v���O�C���̋@�\\\arxlc ��V�������ɃC���X�g�[��.lnk" :gosub *chklnk
	 chdir exedir+"\\hidden\\"
	}
	; arxlc �ւ̃V���[�g�J�b�g���쐬
	if mklnk_desktop|mklnk_startup :gosub *initcom
	if mklnk_desktop {
	 i=$10 :gosub *getfolder :ss=s
	 s=",\""+s+"\\arX Launcher\""	:gosub *mklnk
	 s=ss+"\\arX Launcher.lnk" :gosub *chklnk
	}
	if mklnk_startup {
	 i=$7 :gosub *getfolder :ss=s
	 s=",\""+s+"\\arX Launcher\""	:gosub *mklnk
	 s=ss+"\\arX Launcher.lnk" :gosub *chklnk
	}
	delete "startup.dat"
	skiperr 0
	wait 10
	exec exedir+"\\arxlc.exe"
	goto *exit

; �� OK (����V���[�g�J�b�g�̍쐬)

*ok_mklnk
	exist exedir+"\\hidden\\"+setfile
	if strsize!-1 {
	 dialog "���ɓ����̐ݒ�t�@�C�������݂��܂��B\n�K���V�����ݒ�t�@�C��������͂��ĉ������B",0,"arxlc �C���X�g�[��"
	 stop
	}
	; ���[�g�f�B���N�g�������� \ �͕t���Ȃ�
	strlen ii,rootdir
	i=0
	repeat ii
	 if i>=ii :break
	 instr prm,s,"\\",i
	 if prm=-1 :break
	 i+=prm+1
	loop
	if i=ii :strmid rootdir,rootdir,0,i-1
	; �V���[�g�J�b�g�̍쐬
	s="\"|"+rootdir+"|R|"+setfile+"|S\",\""+rootdir+"\\arX Launcher\"" :gosub *mklnk
	dialog "arxlc �ւ̃V���[�g�J�b�g���ȉ��̃t�H���_���ɍ쐬���܂����B\n\n"+rootdir+"\n\n�쐬���ꂽ�V���[�g�J�b�g���J���Ə�L�̃t�H���_�����[�g�ƂȂ��ă��j���[���ڂ���������܂��B\n\n�Ȃ��A���̂܂܂ł͍쐬���ꂽ�V���[�g�J�b�g�܂Ń��j���[���ڂɒǉ�����Ă��܂��܂��̂ŁA\n�g�p�O�ɕ֗��̗ǂ��t�H���_���Ɉړ����Ă����ĉ������B",0,"arxlc �C���X�g�[��"
	exec rootdir,16
	goto *exit

; �� �v���O�����̏I��

*exit
	if pMalloc :prm=0,0,2,pMalloc :ll_callfunc prm,4,pCallMethod
	end

; �� �T�u���[�`��

; ���S�`��
; i	/ �`��J�n�ʒu

*drwlogo
	font "Arial Black",21,16 :pos 8+i,winy-60+i :mes "arxlc."
	font "Arial Black",36,16 :pos 6+i,winy-50+i :mes "Installer"
	return

; arxlc.exe �ւ̃V���[�g�J�b�g���쐬
; s	/ �쐬�I�v�V����

*mklnk
	s="run:hidden\\mklnk.ax,\""+apppath+"\","+s
	prm=60,0,bmscr.13@hdtp,0,papppath,ps,0,1,0,0,0,0,0,0,0
	ll_callfunc pprm,1,FNC_ShellExecuteExA
	return

; �V���[�g�J�b�g�̍쐬�������������m�F
; s	/ �V���[�g�J�b�g�̃t�@�C����

*chklnk
	repeat 25
	 wait 20
	 ll_callfunc ps,1,FNC_GetFileAttributesA
	 if dllret!-1 :break
	loop
	return

; ����t�H���_�p�X�̎擾
; i	/ CSIDL

*getfolder
	; �t�H���_�p�X�̎擾
	prm=0,i,ppidl	:ll_callfunc prm,3,FNC_SHGetSpecialFolderLocation
	prm=pidl,ps	:ll_callfunc prm,2,FNC_SHGetPathFromIDListA
	; �g�p���ꂽ�������̈�̉��
	prmex=ppidl,1,5,pMalloc
	ll_callfunc prmex,4,pCallMethod
	return

; COM �̏�����(����� *exit ��)

*initcom
	; CallMethod �֐�
	dim CallMethod,11 ; �֐��f�[�^�� (11*4>)$2A(>(10*4))
	getptr pCallMethod,CallMethod
	prm=pCallMethod,44,$40,0 :dllproc "VirtualProtect",prm,4,D_KERNEL
	CallMethod = $8bec8b55, $d2851455, $458b1974, $0c4d8b08, $34ff03eb, $fa7d4988, $8b028b52, $14ff104d, $b805eb88, $80004003, $0000c3c9
	; ���̑��֐�
	ll_getproc FNC_SHGetSpecialFolderLocation,"SHGetSpecialFolderLocation",D_SHELL
	ll_getproc FNC_SHGetPathFromIDListA,"SHGetPathFromIDListA",D_SHELL
	ll_getproc FNC_SHBrowseForFolderA,"SHBrowseForFolderA",D_SHELL
	; COM �C���^�[�t�F�[�X�擾
	getptr prm,pMalloc
	getptr ppidl,pidl
	dllproc "SHGetMalloc",prm,1,D_SHELL
	return


; �\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\
; (C) arc��arcis 2004
; arX Launcher ���݃T�C�g �� http://hp.vector.co.jp/authors/VA022483/arxlc/?
