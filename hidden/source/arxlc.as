
; �� arX Launcher					    ����y�����`���[
; �\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\

	gsel 0,-1

; �\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\
; ���ߊg��
; �\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\

; �~�j llmod + ���j���[�쐬���W���[��

	ll_libload D_GDI,"gdi32"
	ll_libload D_USER,"user32"
	ll_libload D_SHELL,"shell32"
	ll_libload D_KERNEL,"kernel32"
	ll_retset dllret
	#module "arxlc_mod"

		#deffunc dllproc str,val,int,int
		mref funcname,32 :mref prms,17 :mref prm_n,2 :mref dll_no,3
		ll_getproc func,funcname,dll_no
		ll_callfunc prms,prm_n,func
		return

		#deffunc imenu str,int,int,int,int
		mref s,32 :mref id,1 :mref hbitmap,2 :mref hsubmenu,3 :mref hmenu,4
		sdim string,512 :string=s
		; MENUITEMINFO�\���̂��쐬
		dim mii,oschk@+11
		mii=oschk@*4+44,oschk@*$30+(hsubmenu!0*$4)+$12,0,0,id,hsubmenu
		if hbitmap!0 :mii.1+=$80 :mii.11=hbitmap :string="  "+string
		if string="" :mii.2=$800 :else :mii.2=0 :ll_getptr string :mii.9=dllret@ :strlen mii.10,string
		; ���j���[�ǉ�
		prm=hmenu,-1,1 :ll_getptr mii :prm.3=dllret@
		dllproc "InsertMenuItemA",prm,4,D_USER@
		return

	#global


; �\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\
; ����
; �\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\

; ��`

	noclickpop=1			; �N���b�N�����Ń��j���[�\��
	iconsize=32			; �A�C�R���\���T�C�Y�����l
	bandmode='r'			; ���j���[�\���揉���l
	#const bandsize		1	; ���j���[�\���敝
	#const foldermax	64	; �t�H���_�ǉ����̌��E
	#const filemax		192	; �t�@�C���ǉ����̌��E(�t�H���_����)

; �o�b�t�@�̊m��

	sdim folderlist,32768		; �t�H���_���X�g
	sdim filelist,16384,foldermax	; �t�@�C�����X�g(�t�H���_��)
	sdim curfolder,512		; ���݂̏����Ώۃt�H���_(���������g�p)
	sdim s,512			; �ėp
	sdim ss,16384			; �V

	; dim curfoldernum		; ���݂̏����Ώۃt�H���_�ԍ�
	dim hmenu,foldermax		; ���j���[�n���h��(�t�H���_��)
	dim hbmp,foldermax,filemax	; �r�b�g�}�b�v�n���h��(�t�@�C����)
	; dim i				; �ėp
	dim prm,37			; �V

; ���̎擾

	; ����I�v�V����(�R�}���h���C��)
	s=cmdline
	strlen i,s
	repeat i
	 peek i,s,cnt
	 if i='i' :strmid iconsize,s,prm,cnt-prm :int iconsize
	 if i='c' :noclickpop=0
	 if i='u'|(i='d')|(i='l') :bandmode=i
	 if i<'0'|(i>'9') :prm=cnt+1
	loop

	; loadlib.dll �֘A
	ll_getptr ss	:pss=dllret
	ll_getptr i	:pi=dllret
	prm=148 :ll_getptr prm
	dllproc "GetVersionExA",dllret,1,D_KERNEL
	if prm.4=1&(prm.1>=10)|(prm.4=2&(prm.1>=5)) :oschk=1

; ���̑�����

	; ���j���[�\�z�p�̏���������
	folderlist=exedir+"\n"
	onexit *exit
	buffer 3,,,0
	mref bmscr,67

	; �t�H���_�A�C�R���̍쐬
	prm=15 :dllproc "GetSysColor",prm,1,D_USER
	color dllret&255,dllret>>8&255,dllret>>16&255
	boxf
	palcolor 0
	boxf 1,2,7,2
	boxf 1,3,14,13
	palcolor 255
	boxf 2,3,6,3
	boxf 2,5,13,12
	gosub *bitblt :hbmpfolder=i


; �\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\
; ���j���[�̍\�z
; �\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\

; �t�@�C������

	repeat foldermax
	 curfoldernum=cnt

	 ; ��������t�H���_�̎擾
	 notesel folderlist
	 notemax prm
	 if curfoldernum>=prm :break
	 if curfoldernum=0 :gosub *newmenu :hmenu.curfoldernum=dllret
	 noteget curfolder,curfoldernum
	 curfolder+="\\"

	 ; �J�����g�t�H���_�ɐݒ�
	 skiperr 1 :chdir curfolder :i=err :skiperr 0
	 if i :continue

	 ; �t�H���_���T�u�t�H���_����
	 dirlist ss,"*",5
	 notesel ss
	 notemax i
	 repeat foldermax-prm-i*(prm+i>foldermax)+i
	  noteget s,cnt
	  folderlist+=curfolder+s+"\n"
	  gosub *newmenu
	  hmenu.prm=dllret
	  imenu s,0,hbmpfolder,hmenu.prm,hmenu.curfoldernum
	  prm++
	 loop

	 ; �t�H���_���t�@�C������
	 dirlist filelist.curfoldernum,"*.lnk",1
	 ss="" :dirlist ss,"*.url",1
	 filelist.curfoldernum+=ss
	 notesel filelist.curfoldernum
	 notemax prm
	 repeat filemax-prm*(prm>filemax)+prm
	  noteget s,cnt
	  ss=curfolder+s
	  noteadd ss,cnt,1
	  ; �t�@�C���A�C�R���t���@�\�� Windows 98,2000 �ȍ~�̂�
	  if oschk {
	   ; �A�C�R���擾
	   prm=bmscr.14,pss,pi
	   dllproc "ExtractAssociatedIconA",prm,3,D_SHELL
	   hbmp.curfoldernum.cnt=dllret
	   ; ��ʂ֕`�恕�A�C�R���n���h���J��
	   gcopy 3,iconsize,iconsize,iconsize,iconsize
	   prm=bmscr.4,0,0,hbmp.curfoldernum.cnt,iconsize,iconsize,0,0,3
	   dllproc "DrawIconEx",prm,9,D_USER
	   dllproc "DestroyIcon",hbmp.curfoldernum.cnt,1,D_USER
	   ; �`����e���r�b�g�}�b�v�I�u�W�F�N�g�ɕϊ�
	   gosub *bitblt :hbmp.curfoldernum.cnt=i
	  }
	  strlen i,s :strmid s,s,0,i-4
	  imenu s,curfoldernum+1*filemax+cnt,hbmp.curfoldernum.cnt,0,hmenu.curfoldernum
	 loop
	loop

; �V�X�e�����j���[�̕t��

	imenu "",0,0,0,hmenu
	imenu "�t�H���_���J��",10,0,0,hmenu
	imenu "arxlc �̍ċN��",2,0,0,hmenu
	imenu "arxlc �̏I��",1,0,0,hmenu


; �\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\
; ����҂�
; �\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\

; �����郁�C�����[�v

	repeat
	wait 5
	ginfo :stick i
	; ���j���[�̕\��
	if bandmode='u'&(prmy=0)|(bandmode='r'&(dispx-1=prmx))|(bandmode='l'&(prmx=0))|(bandmode='d'&(dispy-1=prmy))&(i&256!0|noclickpop) {
	 dllproc "SetForegroundWindow",bmscr.13,1,D_USER
	 prm=hmenu,$100,prmx,prmy,0,bmscr.13,0
	 dllproc "TrackPopupMenu",prm,7,D_USER
	 if dllret {
	  if dllret=1 :break
	  if dllret=2 {
	   prm=0,pss,509
	   dllproc "GetModuleFileNameA",prm,3,D_KERNEL
	   exec "\""+ss+"\" "+cmdline
	   break
	  }
	  if dllret=10	:exec exedir,16 :continue
	  i=dllret/filemax-1
	  notesel filelist.i
	  noteget s,dllret\filemax
	  skiperr 1 :exec s,16 :skiperr 0
	 }
	}
	loop


; �\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\
; �I��������
; �\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\

; �e��n���h���̉��

*exit
	s="DeleteObject"
	repeat curfoldernum
	 if hmenu.cnt {
	  prm=cnt
	  dllproc "DestroyMenu",hmenu.prm,1,D_USER
	  repeat filemax
	   if hbmp.prm.cnt!0 :dllproc s,hbmp.prm.cnt,1,D_GDI
	  loop
	 }
	loop
	if hbmpfolder!0 :dllproc s,hbmpfolder,1,D_GDI
	end


; �\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\
; �T�u���[�`��
; �\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\

; �V�����|�b�v�A�b�v���j���[���쐬����

*newmenu
	dllproc "CreatePopupMenu",prm,0,D_USER
	return

; ��ʏ�� (iconsize)px �l�����r�b�g�}�b�v�I�u�W�F�N�g�ɂ���

*bitblt
	ss="CreateCompatible"
	prm=bmscr.4,iconsize,iconsize
	dllproc ss+"Bitmap",prm,3,D_GDI :i.1=dllret
	dllproc ss+"DC",bmscr.4,1,D_GDI :i=dllret
	dllproc "SelectObject",i,2,D_GDI
	prm=i,0,0,iconsize,iconsize,bmscr.4,0,0,$CC0020
	dllproc "BitBlt",prm,9,D_GDI
	dllproc "DeleteDC",i,1,D_GDI
	i=i.1
	return


; �\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\
; (C) arc��arcis 2004
; arX Launcher ���݃T�C�g �� http://hp.vector.co.jp/authors/VA022483/arxlc/?
