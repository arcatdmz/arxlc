
; �� hdtp.as		 HSP Data Transfer Protocol �q�v���O�����p���W���[��
;							 �ŏI�X�V�� 04/09/25
; �\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\

/*

 ���Ր������������郂�W���[�����Ȃ���AarX Launcher ��p�ł�(��

 ���������撣��΁A��ʉ����ĐF�X��HSP���v���O�����Ԃł�
 �f�[�^�̂����Ɏg����悤�ɂȂ肻���ȋC�����܂��B

 arc��arcis �̑O�� arX MusicPlayer �ɂ� HSP �𗘗p�����v���O�C���@�\��
 ����܂������A�����������݂̂Ȃ炸�I�����������K�v�������� �������̈�
 �����L������A�������������G�ɉ߂����C�����܂��B
 ���ƌ����� arXmp �̏ꍇ�Aarxlc �̂悤�� SendMessageA �𗘗p���čĐ���
 �X�g�𑗐M������ꍇ�ɂ���Ă͂��̂��������Ԃ�������܂����A �����Ƃ�
 ��͂���ł悩�����񂾂Ǝv���܂��B����B

 ����ɔ[�����Ă��܂��܂����B

 ���āA�ł͊e���߂̉���ł��B

 �� hdtp_init

	arxlc ���N�����Ă��邩�m�F���܂��B
	stat �� 0 ��菬������Έȍ~�̖��߂͎g�p�ł��܂���B
	�ڂ����́A

		stat :	-1	�N�����Ă��Ȃ�
			-2	�I���������ł���

	�Ƃ������Ƃ��Ӗ����܂��B

	�� �ȍ~�̖��߂����s����O�ɕK�������s���Ă��������B
	�� ���̖��߂����s����O��

		; hdtp.as �p�̒�`
		#const	global	wm_xpi	$500
		#define	global	clsname	"oniwnd1"
		#define	global	appname	"arxlc"
		setfile=cmdline

	�Ƃ����X�N���v�g�������Ă����K�v������܂��B

	�� �v���O�C���Ƃ��ċN�����ꂽ�ꍇ�A�R�}���h���C��(cmdline)�ɂ�

		"@(�ݒ�t�@�C����)"

	�Ƃ��������񂪓����Ă���A����͌Ăяo������ arxlc ��
	���ʂ��邽�߂ɗp�����܂��B
	��� setfile=cmdline �Ƃ��Ă���̂͂��̂��߂ł���A
	hdtp.as ���ł͂��̕ϐ� setfile �̒��g����Ăяo������ arxlc ��
	���ʂ��Ă���̂ŁAhdtp.as ���g���ăv���O�C�����J������ۂ́A
	�N���I�v�V���� ([HSP(P)] - [�N���I�v�V����]) ��

		@arxlc.dat

	�Ǝw�肷�邩�A

		setfile=cmdline

	�̍s��

		setfile="@arxlc.dat"

	�Ƃ��ĉ������B
	�������A��҂̏ꍇ�͍ŏI�I�ɃR���p�C������O�� setfile=cmdline
	�ɖ߂��̂�Y��Ȃ��悤�ɂ����Ӊ������B

 �� hdtp_req (���l�^�ϐ�),type

	type �Ŏw�肳�ꂽ��ނ̏��𐔒l�^�ϐ��ɑ�����܂��B

 type	�擾�ł�����
 �P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P
 0	arxlc �ݒ���e���擾����� infotype �Ɏw�肷�ׂ��l�B		 �@
	������I�t�Z�b�g�B�\���̂ւ̃|�C���^�̂悤�Ȃ���(�S�R�Ⴄ�C������)�B
 1	arxlc �̃V�X�e�����g�p���郁�j���[�̃n���h���擾�p�I�t�Z�b�g	 �A
 2	arxlc �J�e�S���[���j���[�̃n���h���擾�p�I�t�Z�b�g		 �B
 3	�e�A�v���ɑΉ����郁�j���[ID�擾�p�I�t�Z�b�g			 �C
 7	�V���[�g�J�b�g�t�@�C���ꗗ�̃f�[�^�ւ̃|�C���^�擾�p�I�t�Z�b�g	 �G
 4	���̑��̏��擾�p�I�t�Z�b�g					 �D
 (�������܂Ő��l�^���̃I�t�Z�b�g)
 5	�e�����`���[���ڂɑΉ������t�@�C���̃t���p�X���擾�p�I�t�Z�b�g �E
 6	���̑��̏��擾�p�I�t�Z�b�g					 �F
 (�������܂ŕ�����^���̃I�t�Z�b�g)
 (�ȍ~�͎���񂪎擾�����B�@�`�D�ɂ́��Ŏ擾�����I�t�Z�b�g�l��������B)
 31	arxlc �o�[�W�����ԍ� (990�Ȃ�)
 �@	�O�� arxlc ���N�������ۂ� arxlc �o�[�W�����ԍ�
 �@+1	�O�� arxlc ���I�������ەۑ����ꂽ�ݒ荀�ڂ̐�
 �@+2	�O�� arxlc ���I���������̃��C����ʈʒu(�w���W)
 �@+3	�@�@�@�@�@�@�@�@�V�@�@�@�@�@�@�@�@�@�@ (�x���W)
 �@+4	���j���[�A�C�R���̑傫��
 �@+5	�A�v���A�C�R���̑傫��
 �@+6	�������j���[�A�C�R���̑傫���ɍ��킹��(1)����(0)��
 �@+7	��ʒ[�Ƀ}�E�X�J�[�\���������ۃ��j���[��\������(��)����('n')��
	�� 'u' ��[, 'r' �E�[, 'd' ���[, 'l' ���[
 �@+9	��ʒ[�ŁA�N���b�N�����Ń��j���[��\������(1)����(0)��
 �@+10	���C����ʘg��
 �@+11	�A�v���A�C�R���̊Ԋu
 �@+12	���C����ʂ��ŏ�������Ă���(1)����(0)��
 �@+13	���C����ʂ��őO�ʕ\������Ă���(1)����(0)��
 �@+15	���݃A�v���o�^����Ă��郉���`���[���ڂ̐�
 �A	�v���O�����A�C�R�����E�N���b�N���ꂽ��A�t�@�C����t�H���_�̃h���b�O
	���h���b�v�悾�������ɕ\�������g�����j���[�\���p���j���[�̃n���h��
 �A+1	�g�����j���[�̃n���h��
 �A+2	�u�����ڂ̐ݒ�v���j���[�̃n���h��
 �A+3	�u�@�\�̐ݒ�v���j���[�̃n���h��
 �B+idx	idx(0�`)�ڂɌ��������t�H���_���̃T�u�t�H���_�y�уt�@�C�����X�g��\
	�����郁�j���[�̃n���h���B0 �Ȃ烁�C�����j���[�̃n���h�����擾����B
 �C+id	id+1 �Ԗڂ̃A�v���ɑΉ��������j���[���ڂ�ID
 �D	���C����ʂ̃n���h��
 �D+1	OS��� (0=Windows95,NT4.0, 1=98, 2=Me,xp)
 �D+2	���j���[�ɃA�C�R����\������(0����)����(0)��
 �D+3	���������t�H���_�̌�
 �G+idx	idx(0�`)�ڂɌ��������t�H���_���́A �V���[�g�J�b�g�t�@�C���ꗗ�f�[�^
	�ւ̃|�C���^�B���p��� sample_06.as �������������B    [hdtp.as 9.93-]

 ���j���[�̃n���h���͎擾�����Ƃ���ł���܂�Ӗ����Ȃ��C�����܂�(^^;

 �� hdtp_req (������ϐ�),type

	type �Ŏw�肳�ꂽ��ނ̏��𕶎���^�ϐ��ɑ�����܂��B

 type	�擾�ł�����
 �P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P
 �E+id	���j���[ID�� id �̍��ڂɑΉ�����V���[�g�J�b�g�̃t���p�X���擾�B
	id �� (���̃��j���[��������t�H���_�ԍ�)*192 + (�t�H���_���ł̏���)
	�Ƃ����ӂ��Ɍ��܂��Ă���B
	�t�H���_�ԍ��� 1 ����ő� 64 �܂ŁB���Ԃ� 0 ����ő� 191 �܂ŁB
 �F	arxlc �{��(arxlc.exe)�̃t���p�X
 �F+1	arxlc �̃o�[�W����
 �F+2	arxlc �̋N���I�v�V����(cmdline)
 �F+3	arxlc �̃��[�g�t�H���_(�ʏ�� exedir)		    [hdtp.as 9.92-]
 �F+4	arxlc �̐ݒ�t�@�C��(�ʏ�� "arxlc.dat")	    [hdtp.as 9.92-]

 �� hdtp_func func,type

	func �Ŏw�肳�ꂽ��ނ̋@�\�����s���܂��B
	arxlc �̓��C�����j���[�̊Y�����ڂ��N���b�N�����ۂƓ������������܂��B

 func	�@�\
 �P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P
 arxlc.as 1237�s�ȍ~�� *runsysmenu ���Q�Ƃ��ĉ������B
 �Ⴆ��

 1	�����`���[�̏I��
 2	�����`���[�̍ċN��
 3	�����`���[�̐�����(readme.html)��\��
 4	�g���@�\��\��(plus.xpi ���N��)
 192�`	���̃��j���[ID�ɑΉ����郉���`���[���ڂ��N��

 ���̂悤�ɂȂ��Ă��܂��B
 sample_03.as �Ŋ��p����m�F�ł��܂��B

 ���Ahdtp.as 9.92 �ȏ�ł� func �������`���[���ڂɑΉ�����ID�̏ꍇ�̂݁A
 type �Ɉȉ��̐��l���w�肷�邱�ƂŁA���̍��ڂ̊g�����j���[���N���b�N����
 �ۂ̋@�\�����s�ł��܂��B

 type	�@�\
 �P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P
 0	�����N�����J��(type ���w�肵�Ȃ��Ƃ��̓���Ɠ���)
 1	�����N���t�H���_���J��
 2	�A�v���o�^/�폜
 3	�A�v���ړ�(��)(���ڂ��A�v���o�^����Ă���Ƃ��̂ݗL��)
 4	�A�v���ړ�(��)(�@�@�@�@�@�@�@�@�@�V�@�@�@�@�@�@�@�@�@)
 5	�����N���̕ύX
 6	�����N��̕ύX(�v���p�e�B�̕\��)

 �� hdtp_menu id

	id �Ŏw�肳�ꂽ���j���[��\�����A�I�����ʂ� stat �ɕԂ��܂��B

 id	�\������郁�j���[
 �P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P
 �A	�v���O�����A�C�R�����E�N���b�N���ꂽ��A�t�@�C����t�H���_�̃h���b�O
	���h���b�v�悾�������ɕ\�������g�����j���[�\���p���j���[
 �A+1	�g�����j���[
 �A+2	�u�����ڂ̐ݒ�v���j���[
 �A+3	�u�@�\�̐ݒ�v���j���[
 �B+idx	idx �ڂɌ��������t�H���_���̃T�u�t�H���_�y�уt�@�C�����X�g��\����
	�郁�j���[�B0 �Ȃ烁�C�����j���[�B

 ���A,�B�� hdtp_req �Ƌ���

 stat	�I������
 �P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P�P
 0	�L�����Z��
 ��� arxlc.as �̒�������������(���蔲��(��)�B

 sample_03/04.as �Ŋ��p����m�F�ł��܂��B

*/

	; �e�v���O�����Ƃ̒ʐM�ɗ��p���郁�b�Z�[�WID (WM_USER=$400 �ȏ�)
	; ���e�v���O�������̐ݒ�Ƌ���
	;	#const	global	wm_xpi	$500
	; �e�v���O�����̃��C����ʂ̃N���X��
	;	#define	global	clsname	"oniwnd1"
	; �e�v���O�����̃��C����ʂ̃^�C�g��(�L���v�V����)
	;	#define	global	appname	"arxlc"

	; hsgetmsg.as �� #include ����Ă��Ȃ��ꍇ�ɔ�����
	#ifndef get_message

		#uselib "hsgetmsg.dll"
		#func gm_setwndproc	gm_setwndproc	$202
		#func gm_setmessage	gm_setmessage	$202
		#func gm_getmessage	gm_getmessage	$202
		;dim msgval,16

	#endif

	; llmod.as �� #include ����Ă��Ȃ��ꍇ�ɔ�����
	#ifndef dllproc
	ll_retset dllret
	ll_libload D_USER,"user32"
	ll_getproc FNC_SendMessageA,"SendMessageA",D_USER
	#module

		; �G�Z dllproc (�{�� dllproc �Ɣ����Ɍ݊�)
		; �� stat �Ɍ��ʂ��Ԃ�Ȃ��A�G���[�_�C�A���O���\������Ȃ����ٗL��
		#deffunc dllproc str,val,int,int
		mref funcname,32 :mref prms,17 :mref prm_n,2 :mref dll_no,3
		ll_getproc func,funcname,dll_no
		ll_callfunc prms,prm_n,func :return

		; �G�Z sendmsg 
		; �� stat �ɂ͌��ʂ��Ԃ�Ȃ�
		#deffunc sendmsg val
		mref prms,16 :ll_callfunc prms,4,FNC_SendMessageA@ :return

		; �{�� getptr �݊�
		#deffunc getptr val,val
		mref ptr,16 :mref pval,1025
		if (pval&$FFFF=2) :mref var,25 :else :mref var,17
		ll_getptr var :ptr=dllret@ :return

	#global
	#endif

	; hdtp ���W���[��
	#module "hdtp"

		#deffunc hdtp_init
		; �ϐ��̏�����
		if hdtp_init_ {
		 mref bmscr,67
		 mref stt,64
		 sdim s ,512
		 sdim ss,512
		 getptr ps,s
		 getptr pss,ss
		}
		; arxlc �E�B���h�E�̌���
		s =clsname
		ss=appname+setfile@
		prm=ps,pss
		hwnd=0
		repeat 2
		 dllproc "FindWindowA",prm,2,D_USER@
		 if dllret@ {
		  if cnt=0 :hwnd=dllret@ :ss+="(ending)"
		  if cnt=1 :hwnd=0:stt=-2 :break
		 } else :if cnt=0 :stt=-1 :break
		loop
		if hwnd=0 :return
		; ���b�Z�[�W�擾�̂��߂̏���
		if hdtp_init_ {
		 gm_setwndproc@ bmscr.13
		 gm_setmessage@ bmscr.13,wm_xpi
		 hdtp_init_=0
		}
		stt=0
		return

		#deffunc hdtp_req val,int
		; �擾������̎�ނ����
		mref pval,1024 :mref infotype,1
		prm=hwnd,wm_xpi,0,bmscr.13
		;  ������^���
		if pval&$FFFF=2 {
		 prm.2=infotype<<2+2
		 sdim data,1024
		 mref var,24
		 i=0
		;  ���l�^���
		} else {
		 prm.2=infotype<<2
		 mref var,16
		}
		; ���擾�v�����b�Z�[�W�𑗐M
		sendmsg prm
		; �ԐM����Ă�������擾
		repeat
		 gm_getmessage@ msgval@
		 if msgval@=bmscr.13&(msgval@.1=wm_xpi) {
		  ; ������^���̎擾
		  if pval&$FFFF=2 {
		   if msgval@.2=0 :var=data :sdim data,64 :break
		   wpoke data,i,msgval@.2&$FFFF	:i+=2
		   wpoke data,i,msgval@.2>>16	:i+=2
		  ; ���l�^���̎擾
		  } else {
		   var=msgval@.2 :break
		  }
		 }
		 wait 1
		loop
		stt=0
		return

		#deffunc hdtp_func int,int
		mref funcid
		mref type,1
		prm=hwnd,wm_xpi,0,bmscr.13
		prm.2=funcid<<5+(type<<2)+1
		sendmsg prm
		stt=0
		return

		#deffunc hdtp_menu int
		mref id
		prm=hwnd,wm_xpi,0,bmscr.13
		prm.2=id<<2+3
		sendmsg prm
		repeat
		 gm_getmessage@ msgval@
		 if msgval@=bmscr.13&(msgval@.1=wm_xpi) :stt=msgval@.2 :break
		 wait 1
		loop
		return

	#global
	mref stt@hdtp,64
	hdtp_init_@hdtp=1


; �\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\
; (C) arc��arcis 2004
; arX Launcher ���݃T�C�g �� http://hp.vector.co.jp/authors/VA022483/arxlc/?
