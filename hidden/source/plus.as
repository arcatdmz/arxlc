
; �� Plus�I for arxlc ver.10.0x					    �g���@�\
;							 �ŏI�X�V�� 04/09/16
; �\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\

; ���C�����j���[�� [�g���@�\] ���N���b�N����Ǝ��s�����v���O�����ł��B
;
; hidden �t�H���_���� xpi �t�@�C���̃��X�g���쐬�E�\�����āA
; �I�����ꂽ�v���O�C�����N�����܂��B


; �\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\
; ����
; �\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\

; ��`�Ɩ��ߊg��

	#define	mydir	exedir+"\\hidden\\"
	ll_libload D_USER,"user32"
	ll_libload D_KERNEL,"kernel32"
	ll_retset dllret
	#module "arxlc_mod"
		#deffunc dllproc str,val,int,int
		mref funcname,32 :mref prms,17 :mref prm_n,2 :mref dll_no,3
		ll_getproc func,funcname,dll_no
		ll_callfunc prms,prm_n,func
		return
		#deffunc getptr val,val
		mref vptr,16 :mref pval_var,1025
		if (pval_var&$ffff=2) :mref var,25 :else :mref var,17
		ll_getptr var :vptr=dllret@
		return
	#global

; �ϐ��y�ѕϐ���񏉊���

	; ������^
	sdim s,512
	sdim ss,512
	sdim tmp,4096
	getptr ps,s
	getptr pss,ss

	; ���l�^
	mref bmscr,67
	hwnd=bmscr.13
	dim prmex,37
	getptr pprmex,prmex

; ���擾

	; ��������s����֐��ւ̃|�C���^
	ll_getproc FNC_InsertMenuItemA,"InsertMenuItemA",D_USER

	; Windows �̃o�[�W����
	prmex=148 :dllproc "GetVersionExA",pprmex,1,D_KERNEL
	if prmex.4=1&(prmex.1>=10)|(prmex.4=2&(prmex.1>=5)) :oschk=1

	; �v���O�C���̈ꗗ
	chdir mydir
	dirlist tmp,"*.xpi",1


; �\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\
; �v���O�C���ꗗ���j���[
; �\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\

; �쐬

	; ���j���[�̐V�K�쐬
	dllproc "CreatePopupMenu",prm,0,D_USER
	hmenu=dllret

	; ���j���[���ڂ̒ǉ�
	mii=oschk>0*4+44,(oschk>0*$30)+$12 :getptr mii.9,s
	prm=hmenu,-1,1	:getptr prm.3,mii
	notesel tmp	:notemax i
	repeat i
	 mii.4=cnt+100		; wID �̎w��
	 noteget s,cnt		; �����o�^���̎擾
	 strlen mii.10,s :mii.10-=4 :strmid s,s,0,mii.10
	 ll_callfunc prm,4,FNC_InsertMenuItemA
	loop

; �\��

	ginfo
	dllproc "SetForegroundWindow",hwnd,1,D_USER
	prm=hmenu,$182,prmx,prmy,0,hwnd,0
	dllproc "TrackPopupMenu",prm,7,D_USER
	i=dllret
	dllproc "DestroyMenu",hmenu,1,D_USER

; ���ʂɑΏ�

	if i!0 {
	 noteget s,i-100
	 run mydir+s,cmdline
	}

	end


; �\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\
; (C) arc��arcis 2004
; arX Launcher ���݃T�C�g �� http://hp.vector.co.jp/authors/VA022483/arxlc/?
