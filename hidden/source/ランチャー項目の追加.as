
; �� �����`���[���ڂ�ǉ�
;							 �ŏI�X�V�� 04/09/23
; �\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\

; �h���b�O���h���b�v���ꂽ�t�@�C����t�H���_�������`���[���ڂƂ��Ēǉ����܂��B

; �� �A�g�@�\�̏�����

	; hdtp.as �p�̒�`
	; (arxlc �Ƃ̊ԂŃf�[�^�̂���������ۂ͉��L�̒l�ŌŒ�)
	#const	global	wm_xpi	$500
	#define	global	clsname	"oniwnd1"
	#define	global	appname	"arxlc"
	sdim setfile,1024 :setfile=cmdline

	; ���ߊg���ƕϐ��̏�����
	; �� hdtp.as ���ŏ��\�� llmod �Ƃ��ė��p
	#include "hdtp.as"
	; user32.dll
	#const FNC_CreatePopupMenu			0
	#const FNC_TrackPopupMenu			1
	#const FNC_InsertMenuItemA			2
	#const FNC_DestroyMenu				3
	#const FNC_FillRect				4
	; kernel32.dll
	#const FNC_GetShortPathNameA			5
	;
	#const global foldermax				32
	#module "arxlc_mod"
		; �|�C���^�̕������Ă���֐������s
		; �� ll_getproc ���Ƀ��C���Ŏ��s���Ă����Ă��邾���ŁA���� dllproc �Ɠ���
		#deffunc dllprocp int,val,int
			mref func :mref prms,17 :mref prm_n,2
			ll_callfunc prms,prm_n,func
		return
		; �������� dialog (�t�H���_�I�����j���[�t��)
		;	�O��	wid 5 �̃E�B���h�E����������
		;	�g�p�l	"p1"	/ ���͓��e�����l
		;		"p2"	/ �_�C�A���O�̃^�C�g��
		;	�߂�l	refstr	/ ���͓��e
		#deffunc dialoginput str,str
			mref s,32 :string=s		; �����l
			mref s,33			; �^�C�g��
			if dialoginput_ {
			 screen 5,320,120,6 :mref bmscr,67
			 prmex@=0,0,winx,winy
			 prm=bmscr.4,pprmex@,hbrush@
			 dllprocp pfunc@.FNC_FillRect@,prm,3
			 color col@,col@.1,col@.2 :line 4,85,winx-6,85
			 font "�l�r�o �S�V�b�N",12
			 color 0,0,0		:pos 6,10	:mes "�쐬����V���[�g�J�b�g�̃t�@�C��������͂��Ă��������B"
			 objmode 2,1
			 objsize winx-82,25	:pos 5,50	:input string
			 font "�l�r�o �S�V�b�N",10
			 objsize 70,25		:pos winx-75,50	:button "... �t�H���_",*dir
			 font "�l�r�o �S�V�b�N",12
			 objsize 65,25		:pos winx-150,92:button "OK",*ok
			 objmode 2,17
			 objsize 75,25		:pos winx-80,92	:button "�L�����Z��",*cancel
			 dialoginput_=0
			} else :gsel 5
			title s
			objprm 0,string
			gsel 5,1
			stop
			*dir
			if dialogdir_ {
			 ; ���j���[�̐���
			 foldernum=0
			 folderlist="\\\n"
			 curfoldernum=0
			 mii=44,$30+$12,0,0,0,0,0,0,0,pstring2,0,0
			 ; �e���j���[
			 gosub *nmenu
			 prm=hmenu :mii.4=100
			 string2="(���[�g�t�H���_���ɍ쐬)" :gosub *imenu
			 gosub *imenu_border
			 ; �q���j���[
			 foldernum++
			 repeat foldermax
			  ; �t�H���_���T�u�t�H���_����
			  notesel folderlist
			  notemax i
			  if curfoldernum>=i :break
			  noteget curfolder,curfoldernum
			  dirlist tmplist,rootdir@+curfolder+"*",5
			  notesel tmplist
			  notemax i
			  ; �T�u�t�H���_�����j���[���ڂɒǉ�
			  repeat  i
			   ; �T�u�t�H���_���擾
			   if foldernum>=foldermax :break
			   noteget string2,cnt
			   if curfoldernum=0 :if string2="hidden" :continue
			   folderlist+=curfolder+string2+"\\\n"
			   gosub *nmenu
			   ; ���̊K�w�ɃT�u���j���[�Ƃ��Ēǉ�
			   prm=hmenu.curfoldernum :mii.4=0,hmenu.foldernum :gosub *imenu_sub
			   ; ���g�̊K�w�Ƀ��j���[���ڂ�ǉ�
			   string2="( "+string2+" �t�H���_���ɍ쐬)"
			   prm=hmenu.foldernum :mii.4=foldernum+100,0 :gosub *imenu
			   gosub *imenu_border
			   ; 
			   foldernum++
			  loop
			  curfoldernum++
			 loop
			 dialogdir_=0
			}
			ginfo
			prm=hmenu,$182,prmx,prmy,0,bmscr.13,0
			dllprocp pfunc@.FNC_TrackPopupMenu@,prm,7
			if dllret@!0 {
			 ; �I�����ꂽ�t�H���_�̎擾
			 notesel folderlist
			 noteget string2,dllret@-100
			 strlen i,string2
			 strmid string2,string2,1,i-1
			 ; ���͂���Ă���t�@�C�����̎擾
			 i=0
			 repeat
			  instr ii,string,"\\",i
			  if ii=-1 :break
			  i+=ii+1
			 loop
			 strlen ii,string
			 strmid string,string,i,ii-i
			 ; �V�����t�@�C�����̕\��
			 string=string2+string
			 objprm 0,string
			}
			stop
			*cancel	:ref=""		:goto *@f
			*ok	:ref=string	:goto *@f
			*@	:gsel 5,-1	:return
			*nmenu
			dllprocp pfunc@.FNC_CreatePopupMenu@,prm
			hmenu.foldernum=dllret@	 :return
			*imenu_border
			mii.2=$800 :mii.4=0,0 :mii.9=0,0 :gosub *imenu
			mii.2=0 :mii.9=pstring2 :return
			*imenu_sub
			mii.1=$30+$12+$4 :gosub *imenu
			mii.1=$30+$12 :return
			*imenu
			if mii.9 :strlen mii.10,string2
			prm.1=-1,1,pmii
			dllprocp pfunc@.FNC_InsertMenuItemA@,prm,4
			return
	#global
	mref stt@arxlc_mod,64
	mref ref@arxlc_mod,65
	; �ėp�ϐ�
	sdim s,1024
	sdim ss,512
	;sdim code,4
	;dim i :dim ii
	;dim prm,16
	;dim prmex
	; dialoginput ���ߗp
	sdim string@arxlc_mod,512
	sdim string2@arxlc_mod,512
	;dim mii@arxlc_mod,12
	;dim pstring@arxlc_mod
	;dim pstring2@arxlc_mod
	dialoginput_@arxlc_mod=1
	dialogdir_@arxlc_mod=1
	sdim curfolder@arxlc_mod,512
	sdim tmplist@arxlc_mod,16384
	sdim folderlist@arxlc_mod,16384
	dim hmenu@arxlc_mod,foldermax

	; hdtp �̏�����
	instr i,setfile,",",0
	if i!-1 {
	 strlen ii,setfile
	 strmid s,setfile,i+1,ii-i-1
	 strmid setfile,setfile,0, i
	}
	hdtp_init
	if stat<0 {
	 dialog "arX Launcher ���N�����Ă��܂���B\n�v���O�C�����I�����܂��B"
	 end
	}

	; �����`���[���̎擾
	hdtp_req �F,6
	sdim apppath,512
	sdim rootdir,512
	sdim rootdir_,512
	hdtp_req apppath,�F
	hdtp_req rootdir,�F+3

; �� loadlib �֘A�̏�����

	; DLL �ǂݍ���
	;ll_libload D_USER,"user32"
	ll_libload D_KERNEL,"kernel32"

	; �|�C���^�擾(�ϐ�)
	getptr pstring@arxlc_mod,string@arxlc_mod
	getptr pstring2@arxlc_mod,string2@arxlc_mod
	getptr pmii@arxlc_mod,mii@arxlc_mod
	getptr pprmex,prmex

	; �|�C���^�擾(�֐�)
	;dim pfunc
	;   user32.dll
	;ll_getproc pfunc.FNC_GetSysColor		,"GetSysColor"			,D_USER
	;ll_getproc pfunc.FNC_GetSysColorBrush		,"GetSysColorBrush"		,D_USER
	ll_getproc pfunc.FNC_CreatePopupMenu		,"CreatePopupMenu"		,D_USER
	ll_getproc pfunc.FNC_TrackPopupMenu		,"TrackPopupMenu"		,D_USER
	ll_getproc pfunc.FNC_InsertMenuItemA		,"InsertMenuItemA"		,D_USER
	ll_getproc pfunc.FNC_DestroyMenu		,"DestroyMenu"			,D_USER
	ll_getproc pfunc.FNC_FillRect			,"FillRect"			,D_USER

	; ���̑�
	;  �V�X�e���F
	prm=15 :dllproc "GetSysColorBrush",prm,1,D_USER	:hbrush=dllret
	prm=16 :dllproc "GetSysColor"     ,prm,1,D_USER	:col=dllret&255,dllret>>8&255,dllret>>16&255

; �� �R�}���h���C���̉��
;	�o�͒l	filelist	/ �h���b�O���h���b�v���ꂽ�t�@�C���̃��X�g

	; "�t�@�C���p�X.1" "�t�@�C���p�X.2" ...

	sdim filelist,1024

	; �_�C�A���O��\��
	if s="" {

	dialog "*",16,"�V���[�g�J�b�g���쐬����t�@�C��"
	if stat=0 :end
	filelist=refstr

	; ���(�t�@�C���̃��X�g����)
	} else {

	instr i,s,"\"",0
	strlen ii,s

	;  �V���[�g�p�X���̘A��(���p�X�y�[�X��؂�)
	if i=-1 {
	 i=0
	 repeat ii
	  if i>=ii :break
	  instr prm,s," ",i
	  if prm=-1 :prm=ii-i
	  strmid ss,s,i,prm
	  filelist+=ss+"\n"
	  i+=prm+1
	 loop
	;  �����O�p�X���̘A��(�_�u���N�H�[�g�͂�+���p�X�y�[�X��؂�)
	} else {
	 i=1
	 s+=" \""
	 repeat ii
	  if i>=ii :break
	  instr prm,s,"\" \"",i
	  if prm=-1 :prm=ii-i
	  strmid ss,s,i,prm
	  filelist+=ss+"\n"
	  i+=prm+3
	 loop
	}

	}

; �� �V���[�g�J�b�g�̍쐬

	notesel filelist
	notemax max
	cur=1
	if rootdir!exedir :rootdir_=rootdir+"\\"

	*mklnk
	; �����N��t�@�C���̖��O���擾
	noteget s,cur-1	:ss=s
	code="\\"	:gosub *instr_
	strlen ii,s
	strmid ss,s,i,ii-i
	code="."	:gosub *instr_
	if i!0 :strmid ss,ss,0,i-1
	; �����N�̃t�@�C����������
	dialoginput ss,"�V���[�g�J�b�g�̍쐬("+cur+"/"+max+")"
	; �����N���쐬
	if refstr!"" {
	 exec "\""+apppath+"\" run:hidden\\mklnk.ax,\""+s+"\",,\""+rootdir_+refstr+"\""
	}
	if cur<max :cur++ :goto *mklnk

; �� �㏈��

	; ���j���[�n���h���̉��
	repeat foldermax
	 if hmenu@arxlc_mod.cnt :dllprocp pfunc.FNC_DestroyMenu,hmenu@arxlc_mod.cnt,1
	loop

	; �ċN���̊m�F
	dialog "�쐬�����V���[�g�J�b�g�������`���[���ڂƂ��ĔF�������邽�߁A\narxlc ���ċN�����܂��B��낵���ł����H\n\n�����ɋN�����Ă���v���O�C��������ꍇ�͏I�����ĉ������B",2
	if stat=6 :wait 20 :hdtp_func 2 ; �����`���[�̍ċN��

	end


; ss ���� code ���Ō�ɏo�Ă���ӏ����擾

*instr_
	i=0
	repeat
	 instr ii,ss,code,i
	 if ii=-1 :break
	 i+=ii+1
	loop
	return


; �\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\
; (C) arc��arcis 2004
; arX Launcher ���݃T�C�g �� http://hp.vector.co.jp/authors/VA022483/arxlc/?
