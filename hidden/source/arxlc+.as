
; �� arX Launcher 10.0x					    ����y�����`���[
;							 �ŏI�X�V�� 04/09/25
; �\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\

	#define appname		"arxlc"
	#define appver		"9.93b2"
	#define appvers		appname+" v."+appver+setfile_ex
	#const appveri		9922


; �� �ꌾ;
;
; API �g������ ... orz
; �ł����A���̃\�t�g�E�F�A�쐬��ʂ��āA
; �{���ɐF�X�Ȃ��Ƃ�׋������Ē����܂����B
; ��Ƃ��ƂĂ��y���������ł��B
;
; ��N���炢�O API �̎g�����������炸�r���ɕ��Ă������������������v���܂��B
;
; �����������ɂȂ��Ă���̂� HSP ���[�U�[�̕��ł�����A
; ���� hdtp.as �𗘗p���ă����`���[�̃v���O�C��������ėV��ł݂ĉ������B
;
; �債���A�g�͂ł��܂��񂪁A"�q�����Ă�" �����y���߂܂�(�L�[�M)�B
; �ڍׂȐ����� hidden �t�H���_���� readme.txt �ɏ����Ă���܂��B
;
; �� ���L;
;
; ���̃X�N���v�g�́Ahsgetmsg.dll �������Ɠ��삵�܂���B
; hsgetmsg.dll(hsgmrtc.hrt) �ɂ��Ă͎��� Copyright �������������B
;
; ���̃X�N���v�g�y�уX�N���v�g���R���p�C�����Đ����������s�t�@�C�����g�p
; �������ʂ����Ȃ鎖�ԂɊׂ����Ƃ��Ă� arc��arcis �͈�ؕۏ؂ł��܂���B
;
; �� Copyright;
;
; �F�X�ȕ��̑��푽�l�ȃT�C�g�ŏ��𒲂ׂ����Ē������ŁA
; ���쌠�Ƃ������̂���̉��Ȃ̂�������Ȃ��Ȃ��ė��܂����B
; �Ƃ肠�����݂�Ȃ����a�Ȃ炻��ŗǂ��Ǝv���܂��B
; ���߂�Ȃ����Ӗ��s���ł��B
;
; �Ƃɂ������̏���؂�āA
; �L�v�ȏ������J����Ă���S�Ă̕��X�Ɍ��\���グ�܂��B
;
; ���A�t�@�C���Ȃǂ̌`�Ŕz�z����Ă��蒘�쌠�̏��݂����m�Ȃ��̂�
;
; hsgmrtc.hrt			���傭�Ǝ�
; COM����p�}�V����R�[�h	����(lollipop ���W���[�����ꕔ���p)
;
;	�z�z��; ���傭�Ƃ̃y�[�W
;	http://yokohama.cool.ne.jp/chokuto/
;
; �ł��B
;
; �����W�̍ۂɎ�Ƃ��ė��p�����Ē������T�C�g��
;
;	���傭�Ƃ̃y�[�W
;	http://yokohama.cool.ne.jp/chokuto/
;
;	HSP-NEXT
;	http://www.silkroad.ne.jp/Sakura/
;
;	Codian
;	http://www.kab-studio.biz/Programing/Codian/
;
;	Win32 API by Object Pascal of Delphi
;	http://homepage2.nifty.com/Mr_XRAY/Halbow/
;
;	MSDN ���C�u����
;	http://www.microsoft.com/japan/msdn/library/
;
; �ł��B
;
; ���̃X�N���v�g�S�̂̒��쌠�͑��� arc��arcis ���ۗL���Ă��邱�ƂɂȂ����
; �Ǝv���܂����A�Q�l�ɂȂ镔���������ЂƂ�����ł�����΁A�����R�ɓ]�p����
; �����Ĉ���ɍ\���܂���B
;
; ���Ȃ݂ɁA���W���[���Ŋg�����Ă��閽�߂́A���C���Ŏg�p���Ă���ϐ������
; �ŗ��p���Ă����肩�Ȃ蕪����h�����Ƃ����Ă���̂œ]�p�ɂ͌����܂���(^^;
;
; �� �X�V����;
;
;	04/09/06 (990)	�����J��
;	04/09/07 (991)	�F�̃J�X�^�}�C�Y�@�\�t��
;	04/09/19 (992)	�t�H���_�o�^���̌��E��ύX(64��32)
;			Windows XP SP2�̃������ی�@�\(DEP)�ɑΉ�
;			���j���[�A�C�R����\�����̏����������y�ʉ�
;			����ȃV���[�g�J�b�g("�}�C �R���s���[�^"��)�ɑΉ�
;			����R�}���h���C���ɂ��V�X�e���ݒ�ύX�@�\��ǉ�
;			(���ݒ�t�@�C���ƃ��[�g�t�H���_�̃p�X��ύX�\��)
;			�V�X�e���g�p�I�u�W�F�N�g�t�@�C���̊g���q�� ax �ɕύX
;			�ŏ����{�^���������̋����ύX(��ʃT�C�Y�ύX���ŏ���)
;			�R�}���h���C���w��̎d�l��̖����C��(synciconsize)
;	04/09/19 (993b)	hsgetmsg ver.1.3 �� 1.4�� �ɍ����ւ�
;			dllprocp ����(�@�\�� ll_callfunc �Ɠ���)���}�N����
;	04/09/25(993b2)	hsgetmsg ver.1.4�� �� 1.4��3 �ɍ����ւ�
;			filelist.folderid �ւ̒��ڂ̃A�N�Z�X���\��(hdtp)

; �\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\
; ���ߊg��
; �\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\

; �~�j llmod + �e�햽�ߊg��

	; hsgmrt
	#uselib "hsgetmsg.dll"
	#func gm_setwndproc	gm_setwndproc	$202
	#func gm_setmessage	gm_setmessage	$202
	#func gm_getmessage	gm_getmessage	$202
	; loadlib
	ll_libload D_GDI,"gdi32"
	ll_libload D_USER,"user32"
	ll_libload D_SHELL,"shell32"
	ll_libload D_KERNEL,"kernel32"
	ll_libload D_OLE,"ole32"
	ll_retset dllret
	#const funcs					37
	; gdi32.dll
	#const FNC_CreateCompatibleDC			0
	#const FNC_CreateCompatibleBitmap		1
	#const FNC_SelectObject				2
	#const FNC_BitBlt				3
	#const FNC_DeleteObject				4
	#const FNC_DeleteDC				5
	; user32.dll
	#const FNC_SetForegroundWindow			6
	#const FNC_SetWindowLongA			31
	#const FNC_CreateWindowExA			29
	#const FNC_CreatePopupMenu			7
	#const FNC_TrackPopupMenu			8
	#const FNC_InsertMenuItemA			9
	#const FNC_GetMenuItemInfoA			10
	#const FNC_SetMenuItemInfoA			11
	#const FNC_DestroyMenu				12
	#const FNC_FillRect				13
	#const FNC_DrawIconEx				14
	#const FNC_DestroyIcon				15
	#const FNC_GetSysColor				32
	#const FNC_SendMessageA				30
	#const FNC_CloseWindow				34
	#const FNC_OpenIcon				35
	; shell32.dll
	#const FNC_SHFileOperationA			16
	#const FNC_SHGetPathFromIDListA			33
	#const FNC_Shell_NotifyIconA			17
	#const FNC_ShellExecuteExA			18
	#const FNC_DragAcceptFiles			19
	#const FNC_DragQueryFileA			20
	#const FNC_DragFinish				21
	#const FNC_ExtractIconExA			22
	#const FNC_ExtractAssociatedIconA		23
	; kernel32.dll
	#const FNC_MultiByteToWideChar			24
	#const FNC_GetFileAttributesA			25
	#const FNC_GetShortPathNameA			26
	#const FNC_VirtualProtect			36
	; ole32.dll
	#const FNC_CLSIDFromString			27
	#const FNC_IIDFromString			28
	; ���W���[�����ŗ��p����l�̂��߁A#module ���O�Œ�`
	#const appmax		24	; �ł��悭�g���v���O����(�A�v��)�o�^���̌��E
	#const mg_left		15	; ����{�^���p�̈敝
	; ���̑��̖��ߊg��

	#module "arxlc_mod"

		; �G�Z dllproc (�{�� dllproc �Ɣ����Ɍ݊�)
		; �� stat �Ɍ��ʂ��Ԃ�Ȃ��A�G���[�_�C�A���O���\������Ȃ����ٗL��
		#deffunc dllproc str,val,int,int
		mref funcname,32 :mref prms,17 :mref prm_n,2 :mref dll_no,3
		ll_getproc func,funcname,dll_no
		ll_callfunc prms,prm_n,func :return

		; �|�C���^�̕������Ă���֐������s
		; �� ll_getproc ���Ƀ��C���Ŏ��s���Ă����Ă��邾���ŁA���� dllproc �Ɠ���
		#define global dllprocp(%1,%2,%3=0) ll_callfunc %2,%3,%1

		; �{�� getptr �݊�
		#deffunc getptr val,val
		mref vptr,16 :mref pval_var,1025
		if (pval_var&$ffff=2) :mref var,25 :else :mref var,17
		ll_getptr var :vptr=dllret@
		return

		; ANSI��UNICODE�ϊ� (COM�p)
		;	�g�p�l	p1	/ �ϊ����镶����
		#deffunc uni val
		mref wc,24
		strlen prm.5,wc :prm.5++ :sdim mb,prm.5+1 :mb=wc
		prm=0,0,0,-1
		getptr prm.2,mb
		getptr prm.4,wc
		prm.5=prm.5*2
		dllprocp pfunc@.FNC_MultiByteToWideChar@,prm,6
		return

		; ���j���[���ڂ̒ǉ�
		;	�g�p�l	"p1"	/ ���ڕ\��������
		;		p2	/ ���j���[����ID
		;		p3	/ �r�b�g�}�b�v�I�u�W�F�N�g�̃n���h��(�������0)
		;		p4	/ ���ډ��̃T�u���j���[�̃n���h��
		;		p5	/ ���ڒǉ���̃��j���[�̃n���h��
		#deffunc imenu str,int,int,int,int
		mref s,32 :mref id,1 :mref hbitmap,2 :mref hsubmenu,3 :mref hmenu,4
		string=s
		;  MENUITEMINFO�\���̂��쐬
		mii@=oschk@>0*4+44,(hsubmenu!0*$4)+(oschk@>0*$30)+$12,0,0,id,hsubmenu,0,0,0,0,0,0
		if hbitmap!0&(oschk_@>0) :mii@.1+=$80 :mii@.11=hbitmap :string="  "+string
		if string="" :mii@.2=$800 :else {
		 if string="|" :mii@.2=$10 :else {
		  mii@.2=0 :mii@.9=pstring :strlen mii@.10,string
		 }
		}
		;  ���j���[�ǉ�
		prm=hmenu,-1,1,pmii@
		dllprocp pfunc@.FNC_InsertMenuItemA@,prm,4
		return

		; GetMenuItemInfoA
		;	�g�p�l	p1	/ �������鍀�ڂ̂��郁�j���[�̃n���h��
		;		p2	/ �������鍀�ڂ�ID
		#deffunc getmii int,int
		mref hmenu :mref id,1
		prm=hmenu,id,0,pmii@ :dllprocp pfunc@.FNC_GetMenuItemInfoA@,prm,4
		return

		; SetMenuItemInfoA
		;	�g�p�l	p1	/ �ݒ肷�鍀�ڂ̂��郁�j���[�̃n���h��
		;		p2	/ �ݒ肷�鍀�ڂ�ID
		#deffunc setmii int,int
		mref hmenu :mref id,1
		prm=hmenu,id,0,pmii@ :dllprocp pfunc@.FNC_SetMenuItemInfoA@,prm,4
		return

		; ���j���[���ڂ̕\��������ύX
		;	�g�p�l	"p1"	/ �\��������
		;		p2	/ �ύX���鍀�ڂ�ID
		;		p3	/ �ύX���鍀�ڂ̂��郁�j���[�̃n���h��
		#deffunc tmenu str,int,int
		mref s,32 :mref id,1 :mref hmenu,2
		string=s
		; ������
		mii@.1=oschk@>0*$30+(oschk_@>0*$80)+$10	; dwTypeData, hbmpItem �̎擾
		mii@.9=pstring2
		getmii hmenu,id
		; �A�C�R���t�����j���[���ڂł͕�����O�ɃX�y�[�X�t��
		if oschk_@>0 :mii@.1-=$80 :if mii@.11!0 :string="  "+string
		; ������ύX
		mii@.9=pstring :strlen mii@.10,string
		setmii hmenu,id
		return

		; ���j���[�̃|�b�v�A�b�v
		;	�g�p�l	p1	/ �|�b�v�A�b�v���郁�j���[�̃n���h��
		;		p2	/ �}�E�X���W�𖽗ߓ��Ŏ擾����(0)����(1)��
		;		p3	/ �A�N�e�B�u�ɂ���E�B���h�E�̃n���h��
		#deffunc pmenu int,int
		mref hmenu,0
		mref ginfo_flag,1
		if ginfo_flag=0	:ginfo
		dllprocp pfunc@.FNC_SetForegroundWindow@,hwnd@,1
		prm=hmenu,$182,prmx,prmy,0,hwnd@,0
		dllprocp pfunc@.FNC_TrackPopupMenu@,prm,7
		return

		; �g���C�A�C�R���̏�����
		#deffunc ntray
		prm=0 :prmex@=88,hwnd@,0,3,$499,hicon@
		gosub *@f
		return

		; �g���C�A�C�R���\��������̐ݒ�
		;	�g�p�l	"p1"	/ �\��������
		#deffunc ttray str
		prm=1 :prmex@=88,hwnd@,0,4,$499,hicon@
		mref s,32 :poke prmex@,24,s
		gosub *@f
		return

		; �g���C�A�C�R���̏���
		#deffunc ctray
		prm=2 :prmex@=88,hwnd@,0,4,$499,hicon@
		gosub *@f
		return

		*@
		prm.1=pprmex@
		dllprocp pfunc@.FNC_Shell_NotifyIconA@,prm,2
		return

		; �`�b�v�w���v�̐ݒ�
		;	�g�p�l	p1	/ �\��������
		;		p2	/ �A�v��ID (appmax �ȏ�Ȃ� p3 �ȉ����g�p)
		;		p3-p7	/ ��`�̈�
		#deffunc tiphelp str,int,int,int,int,int
		mref s,32 :mref appid,1
		; ToolInfo �\���̂̍쐬
		;  ����(��`�̈�̎w��; ��s�������Ȃ邩�玖�O��)
		if appid>=appmax@ {
		 repeat 4 :mref ii,2+cnt :i.cnt=ii :loop
		} else {
		 i	=appid*(sysiconsize@+mg@)+mg@+mg_left@+mg_girth@,mg@+mg_girth@
		 i.2	=i+sysiconsize@,i.1+sysiconsize@
		}
		;  �쐬
		;	cbSize	,uFlags	,hwnd	,uId	,Rect		,hInst	,lpszText
		prmex@=	40	,16	,hwnd@	,appid	,i,i.1,i.2,i.3	,hinst@	,pstring
		; �O��쐬�����`�b�v�w���v�̍폜 (WM_USER+5)
		if appid<appmax@ {
		 if apptip@.appid {
		  prm=hwnd_tip@,1029,0,pprmex@	:dllprocp pfunc@.FNC_SendMessageA@,prm,4
		 } else :apptip@.appid=1
		}
		; �`�b�v�w���v�̓o�^ (WM_USER+4)
		string=s
		if string!"" {
		 prm=hwnd_tip@,1028,0,pprmex@	:dllprocp pfunc@.FNC_SendMessageA@,prm,4
		}
		return

		; �r�b�g�}�b�v�I�u�W�F�N�g�ƃf�o�C�X�Ԃł� gcopy
		;	�g�p�l	p1	/ gcopy ��̃f�o�C�X�R���e�L�X�g(p7=0)�܂��̓r�b�g�}�b�v�I�u�W�F�N�g(1)
		;		p2-p5	/ gcopy �T�C�Y�w��
		;		p6	/ gcopy ���̃f�o�C�X�R���e�L�X�g(p7=1)�܂��̓r�b�g�}�b�v�I�u�W�F�N�g(0)
		;		p7	/ �r�b�g�}�b�v�I�u�W�F�N�g���ʗp�t���O
		#deffunc bitbltex int,int,int,int,int,int,int
		mref hto,0 :mref px_,1 :mref py_,2 :mref sx,3 :mref sy,4 :mref hfrom,5
		mref bitmap,6	; 0 dc->bitmap / 1 hbitmap->dc
		px=px_ :py=py_
		if bitmap :hdcex@.1=hfrom :else :hdcex@.1=hto
		gosub *@f
		if bitmap :hfrom=hdcex@ :else :hto=hdcex@
		prm=hto,px,py,sx,sy,hfrom,0,0,$CC0020
		dllprocp pfunc@.FNC_BitBlt@,prm,9
		hdcex@.1=hbmpblank@ :gosub *@f
		return
		*@ :dllprocp pfunc@.FNC_SelectObject@,hdcex@,2 :return

		; �u���V�ɂ�� boxf
		;	�g�p�l	p1-p4	/ ��`�̈�
		;		p5	/ �u���V�̃n���h��
		#deffunc boxf_ int,int,int,int,int,int
		mref left :mref top,1 :mref right,2 :mref bottom,3
		mref hdc,4 :mref hbrush,5
		prmex@=left,top,right,bottom
		prm=hdc,pprmex@,hbrush
		dllprocp pfunc@.FNC_FillRect@,prm,3
		return

		; ���� exist
		;	�g�p�l	p1	/ ���݂��m�F����t�@�C���܂��̓t�H���_��
		;	�߂�l	stat	/ ���݂��Ȃ�(0),�t�@�C��(1),�t�H���_(-1)
		#deffunc exist_ str
		mref s,32 :string=s
		dllprocp pfunc@.FNC_GetFileAttributesA@,pstring,1
		if dllret@=-1 :stt=0	:return	; ���݂��Ȃ�
		if dllret@&$10:stt=-1	:return	; �t�H���_
		stt=1
		return

		; ���@�\ exec
		; PIDL ���g�p�����ꍇ�͂��̉���܂ň����󂯂܂��B
		;	�g�p�l	p1	/ �t�@�C��
		;		p2	/ �t�@�C���ɓn���R�}���h���C��
		;		pidl@	/ �A�C�e��ID���X�g�ւ̃|�C���^
		;		tmp@	/ ���샂�[�h
		#deffunc exec_ val,val
		mref s,24 :string=s
		mref ss,25 :string2=ss
		; SHELLEXECUTEINFO �\���̂̍쐬
		prmex@=60,pidl@!0*4,hwnd@,ptmp@,pidl@=0*pstring,0,0,1,0,pidl@,0,0,0,0,0
		if string2!"" :prmex@.5=pstring2 ; �R�}���h���C��
		dllprocp pfunc@.FNC_ShellExecuteExA@,pprmex@,1
		; PIDL �p�������̈�̉��
		if pidl@!0 {
		 prmex@=pidl@ :prm=pprmex@,1,5,pMalloc@
		 ll_callfunc prm,4,pCallMethod@
		}
		return

		; �������� dialog
		;	�O��	wid 5 �̃E�B���h�E����������
		;	�g�p�l	"p1"	/ ���͓��e�����l
		;		"p2"	/ �_�C�A���O�̃^�C�g��
		;	�߂�l	refstr	/ ���͓��e
		#deffunc dialoginput str,str
		mref s,32 :string=s		; �����l
		mref s,33			; �^�C�g��
		if dialoginput_ {
		 screen 5,240,85,6 :mref bmscr,67
		 boxf_ 0,0,240,160,bmscr.4,hbrush@
		 color col@,col@.1,col@.2 :line 4,50,winx-6,50
		 font "�l�r�o �S�V�b�N",12
		 objmode 2,1
		 objsize winx-10,25	:pos 5,15	:input string
		 objsize 65,25		:pos 90,57	:button "OK",*ok
		 objmode 2,17
		 objsize 75,25		:pos 160,57	:button "�L�����Z��",*cancel
		 dialoginput_=0
		} else :gsel 5
		title s
		objprm 0,string
		gsel 5,1
		stop
		*cancel	:ref=""		:goto *@f
		*ok	:ref=string	:goto *@f
		*@	:gsel 5,-1 :gsel 4,1 :return

	#global
	mref stt@arxlc_mod,64
	mref ref@arxlc_mod,65
	sdim string@arxlc_mod,512
	sdim string2@arxlc_mod,1024
	; dim pstring@arxlc_mod
	; dim pstring2@arxlc_mod
	getptr pstring@arxlc_mod,string@arxlc_mod
	getptr pstring2@arxlc_mod,string2@arxlc_mod
	dialoginput_@arxlc_mod=1


; �\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\
; ����
; �\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\

; ��`

	sdim rootdir,512
		rootdir=	exedir
	#define	setdir		"hidden"
	#define setfile_default	"arxlc.dat"
		setfile_=	setfile_default
	#define	setfile		exedir+"\\"+setdir+"\\"+setfile_
	#define	extfile_	setdir+"\\plus.ax"
	#define	extfile		exedir+"\\"+extfile_
	#define	hlpfile		exedir+"\\readme.html"
	#const	wm_xpi		$500	; �v���O�C���Ƃ̏������p
					; �@�@�@�E�B���h�E���b�Z�[�WID
	#const	setmax_thisver	17	; �ݒ荀�ڐ�
	#const	foldermax	32	; �t�H���_�ǉ����̌��E
	#const	filemax		192	; �t�@�C���ǉ����̌��E(�t�H���_����)

; �o�b�t�@�̊m�ۂƏ����ݒ�l�̑��

	; ������^
	sdim filelist,16384,foldermax	; �t�@�C�����X�g(�t�H���_��)
	sdim curfolder,512		; ���݂̏����Ώۃt�H���_(���������g�p)
	sdim myself,512			; �����̃t�@�C����
	sdim apptitle,256,appmax	; �A�v���̃`�b�v�w���v�\��������
	setfile_ex=""			; �ݒ�t�@�C����(�^�C�g���\���p)
	sdim s,1024			; �ėp
	sdim ss,16384			; �V
	sdim tmp,32768			; �V
	; ���l�^
	; dim msgval,16			; �E�B���h�E���b�Z�[�W�擾��
	dup msg,msgval.1		; �V�@�@�@�@�@�@�@�@�@�R�[�h
	dup wprm,msgval.2		; �V�@�@�@�@�@�@�@�@�@wParam
	dup lprm,msgval.3		; �V�@�@�@�@�@�@�@�@�@lParam
	; dim oschk			; imenu �S�ʂ̓��씻�ʗp OS ��� (0=95/NT4.0, 1=98, 2=2000/xp)
	; dim oschk_			; imenu ���j���[�A�C�R�����씻�ʗp OS ��� (oschk=1,2 �̊��� 0 �ɂ��Ă���薳��)
	; dim mii,12			; MENUITEMINFO �\����
	; dim col,3			; �V�X�e���F(�e)
	dim appid,appmax		; �A�v�����
	dim apptip,appmax		; �A�v���̃`�b�v�w���v���������
	curappli=-1			; ���݃A�N�e�B�u�ȃA�v���̔ԍ�
	hov=-1,-1			; ����{�^����Ƀ}�E�X�J�[�\��������(1)����(0)��
	dup hovclosebtn,hov.0		; ����{�^����Ƀ}�E�X�J�[�\��������(1)����(0)��
	dup hovminmzbtn,hov.1		; �ŏ����{�^����Ƀ}�E�X�J�[�\��������(1)����(0)��
	; dim curfoldernum		; ���݂̏����Ώۃt�H���_�ԍ�
	; dim pidl			; �A�C�e��ID���X�g�ւ̃|�C���^ (ShellExecuteExA �p)
	; dim restart			; �I���������ċN���t���O (1=����, 0=���Ȃ�)
	; dim i				; �ėp
	; dim ii			; �V
	dim prmex,128			; �V
	; ���l�^(arxlc �̐ݒ�)
	dim setting,setmax_thisver	; arxlc �̐ݒ�
	; setting=appveri		; �o�[�W�������
	dup setmax,setting.1		; �O��I�����ɕۑ����ꂽ�ۂ̐ݒ荀�ڐ�
	dup mainx,	setting.2	; ���C����ʂ̈ʒu
	dup mainy,	setting.3	; �������ʒu
	setting.2=dispx-sysiconsize/2,dispy-sysiconsize/2
	dup iconsize,	setting.4	; ���j���[�A�C�R���̑傫��
	iconsize=		32	;
	dup sysiconsize,setting.5	; �A�v���A�C�R��(���C����ʂɕ\�������A�C�R��)�̑傫��
	sysiconsize=		32	;
	dup synciconsize,setting.6	; �A�v���A�C�R���̑傫�������j���[�A�C�R���ɍ��킹�邩
	synciconsize=		1	;
	dup bandmode,	setting.7	; ���j���[�\����('n' �ŕ\���u���Ȃ��v)
	bandmode=	       'u'	;
	; dup bandsize,	setting.8	; ���j���[�\���敝	���v�]�ɂ���Ă͕ύX�@�\��ǉ��\��
	; bandsize=		1	;
	dup noclickpop,	setting.9	; �N���b�N�����Ń��j���[��\�����邩(1)��(0)��
	noclickpop=		1	;
	dup mg_girth,	setting.10	; ���C����ʘg��
	mg_girth=		2	;
	dup mg,		setting.11	; �A�v���A�C�R���Ԋu
	mg=			2	;
	dup minimized,	setting.12	; �ŏ����t���O
	dup forelock,	setting.13	; �őO�ʕ\���t���O
	dup appnum,	setting.15	; ���ݗ��p����Ă���A�v����
	dup cmg_girth,	setting.16	; ���C����ʘg�F
	; dup cmg,	setting.17	; �A�v���A�C�R���Ԋu�F	���v�]�ɂ���Ă͕ύX�@�\��ǉ��\��
	; dup cmg_shadow,setting.18	; �@�@�@�@�V�@�@�@�e�F	��
	; dup cbtn,	setting.19	; �V�X�e���{�^���F	��
	; dup cbtn_shadow,setting.20	; �@�@�@�@�V�@�@�e�F	��
	;	mg_left
	;	 �� ��sysiconsize
	;	 �� ����mg      mg_girth+mg_hover
	;	 �� ����        ��
	;	�������������c������mg_girth
	;	��������ap��... ����sysiconsize
	;	�������������c������mg_girth+mg_hover
	;	��mg_girth
	;#const mg_left		15	; ����{�^���p�̈敝
	#const mg_hover	1		; �A�N�e�B�u���A�A�v���A�C�R���ړ���
	; ���l�^(�n���h��)
	; dim hicon			; �v���O�����̎��A�C�R���̃n���h��
	; dim hbrush			; �V�X�e���F�̃u���V�̃n���h��
	; dim hinst			; ���C����ʂ̃C���X�^���X�n���h��
	; dim hwnd			; ���C����ʂ̃E�B���h�E�n���h��
	; dim hdc			; ���C����ʂ̃f�o�C�X�R���e�L�X�g
	; dim hdcex			; �ꎞ�����p�̃f�o�C�X�R���e�L�X�g
	dim hmenu,foldermax		; ���j���[�n���h��(�t�H���_��)
	; dim hmenus,16			; ���j���[�n���h��(�V�X�e���g�p)
	dup hmenu_ex,hmenus		;
	dup hmenu_modlink,hmenus.1	;
	dup hmenu_setting1,hmenus.2	;
	dup hmenu_setting2,hmenus.3	;
	dim hbmp,foldermax,filemax	; �r�b�g�}�b�v�n���h��(�t�@�C����)

; ���̎擾

	; loadlib.dll �֘A
	;  �|�C���^
	getptr ps,s :getptr pss,ss :getptr ptmp,tmp
	getptr pi,i :getptr pii,ii
	getptr pprmex,prmex
	getptr pmii,mii
	dim pfilelist,foldermax		; ��Ŏ擾
	;  �|�C���^(�p�o�֐�/������Ăяo���֐��ɂ��Ă͑S�Ď擾)
	dim pfunc,funcs
	;   gdi32.dll
	ll_getproc pfunc.FNC_CreateCompatibleDC		,"CreateCompatibleDC"		,D_GDI
	ll_getproc pfunc.FNC_CreateCompatibleBitmap	,"CreateCompatibleBitmap"	,D_GDI
	ll_getproc pfunc.FNC_SelectObject		,"SelectObject"			,D_GDI
	ll_getproc pfunc.FNC_BitBlt			,"BitBlt"			,D_GDI
	ll_getproc pfunc.FNC_DeleteObject		,"DeleteObject"			,D_GDI
	ll_getproc pfunc.FNC_DeleteDC			,"DeleteDC"			,D_GDI
	;   user32.dll
	ll_getproc pfunc.FNC_GetSysColor		,"GetSysColor"			,D_USER
	;ll_getproc pfunc.FNC_GetSysColorBrush		,"GetSysColorBrush"		,D_USER
	ll_getproc pfunc.FNC_SetForegroundWindow	,"SetForegroundWindow"		,D_USER
	ll_getproc pfunc.FNC_SetWindowLongA		,"SetWindowLongA"		,D_USER
	ll_getproc pfunc.FNC_CreateWindowExA		,"CreateWindowExA"		,D_USER
	ll_getproc pfunc.FNC_CreatePopupMenu		,"CreatePopupMenu"		,D_USER
	ll_getproc pfunc.FNC_TrackPopupMenu		,"TrackPopupMenu"		,D_USER
	ll_getproc pfunc.FNC_InsertMenuItemA		,"InsertMenuItemA"		,D_USER
	ll_getproc pfunc.FNC_GetMenuItemInfoA		,"GetMenuItemInfoA"		,D_USER
	ll_getproc pfunc.FNC_SetMenuItemInfoA		,"SetMenuItemInfoA"		,D_USER
	ll_getproc pfunc.FNC_DestroyMenu		,"DestroyMenu"			,D_USER
	ll_getproc pfunc.FNC_FillRect			,"FillRect"			,D_USER
	ll_getproc pfunc.FNC_DrawIconEx			,"DrawIconEx"			,D_USER
	ll_getproc pfunc.FNC_DestroyIcon		,"DestroyIcon"			,D_USER
	ll_getproc pfunc.FNC_SendMessageA		,"SendMessageA"			,D_USER
	ll_getproc pfunc.FNC_CloseWindow		,"CloseWindow"			,D_USER
	ll_getproc pfunc.FNC_OpenIcon			,"OpenIcon"			,D_USER
	;   shell32.dll
	ll_getproc pfunc.FNC_SHFileOperationA		,"SHFileOperationA"		,D_SHELL
	ll_getproc pfunc.FNC_SHGetPathFromIDListA	,"SHGetPathFromIDListA"		,D_SHELL
	ll_getproc pfunc.FNC_Shell_NotifyIconA		,"Shell_NotifyIconA"		,D_SHELL
	ll_getproc pfunc.FNC_ShellExecuteExA		,"ShellExecuteExA"		,D_SHELL
	ll_getproc pfunc.FNC_DragAcceptFiles		,"DragAcceptFiles"		,D_SHELL
	ll_getproc pfunc.FNC_DragQueryFileA		,"DragQueryFileA"		,D_SHELL
	ll_getproc pfunc.FNC_DragFinish			,"DragFinish"			,D_SHELL
	ll_getproc pfunc.FNC_ExtractIconExA		,"ExtractIconExA"		,D_SHELL
	ll_getproc pfunc.FNC_ExtractAssociatedIconA	,"ExtractAssociatedIconA"	,D_SHELL
	;   kernel32.dll
	ll_getproc pfunc.FNC_MultiByteToWideChar	,"MultiByteToWideChar"		,D_KERNEL
	ll_getproc pfunc.FNC_GetFileAttributesA		,"GetFileAttributesA"		,D_KERNEL
	ll_getproc pfunc.FNC_GetShortPathNameA		,"GetShortPathNameA"		,D_KERNEL
	ll_getproc pfunc.FNC_VirtualProtect		,"VirtualProtect"		,D_KERNEL
	;ll_getproc pfunc.FNC_GetVersionExA		,"GetVersionExA"		,D_KERNEL
	;ll_getproc pfunc.FNC_GetModuleFileNameA	,"GetModuleFileNameA"		,D_KERNEL
	;   ole32.dll
	;ll_getproc pfunc.FNC_CoInitialize		,"CoInitialize"			,D_OLE
	ll_getproc pfunc.FNC_CLSIDFromString		,"CLSIDFromString"		,D_OLE
	ll_getproc pfunc.FNC_IIDFromString		,"IIDFromString"		,D_OLE
	;ll_getproc pfunc.FNC_CoCreateInstance		,"CoCreateInstance"		,D_OLE
	;ll_getproc pfunc.FNC_CoUninitialize		,"CoUninitialize"		,D_OLE
	;  �n���h��
	;   �V�X�e���F�̃u���V
	prm=15 :dllproc "GetSysColorBrush",prm,1,D_USER	:hbrush=dllret
	;  ���̑�
	;   �V�X�e���F
	dllprocp pfunc.FNC_GetSysColor,prm,1		:cbtn=dllret
	prm=16 :dllprocp pfunc.FNC_GetSysColor,prm,1	:cbtn_shadow=dllret
	col=dllret&255,dllret>>8&255,dllret>>16&255
	;   Windows �̃o�[�W���� (98��oschk=1/Me,2000�ȍ~��oschk=2)
	prmex=148 :dllproc "GetVersionExA",pprmex,1,D_KERNEL
	if prmex.4=1&(prmex.1=10) :oschk=1 :else {
	 if prmex.4=1&(prmex.1>=10)|(prmex.4=2&(prmex.1>=5)) :oschk=2
	}
	oschk_=oschk
	;   �v���O�����{�̖̂��O
	prm=0,0,512 :getptr prm.1,myself
	dllproc "GetModuleFileNameA",prm,3,D_KERNEL

	; ����I�v�V����

	;  ����R�}���h���C��
	s=cmdline
	strlen i,s
	ii=0
	repeat i
	 if ii>=i :break
	 ; | �J�n
	 instr prm,s,"|",ii
	 if prm=-1 :break
	 ii+=prm
	 ; | �I��
	 instr prm,s,"|",ii+1
	 if prm=-1 :break
	 ; �R�}���h�擾
	 peek prm.1,s,ii+prm+2
	 if prm.1='R' :strmid rootdir ,s,ii+1,prm
	 if prm.1='S' :strmid setfile_,s,ii+1,prm
	 ; | �͂ݔ͈͂ƃR�}���h���폜
	 strmid ss,s, ii+prm+3,i-(ii+prm+2)
	 strmid s,s,0,ii
	 i-=prm+2
	 s+=ss
	loop

	;  ���d�N���̃`�F�b�N
	tmp="oniwnd1"
	ss =appname+"@"+setfile_
	prm=ptmp,pss
	dllproc "FindWindowA",prm,2,D_USER
	if dllret!0 {
	 ; ���ɋN�����Ă��� arxlc ���ċN��
	 prm=dllret,wm_xpi,2<<5+(0<<2)+1,0
	 dllprocp pfunc.FNC_SendMessageA,prm,4
	 end
	}

	;  �ݒ�t�@�C��
	exist_ setfile
	if stat>0 {
	 bload setfile,setting,setmax*4,0
	 if appveri!setting {
	  dialog appname+" ���o�[�W�����A�b�v����܂����B\n�p���I�Ȃ����p���肪�Ƃ��������܂��B",0,appvers
	 }
	 ; �A�v���̓ǂݍ��݂̓��j���[�\�z��
	}

	;  �R�}���h���C��
	prm=0
	repeat i
	 peek i,s,cnt
	 ; oschk_
	 if i='o'&(oschk>0) :strmid oschk_,s,prm,cnt-prm :int oschk_
	 ; icon-size
	 if i='i' :strmid iconsize,s,prm,cnt-prm :int iconsize
	 ; appli icon-size
	 if i='a' :strmid sysiconsize,s,prm,cnt-prm :int sysiconsize
	 ; x-coodinate
	 if i='x' :strmid mainx,s,prm,cnt-prm :int mainx
	 ; y-coordinate
	 if i='y' :strmid mainy,s,prm,cnt-prm :int mainy
	 ; border-width
	 if i='b' :strmid mg_girth,s,prm,cnt-prm :int mg_girth
	 ; margin-width
	 if i='m' :strmid mg,s,prm,cnt-prm :int mg
	 ; click neccesity for popping menu
	 if i='c' :noclickpop=0
	 ; sync icon-size
	 if i='s' :strmid synciconsize,s,prm,cnt-prm :int synciconsize
	 ; up, down, right or left edge of the desktop
	 if i='u'|(i='d')|(i='r')|(i='l')|(i='n') :bandmode=i
	 ; else
	 if i<'0'|(i>'9') :prm=cnt+1
	loop

	; ���j���[�A�C�R���̑傫�� 0 �� ��\��
	if iconsize=0&(oschk>0) :oschk_=0
	; �A�v���A�C�R���̑傫�� 0 �� 32(�f�t�H���g�T�C�Y)�ɕύX
	sysiconsize+=sysiconsize=0*32
	; �A�v���A�C�R���̑傫�������j���[�A�C�R���ɍ��킹��
	if synciconsize {
	 if iconsize=0 :synciconsize=0 :else :sysiconsize=iconsize
	}

; COM�̎g�p����

	prm=0 :dllproc "CoInitialize",prm,1,D_OLE
	; lollipop �I���W�i���֐��̗p��
	;  �C���^�[�t�F�[�X�̃��\�b�h�Ăяo���p�}�V����̎w��
	;  (lollipop ���W���[�����ꕔ�����j
	dim CallMethod,11 ; �֐��f�[�^�� (11*4>)$2A(>(10*4))
	getptr pCallMethod,CallMethod
	prm=pCallMethod,44,$40,0 :dllprocp pfunc.FNC_VirtualProtect,prm,4
	CallMethod = $8bec8b55, $d2851455, $458b1974, $0c4d8b08, $34ff03eb, $fa7d4988, $8b028b52, $14ff104d, $b805eb88, $80004003, $0000c3c9
	;  CallMethod	... �C���^�[�t�F�[�X�̃��\�b�h�Ăяo���֐�
	;	prm=����,�����̐�,���\�b�h�̃C���f�b�N�X,�C���^�[�t�F�[�X�|�C���^
	;	�� ���\�b�h�̃C���f�b�N�X
	;		0	(Interface)	-> QueryInterface
	;		1	(Interface)	-> AddRef
	;		2	(Interface)	-> Release
	;		3	IShellLink	-> GetPath
	;		10	IShellLink	-> GetArguments
	;		5	IPersistFile	-> Load
	; �e�C���^�[�t�F�[�X�̏���
	;  IShellLink
	s ="{00021401-0000-0000-C000-000000000046}"; CLSID_ShellLink
	ss="{000214EE-0000-0000-C000-000000000046}"; IID_IShellLinkA
	uni s :uni ss
	prm=ps,pi	:dllprocp pfunc.FNC_CLSIDFromString,prm,2
	prm=pss,pii	:dllprocp pfunc.FNC_IIDFromString,prm,2
	prm=pi,0,1,pii
	getptr prm.4,pShellLink
	dllproc "CoCreateInstance",prm,5,D_OLE
	;  IPersistFile
	ss="{0000010b-0000-0000-C000-000000000046}"; IID_IPersistFile
	uni ss
	prm=pss,pii
	dllprocp pfunc.FNC_IIDFromString,prm,2
	prmex=pii
	getptr prmex.1,pPersistFile
	prm=pprmex,2,0,pShellLink
	ll_callfunc prm,4,pCallMethod
	;  IMalloc
	getptr  prm,pMalloc
	dllproc "SHGetMalloc",prm,1,D_SHELL

; ��ʂȂǂ̏���

	; ���C����ʂ̏�����
	bgscr 4,appmax+1*(sysiconsize+mg)+mg+mg_hover+(mg_girth*2)+mg_left,mg+mg_girth*2+sysiconsize+mg_hover,2,mainx,mainy,mg+mg_girth*2+mg_left+sysiconsize+mg_hover
	font "�l�r �S�V�b�N",13,17
	mref bmscr,67
	hdc=bmscr.4
	hwnd=bmscr.13
	hinst=bmscr.14
	;  �g���X�^�C���� WS_EX_TOOLWINDOW ��������
	;  �� �c�[���E�B���h�E�́A�ʏ�̃^�C�g���o�[��菬�����^�C�g���o�[������...
	;  �@ ���^�C�g���o�[�����X�����E�B���h�E�ł��̃X�^�C�����w�肵���ꍇ�ɂ� "�������^�C�g���o�[e.t.c." �͊֌W�����炵��
	prm=hwnd,-20	:dllproc "GetWindowLongA",prm,2,D_USER
	prm.2=dllret|$80:dllproc "SetWindowLongA",prm,3,D_USER
	;  �T�u�N���X���ƃ��b�Z�[�W�̎�t�J�n
	gm_setwndproc hwnd
	gm_setmessage hwnd,$201	 ; ���N���b�N�̎擾
	gm_setmessage hwnd,$205	 ; �E�N���b�N�̎擾
	gm_setmessage hwnd,$233	 ; �h���b�O���h���b�v�̎擾
	gm_setmessage hwnd,$499  ; �^�X�N�g���C�̃��b�Z�[�W���擾
	gm_setmessage hwnd,wm_xpi; �v���O�C������̃��b�Z�[�W���擾
	prm=hwnd,1
	dllprocp pfunc.FNC_DragAcceptFiles,prm,2
	;  �`�b�v�w���v�p�̎q�E�B���h�E�쐬
	;   �� COMCTL �������͕s�v�炵��
	;	; Windows 98�ȍ~�ł� InitCommonControlsEx �𗘗p
	;	if oschk>0 {
	;	 prmex=8,
	;	 dllproc "InitCommonControlsEx",pprmex,1,D_COMCTL
	;	} else {
	;	 dllproc "InitCommonControls",prm,0,D_COMCTL
	;	}
	prm=0,ps,0,$40|1,$8000000,$8000000,$8000000,$8000000,hwnd,0,hinst,0
	s="tooltips_class32" :dllprocp pfunc.FNC_CreateWindowExA,prm,12
	hwnd_tip=dllret
	if setfile_=setfile_default :setfile_ex="" :else :setfile_ex=" (@"+setfile_+")"
	tiphelp appvers,0
	tiphelp "�I��",appmax,0,0,mg_left,15
	tiphelp "�ŏ���",appmax,0,15,mg_left,30
	; �摜�֘A�̈ꎞ�����p�o�b�t�@�̏�����
	buffer 3,,,0
	mref bmscr,67

	if oschk_ {
	; �ꎞ�����p�f�o�C�X�R���e�L�X�g�ƃr�b�g�}�b�v�I�u�W�F�N�g���쐬
	;  �f�o�C�X�R���e�L�X�g
	dllprocp pfunc.FNC_CreateCompatibleDC,hdc,1
	hdcex=dllret
	;  �r�b�g�}�b�v�I�u�W�F�N�g
	prm=hdcex,1,1
	dllprocp pfunc.FNC_CreateCompatibleBitmap,prm,3
	hbmpblank=dllret
	; �t�H���_�A�C�R��(�r�b�g�}�b�v�I�u�W�F�N�g)���쐬
	boxf_ 0,0,iconsize,iconsize,bmscr.4,hbrush
	palcolor 0
	boxf 1,2,7,2
	boxf 1,3,14,13
	palcolor 255
	boxf 2,3,6,3
	boxf 2,5,13,12
	prm=bmscr.4,iconsize,iconsize
	dllprocp pfunc.FNC_CreateCompatibleBitmap,prm,3 :hbmpfolder=dllret
	bitbltex hbmpfolder,0,0,iconsize,iconsize,bmscr.4
	}
	boxf_ 0,0,iconsize,iconsize,bmscr.4,hbrush

	; �v���O�����A�C�R�����擾�����C����ʂɕ`��
	gsel 4
	redraw 2
	color cmg_girth&$FF,cmg_girth>>8&$FF,cmg_girth>>16&$FF :boxf
	boxf_ mg_girth+mg_left,mg_girth,winx-mg_girth,winy-mg_girth,hdc,hbrush
	;  �擾
	ss=myself
	prm=pss,0,pii,0,1
	dllprocp pfunc.FNC_ExtractIconExA,prm,5
	hicon=ii
	;  �`��
	prmex=hdc,mg_girth+mg_left+mg,mg_girth+mg,hicon,sysiconsize,sysiconsize,0,0,3
	dllprocp pfunc.FNC_DrawIconEx,prmex,9
	prm=mg+mg_left+mg_girth,mg+mg_girth
	color col,col.1,col.2
	line prm,prm.1+sysiconsize,prm+sysiconsize,prm.1+sysiconsize
	line prm+sysiconsize,prm.1,prm+sysiconsize,prm.1+sysiconsize

; ���j���[�̍\�z

	gsel 3

	tmp=rootdir+"\n"
	repeat foldermax
	 await
	 curfoldernum=cnt

	 ; ��������t�H���_�̎擾
	 notesel tmp
	 notemax prmex
	 if curfoldernum>=prmex :break
	 if curfoldernum=0 {
	  ; ���[�g���j���[
	  dllprocp pfunc.FNC_CreatePopupMenu,prm
	  hmenu.curfoldernum=dllret
	  ; ���[�g����p�r���j���[
	  dllprocp pfunc.FNC_CreatePopupMenu,prm
	  hmenu_ex=dllret
	  imenu "(?)",100,0,0,hmenu_ex
	  imenu "���w���v",101,0,0,hmenu_ex
	  imenu "",0,0,0,hmenu_ex
	  mii.1=1 :mii.3=$1003
	  setmii hmenu_ex,100
	 }
	 noteget curfolder,curfoldernum
	 curfolder+="\\"

	 ; �J�����g�t�H���_�ɐݒ�
	 skiperr 1 :chdir curfolder :i=err :skiperr 0
	 if i :continue

	 ; �t�H���_���T�u�t�H���_����
	 dirlist ss,"*",5
	 notesel ss
	 notemax i
	 repeat i
	  if prmex>=foldermax :break
	  noteget s,cnt
	  if s="hidden" :continue
	  tmp+=curfolder+s+"\n"
	  dllprocp pfunc.FNC_CreatePopupMenu,prm
	  hmenu.prmex=dllret
	  imenu s,0,hbmpfolder,hmenu.prmex,hmenu.curfoldernum
	  if curfoldernum=0 :imenu s,0,hbmpfolder,hmenu.prmex,hmenu_ex
	  prmex++
	 loop

	 ; �t�H���_���t�@�C������
	 getptr pfilelist.curfoldernum,filelist.curfoldernum
	 ;  �v���O�C������t�@�C�����X�g�̃f�[�^��ǂݍ��߂�悤�ɂ���
	 ;  (�s�v�݂����B)
	 ;   prm=pfilelist.curfoldernum,16384,$4,0
	 ;   dllprocp pfunc.FNC_VirtualProtect,prm,4
	 dirlist filelist.curfoldernum,"*.lnk",1
	 ss="" :dirlist ss,"*.url",1
	 filelist.curfoldernum+=ss
	 if cnt!0 {
	  ss="" :dirlist ss,"*.exe",1
	  filelist.curfoldernum+=ss
	 }
	 notesel filelist.curfoldernum
	 notemax prm
	 repeat filemax-prm*(prm>filemax)+prm
	  await
	  noteget s,cnt
	  ss=curfolder+s
	  noteadd ss,cnt,1
	  ; �t�@�C���A�C�R���t���� Windows 98,2000 �ȍ~�̂݉�
	  if oschk_ {
	   ; �A�C�R���̎擾(SHGetFileInfoA)
	   ;
	   ; �� ExtractIconExA , SHGetFileInfoA ���x��r (�P�� ms)
	   ; Extract;	54.497 -> 55.218	721 ... �u�[�g�� arxlc ���N��
	   ; 		02.121 -> 02.361	240
	   ; 		35.501 -> 35.752	251
	   ; 		00.924 -> 01.174	250
	   ; SHGetFI;	05.960 -> 06.210	250
	   ; 		43.761 -> 44.011	250
	   ; 		17.622 -> 17.872	250
	   ; 		15.061 -> 15.301	240
	   ; �w�Ǎ����Ȃ��B
	   ;
	   ; �� SHFILEINFO �\���͖̂`������(LONG ���/8byte)�������p
	   ;	uFlags;				 �g�p���Ă���t���O
	   ;	SHGFI_ICON		$100		(*)
	   ;	SHGFI_DISPLAYNAME	$200
	   ;	SHGFI_TYPENAME		$400
	   ;	SHGFI_ATTRIBUTES	$800
	   ;	SHGFI_ICONLOCATION	$1000
	   ;	SHGFI_EXETYPE		$2000
	   ;	SHGFI_SYSICONINDEX	$4000
	   ;	SHGFI_LINKOVERLAY	$8000
	   ;	SHGFI_SELECTED		$10000
	   ;	SHGFI_ATTR_SPECIFIED	$20000
	   ;	SHGFI_LARGEICON		$0
	   ;	SHGFI_SMALLICON		$1
	   ;	SHGFI_OPENICON		$2
	   ;	SHGFI_SHELLICONSIZE	$4
	   ;	SHGFI_PIDL		$8
	   ;	SHGFI_USEFILEATTRIBUTES	$10
	   prm=pss,0,pprmex,8,$100
	   dllproc "SHGetFileInfoA",prm,5,D_SHELL
	   i=prmex
	   ;prm=bmscr.14,pss,pi
	   ;dllprocp pfunc.FNC_ExtractAssociatedIconA,prm,3
	   ;i=dllret
	   ; �A�C�R�����r�b�g�}�b�v�I�u�W�F�N�g�ɕϊ�
	   prm=bmscr.4,iconsize,iconsize
	   dllprocp pfunc.FNC_CreateCompatibleBitmap,prm,3
	   hbmp.curfoldernum.cnt=dllret
	   hdcex.1=dllret
	   dllprocp pfunc.FNC_SelectObject,hdcex,2
	   boxf_ 0,0,iconsize,iconsize,hdcex,hbrush
	   prmex=hdcex,0,0,i,iconsize,iconsize,0,0,3
	   dllprocp pfunc.FNC_DrawIconEx,prmex,9
	   ; ��n��
	   dllprocp pfunc.FNC_DestroyIcon,i,1
	   hdcex.1=hbmpblank
	   dllprocp pfunc.FNC_SelectObject,hdcex,2
	  }
	  ; ���j���[���ڒǉ�
	  strlen i,s :strmid s,s,0,i-4
	  imenu s,curfoldernum+1*filemax+cnt,hbmp.curfoldernum.cnt,0,hmenu.curfoldernum
	  if curfoldernum=0 :imenu s,curfoldernum+1*filemax+cnt,hbmp.curfoldernum.cnt,0,hmenu_ex
	 loop

	loop

	; �ݒ胁�j���[���쐬
	;  (1)
	dllprocp pfunc.FNC_CreatePopupMenu,prm
	hmenu_setting1=dllret
	imenu "16�~16 (�ȍ~�A�P�ʂ͑S�� pixel)\t[���j���[�A�C�R��]",102,0,0,hmenu_setting1
	imenu "24�~24",103,0,0,hmenu_setting1
	imenu "32�~32",104,0,0,hmenu_setting1
	imenu "48�~48",106,0,0,hmenu_setting1
	imenu "64�~64",108,0,0,hmenu_setting1
	imenu "96�~96",112,0,0,hmenu_setting1
	imenu "",0,0,0,hmenu_setting1
	imenu "�����j���[�A�C�R���ɍ��킹��\t[�A�v���A�C�R��]",113,0,0,hmenu_setting1
	imenu "16�~16",115,0,0,hmenu_setting1
	imenu "24�~24",116,0,0,hmenu_setting1
	imenu "32�~32",117,0,0,hmenu_setting1
	imenu "48�~48",119,0,0,hmenu_setting1
	imenu "64�~64",121,0,0,hmenu_setting1
	imenu "96�~96",125,0,0,hmenu_setting1
	imenu "|",0,0,0,hmenu_setting1
	imenu "0�@[���C����ʂ̘g��]",130,0,0,hmenu_setting1
	imenu "1",131,0,0,hmenu_setting1
	imenu "2",132,0,0,hmenu_setting1
	imenu "3",133,0,0,hmenu_setting1
	imenu "4",134,0,0,hmenu_setting1
	imenu "6",136,0,0,hmenu_setting1
	imenu "8",138,0,0,hmenu_setting1
	imenu "",0,0,0,hmenu_setting1
	imenu "1�@[�A�v���A�C�R���̊Ԋu]",141,0,0,hmenu_setting1
	imenu "2",142,0,0,hmenu_setting1
	imenu "3",143,0,0,hmenu_setting1
	imenu "4",144,0,0,hmenu_setting1
	imenu "6",146,0,0,hmenu_setting1
	imenu "7",147,0,0,hmenu_setting1
	imenu "",0,0,0,hmenu_setting1
	imenu "��ʘg�F�̕ύX",150,0,0,hmenu_setting1
	imenu "",0,0,0,hmenu_setting1
	imenu "���C����ʂ��ŏ���",148,0,0,hmenu_setting1
	imenu "���C����ʂ���ɍőO�ʕ\��",149,0,0,hmenu_setting1
	;  (2)
	dllprocp pfunc.FNC_CreatePopupMenu,prm
	hmenu_setting2=dllret
	imenu "�\�����Ȃ�\t[�}�E�X�ŉ�ʒ[���|�C���g�����ۂɃ��j���[��...]",'n'+70,0,0,hmenu_setting2
	imenu "�\������",166,0,0,hmenu_setting2
	imenu "�N���b�N�������̂ݕ\������",165,0,0,hmenu_setting2
	imenu "",0,0,0,hmenu_setting2
	imenu "��[�ŕ\��\t[���ǂ̉�ʒ[�ŕ\�����邩]",'u'+70,0,0,hmenu_setting2
	imenu "�E�[�ŕ\��",'r'+70,0,0,hmenu_setting2
	imenu "���[�ŕ\��",'d'+70,0,0,hmenu_setting2
	imenu "���[�ŕ\��",'l'+70,0,0,hmenu_setting2
	;  �`�F�b�N�}�[�N��t��
	mii.1=1 :mii.3=8
	if iconsize\8=0 :setmii hmenu_setting1,iconsize/8+100
	if synciconsize  :setmii hmenu_setting1,113 :else {
	 if sysiconsize\8=0 :setmii hmenu_setting1,sysiconsize/8+113
	}
	if mg_girth<8 :setmii hmenu_setting1,mg_girth+130
	if mg<8 :setmii hmenu_setting1,mg+140
	if forelock :setmii hmenu_setting1,149
	gosub *chkmenu_setting2
	; ���C�����j���[�ɃV�X�e�����ڂ�t��
	imenu "",0,0,0,hmenu
	imenu "�����ڂ̐ݒ�",0,0,hmenu_setting1,hmenu
	imenu "�@�\�̐ݒ�",0,0,hmenu_setting2,hmenu
	imenu "���[�g�t�H���_���J��",10,0,0,hmenu
	imenu "������������",3,0,0,hmenu
	exist_ extfile
	if stat>0 :imenu "�g���@�\",4,0,0,hmenu
	imenu "",0,0,0,hmenu
	imenu appname+" �̍ċN��",2,0,0,hmenu
	imenu appname+" �̏I��",1,0,0,hmenu

	; �����N���ڂւ̑���p�g�����j���[���쐬
	dllprocp pfunc.FNC_CreatePopupMenu,prm
	hmenu_modlink=dllret
	imenu "�A�v���o�^/�폜",20,0,0,hmenu_modlink
	imenu "�A�v���ړ�(��)",23,0,0,hmenu_modlink
	imenu "�A�v���ړ�(��)",24,0,0,hmenu_modlink
	imenu "",0,0,0,hmenu_modlink
	imenu "�����N���̕ύX",21,0,0,hmenu_modlink
	imenu "�����N��̕ύX",22,0,0,hmenu_modlink
	imenu "",0,0,0,hmenu_modlink
	imenu "�����N�����J��",18,0,0,hmenu_modlink
	imenu "�����N���t�H���_���J��",19,0,0,hmenu_modlink
	mii.1=1 :mii.3=$1000
	setmii hmenu_modlink,18

; �A�v���̓ǂݍ���

	gsel 4
	title appname+"@"+setfile_
	gsel 4,1
	if appnum {
	 prm=0
	 i=appnum :appnum=0
	 repeat i
	  bload setfile,s,512,setmax*4+(cnt*512)
	  dllret=0
	  repeat foldermax
	   i=cnt
	   if hmenu.cnt!0 {
	    notesel filelist.cnt
	    notemax ii
	    repeat ii
	     noteget ss,cnt
	     if s=ss :dllret=i+1*filemax+cnt :break
	    loop
	    if dllret :break
	   }
	  loop
	  if dllret :gosub *modappli
	 loop
	}
	onexit *exit

	ntray
	ttray appvers
	gsel 4,1+forelock
	if minimized :gosub *minimize_


; �\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\
; ����҂�
; �\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\

; �����郁�C�����[�v

*main
	wait 1
	gm_getmessage msgval
	stick i
	ginfo 2	:prm=-prmx,-prmy
	ginfo	:prm=prm+prmx,prm.1+prmy
	; �}�E�X�J�[�\������ʒ[�ɂ���A���̑��̏����𖞂����Ƃ����C�����j���[��\��
	if bandmode='u'&(prmy=0)|(bandmode='r'&(dispx-1=prmx))|(bandmode='l'&(prmx=0))|(bandmode='d'&(dispy-1=prmy))&(i&256!0|noclickpop) :goto *shwsysmenu
	; �}�E�X�J�[�\���̈ʒu�ɑΉ������\��
	i.3=prm>=0&(prm-mg_girth<mg_left)&(prm.1>=0)
	i  =prm.1<15&i.3
	i.1=i=0&(prm.1<30)&i.3
	repeat 2
	; ����/�ŏ����{�^��
	if i.cnt!hov.cnt {
	 redraw 2
	 prm=cnt
	 repeat 2
	  if cnt=0 :color cmg_girth&$FF,cmg_girth>>8&$FF,cmg_girth>>16&$FF :else {
	   hov.prm=i.prm
	   if i.prm :color cbtn&$FF,cbtn>>8&$FF,cbtn>>16&$FF :else {
	    color cbtn_shadow&$FF,cbtn_shadow>>8&$FF,cbtn_shadow>>16&$FF
	   }
	  }
	  if prm=1 {
	   pos 5+hovminmzbtn,22+hovminmzbtn
	   line csrx+8,csry
	  } else {
	   pos 2+hovclosebtn,2+hovclosebtn
	   mes "�~"
	  }
	 loop
	 redraw 1
	}
	loop
	;  �ʒu�����C����ʓ����A�C�R���̈���Ȃ� i �ɂ̓A�v���A�C�R���ԍ�������
	;  �� i=0 : arxlc �A�C�R��)
	i=prm-mg_left-mg_girth-mg
	i=minimized=0&(i>0)&(mg_girth+mg<=prm.1)&(mg_girth+mg+sysiconsize>prm.1)&(i\(sysiconsize+mg)<sysiconsize)*(i/(sysiconsize+mg)+1) :i--
	;  �A�v���A�C�R���ԍ��� 0 �ȏ�A�v�����ȉ��Ȃ�
	if i>=0&(i<=appnum) {
	 if i!curappli {
	  gosub *resappli
	  gosub *hovappli
	 }
	} else :gosub *resappli
	; ���C����ʂւ̑���ɑΏ�
	if msgval=hwnd {
	 ; (�v���O�C������̗v��)
	 if msg=wm_xpi {
	  ; �� 4byte = 2�i�@��(8*4=)32��
	  ; *0 ���擾�v��
	  ; *00 �ݒ蓙�̐��l���
	  if wprm&3=0 {
	   wprm=wprm>>2
	   repeat
		prm=-1
		; ���J�n�I�t�Z�b�g
		;  ���l�^���
		;   arxlc �ݒ荀�ړ��e
		if wprm=0	:prm=32	:break
		;   �V�X�e���g�p���j���[�̃n���h��
		if wprm=1	:prm=64	:break
		;   �e�J�e�S���[���j���[�̃n���h��
		if wprm=2	:prm=80	:break
		;   �A�v��ID
		if wprm=3	:prm=144:break
		;   ���̑��̏��
		if wprm=4	:prm=192:break
		;   �V���[�g�J�b�g�t�@�C���ꗗ�f�[�^�ւ̃|�C���^
		if wprm=7	:prm=196:break
		;  ������^���
		;   �����`���[���ڂɑΉ������t�@�C���̃t���p�X���
		if wprm=5	:prm=192:break
		;   ���̑��̏��
		if wprm=6	:prm=0  :break
		;   ��Ή��̏��
		if wprm<31	:break
		; ���l�^���
		;  arxlc �o�[�W�����ԍ�
		if wprm=31	:prm=appveri :break
		;  arxlc �ݒ荀�ړ��e
		if wprm<64	{
		 wprm-32 :if wprm<setmax_thisver :prm=setting.wprm
		 break		}
		;  �V�X�e���g�p���j���[�̃n���h��
		if wprm<80	{
		 wprm-=64 :if wprm<4 :prm=hmenus.wprm
		 break		}
		;  �e�J�e�S���[���j���[�̃n���h��
		if wprm<144	:wprm-=80 :prm=hmenu.wprm :break
		;  �A�v���A�C�R���ɑΉ����郁�j���[���ڂ�ID
		if wprm<192	{
		 wprm-=144 :if wprm<appnum :prm=appid.wprm
		 break		}
		;  ���̑��̏��
		if wprm=192 :prm=hwnd :break
		if wprm=193 :prm=oschk :break
		if wprm=194 :prm=oschk_ :break
		if wprm=195 :prm=curfoldernum :break
		;  �V���[�g�J�b�g�t�@�C���ꗗ�f�[�^�ւ̃|�C���^
		if wprm<(196+foldermax) {
		 wprm-=196
		 prm=pfilelist.wprm
		 break		}
		break
	   loop
	   prmex=lprm,wm_xpi,prm,0 :dllprocp pfunc.FNC_SendMessageA,prmex,4
	   goto *main
	  }
	  ; *10 �����`���[���ړ��̕�������
	  if wprm&3=2 {
	   wprm=wprm>>2
	   repeat
		s=""
		; ���L�ȊO�̏��
		if wprm=0 :s=myself :break
		if wprm=1 :s=appvers :break
		if wprm=2 :s=cmdline :break
		if wprm=3 :s=rootdir :break
		if wprm=4 :s=setfile_:break
		if wprm<192 :break
		; �����`���[���ڂɑΉ������t�@�C���̃t���p�X���
		; 12480 = (filemax*64+192)
		if wprm<12480 {
		 wprm-=192
		 prm=wprm/filemax-1,wprm\filemax
		 if prm>=0 {
		  notesel filelist.prm
		  noteget s,prm.1
		 }
		}
		break
	   loop
	   prm=lprm,wm_xpi,0,0
	   if s!"" {
	    strlen i,s
	    poke prmex,0,s
	    ; 4byte �P�ʂŃf�[�^�𑗐M����̂ŁA�f�[�^�ʂ� 4 �Ŋ���؂�Ȃ�����
	    ; �c���S�� 0 �ɂ���B
	    if i\4 :repeat 4-(i\4),i :poke prmex,cnt,0 :loop
	    repeat i/4+(i\4!0)
	     prm.2=prmex.cnt :dllprocp pfunc.FNC_SendMessageA,prm,4
	     wait 1
	    loop
	    prm.2=0
	   }
	   dllprocp pfunc.FNC_SendMessageA,prm,4
	   goto *main
	  }
	  ; *1 ���K�p�v��
	  ; *01 �[�����j���[�N���b�N
	  if wprm&3=1 {
	   wprm=wprm>>2
	   ; *00001
	   if wprm&7=0 :prmex=wprm>>3 :goto *runsysmenu
	   ; *00101
	   ;   �`
	   ; *11101
	   dllret=wprm&7+18
	   i=wprm>>3
	   goto *runextmenu
	  }
	  ; *11 ���j���[�̃|�b�v�A�b�v�ƌ��ʑ��M
	  if wprm&3=3 {
	   wprm=wprm>>2 :prm=0
	   repeat
		;  �V�X�e���g�p���j���[
		if wprm<80	{
		 wprm-=64 :if wprm<4 :prm=hmenus.wprm
		 if wprm=0 :tmenu "(?)",100,hmenu_ex
		 break		}
		;  �e�J�e�S���[���j���[
		if wprm<144	:wprm-=80 :prm=hmenu.wprm :break
		break
	   loop	   
	   if prm {
	    pmenu prm :prm.2=dllret,0
	   } else :prm.2=0,0
	   prm=lprm,wm_xpi
	   dllprocp pfunc.FNC_SendMessageA,prm,4
	   goto *main
	  }
	 }
	 ; (�^�X�N�g���C�ւ̑���)
	 if msg=$499&(lprm=$201|(lprm=$205)) {
	  msg=lprm
	  ; �ŏ���/���ɖ߂�
	  if msg=$201 :hovminmzbtn=1
	  ; ���C�����j���[�̕\��
	  if msg=$205 {
	   msg=$201
	   if curappli>=0 :gosub *resappli
	   i=0 :gosub *hovappli
	  }
	 }
	 ; �N���b�N���ꂽ
	 if msg=$201 {
	  if hovclosebtn:goto *exit
	  if hovminmzbtn:goto *minimize
	  if curappli=0 :goto *shwsysmenu
	  if curappli>0 :i=curappli-1 :dllret=appid.i :goto *exesysmenu
	  repeat 1
	   i=0 :objsend -28,$A1,2,i,0
	   stick i,256
	   if i&256 :continue
	   wait 20
	  loop
	 }	 
	 ; �E�N���b�N���ꂽ
	 if msg=$205 {
	  if curappli>=0 {
	   if curappli=0 {
	    tmenu "�g�����j���[",100,hmenu_ex :pmenu hmenu_ex
	    if dllret=101 :dialog "�I���������ڂɂ��Ă̊g�����j���[��\�����܂��B\n�g�����j���[�ł͍��ڂ̃A�v���o�^��폜�A�v���p�e�B�\���Ȃǂ��s���܂��B\n\n���A�v���o�^���ꂽ���ڂ̓��C����ʂɕ\������A���΂₭�N���A����ł���悤�ɂȂ�܂��B\n���g�����j���[�̓��C�����j���[�ō��ڂ� [Ctrl] �L�[�������Ȃ���I�����Ă��\���ł��܂��B",0,"�g�����j���[ - "+appvers :dllret=0
	    i=dllret
	   } else :i=curappli-1 :i=appid.i
	   if i>0 :goto *shwextmenu
	  }
	 }
	 ; �h���b�O���h���b�v���ꂽ
	 if msg=$233 {
	  ; �h���b�O���h���b�v���ꂽ�ʒu�̃A�v�����擾
	  if curappli>=0 {
	   ; arxlc �A�C�R����
	   if curappli=0 {
	    tmenu "�A�v���̑I��",100,hmenu_ex
	    repeat
	     pmenu hmenu_ex,1
	     if dllret=101 :dialog "�h���b�O���h���b�v�����t�@�C�����J���v���O������I�����ĉ������B\n\n���v���O�����ȊO��I������ƒP�ɂ��̍��ڂ̃t�@�C�����J�������ƂȂ�܂��B",0,"�A�v���̑I�� - "+appvers :continue
	     break
	    loop
	   ; ���̑��̃A�v���A�C�R����
	   } else :i=curappli-1 :dllret=appid.i
	   if dllret>0 {
	    gosub *getlink
	    ; �L���ȃA�v����Ƀh���b�O���h���b�v����Ă����炻��ɓn���R�}���h���C���𐮔�
	    if tmp="EXE" {
	     ; �t�@�C�������擾
	     prm=wprm,-1,0,0
	     dllprocp pfunc.FNC_DragQueryFileA,prm,4
	     ; �t�@�C�������擾
	     i=0
	     repeat dllret
	      prm=wprm,cnt,ptmp,512
	      dllprocp pfunc.FNC_DragQueryFileA,prm,4
	      ; �t�@�C�����̉��H
	      ;  Windows Me/2000/xp
	      if oschk=2 {
	       tmp="\""+tmp+"\""
	      ;  Windows 95,98,NT4.0
	      } else {
	       prm=ptmp,ptmp,512
	       dllprocp pfunc.FNC_GetShortPathNameA,prm,3
	      }
	      strlen ii,tmp
	      if i+ii>=1023 :break
	      if cnt!0 :s+=" "
	      s+=tmp
	      i+=ii+1
	     loop
	     tmp=""
	    } else :tmp="open"
	    exec_ ss,s
	    ; ����������
	    dllprocp pfunc.FNC_DragFinish,wprm,1
	   }
	  }
	 }
	}
	wait 3
	goto *main


; �\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\
; �I��������
; �\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\

; ��n��

*exit
	title appname+"@"+setfile_+"(ending)"
	; �e��n���h���̉��
	;  �I�u�W�F�N�g�ƃ��j���[
	repeat curfoldernum
	 if hmenu.cnt {
	  prm=cnt
	  dllprocp pfunc.FNC_DestroyMenu,hmenu.prm,1
	  repeat filemax
	   if hbmp.prm.cnt :dllprocp pfunc.FNC_DeleteObject,hbmp.prm.cnt,1
	  loop
	 }
	loop
	repeat 4 :dllprocp pfunc.FNC_DestroyMenu,hmenus.cnt,1 :loop
	if hdcex	:dllprocp pfunc.FNC_DeleteDC,hdcex,1
	if hbmpfolder	:dllprocp pfunc.FNC_DeleteObject,hbmpfolder,1
	if hbmpblank	:dllprocp pfunc.FNC_DeleteObject,hbmpblank,1
	if hbrush	:dllprocp pfunc.FNC_DeleteObject,hbrush,1
	;  COM �֘A
	prm=0,0,2
	if pShellLink	:prm.3=pShellLink	:ll_callfunc prm,4,pCallMethod
	if pPersistFile :prm.3=pPersistFile	:ll_callfunc prm,4,pCallMethod
	if pMalloc	:prm.3=pMalloc		:ll_callfunc prm,4,pCallMethod
	dllproc "CoUninitialize",prm,0,D_OLE
	;  �^�X�N�g���C�֘A
	ctray
	dllprocp pfunc.FNC_DestroyIcon,hicon,1
	; �ݒ�̕ۑ�
	;  hidden �t�H���_�̑��݊m�F
	chdir exedir
	skiperr 1 :chdir setdir
	if err {
	 skiperr 0
	 skiperr 1
	 mkdir setdir
	 if err :end
	}
	skiperr 0
	;  �ۑ��̎��s
	if oschk_=0 :iconsize=0
	setting=appveri
	setmax=setmax_thisver
	if minimized :gsel 4,1 :dllprocp pfunc.FNC_OpenIcon,hwnd,1
	ginfo 2 :mainx=prmx :mainy=prmy
	bsave setfile,setting,setmax*4
	repeat appnum
	 i=appid.cnt/filemax-1
	 notesel filelist.i
	 noteget s,appid.cnt\filemax
	 bsave setfile,s,512,cnt*512+(setmax*4)
	loop
	if restart :exec "\""+myself+"\" "+cmdline
	end


; �\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\
; ����
; �\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\

; ���j���[�̕\��

*shwsysmenu
	pmenu hmenu
	if dllret=0 :goto *main
	; �V�X�e�����j���[
	prmex=dllret
	goto *runsysmenu

; ���j���[���ڂ̎��s
;	�g�p�l	prmex	/ �I�����ꂽ���j���[��ID

*runsysmenu
	;  �ݒ�
	;   (2)
	if prmex>=165&(prmex<filemax) {
	 ; �����̃`�F�b�N�}�[�N��S�ĊO��
	 mii.1=1 :mii.3=0
	 setmii hmenu_setting2,bandmode+70
	 setmii hmenu_setting2,165+noclickpop
	 ; �ݒ�
	 repeat
	  if prmex<=166 {
	   if bandmode='n' :bandmode='u'
	   noclickpop=166-prmex=0
	   break
	  }
	  bandmode=prmex-70
	  break
	 loop
	 ; �`�F�b�N�Ȃǂ̕\����Ԃ��X�V
	 gosub *chkmenu_setting2
	 goto *main
	}
	;   (1)
	if prmex>=100&(prmex<filemax) {
	 if prmex=148 :goto *minimize
	 if prmex=150 {
	  dialog "",33,"���C����ʂ̘g�F"
	  if stat=1 {
	   cmg_girth=rval+(gval<<8)+(bval<<16)
	   ; �g�F�X�V
	   redraw 2
	   color rval,gval,bval
	   ginfo 6			; ��ʏ������T�C�Y�擾
	   boxf 0,0,prmx,mg_girth-1
	   boxf 0,mg_girth,mg_left+mg_girth-1,prmy-1
	   boxf mg_left+mg_girth,mg*2+mg_girth+sysiconsize+mg_hover,prmx-1,prmy-1
	   boxf winx-mg_girth,mg_girth-1,prmx-1,prmy-mg_girth-1
	   hov=-1,-1
	  }
	  goto *main
	 }
	 ; �I�����ڂ̌��݂̃`�F�b�N�󋵂𒲂ׂ�
	 mii.3=0
	 mii.1=1 :getmii hmenu_setting1,prmex
	 if prmex=149 {
	  mii.3=mii.3&8=0*8
	  setmii hmenu_setting1,149
	  forelock=mii.3&8!0
	  gsel 4,1+forelock
	  goto *main
	 }
	 if mii.3&8 :goto *main
	 ; �ݒ�ɕύX����������
	 repeat
	  if prmex<113 {
	   iconsize=prmex-100*8
	   if oschk_=0 :oschk_=oschk
	   break
	  }
	  if prmex=113 :synciconsize=(mii.3^8) :break
	  if prmex<130 :sysiconsize=prmex-113*8 :synciconsize=0 :break
	  if prmex<140 :mg_girth=prmex-130 :break
	  if prmex<148 :mg=prmex-140 :break
	  break
	 loop
	 if prmex=148 :goto *main
	 ; �ċN��
	 prmex=2
	}
	;  �g���@�\
	if prmex=4 {
	 tmp="" :pidl=0
	 s="run:"+extfile_+",@"+setfile_
	 exec_ myself,s
	 goto *main
	}
	;  arxlc �̐�����
	if prmex=3 {
	 exist_ hlpfile
	 if stat>0 :exec hlpfile,16
	 goto *main
	}
	;  arxlc �̏I���ƍċN��
	if prmex<=2 :restart=prmex-1 :goto *exit
	;  ���[�g�t�H���_���J��
	if prmex=10 :exec rootdir,16 :goto *main
	; �����`���[���j���[
	dllret=prmex
	goto *exesysmenu

; �����`���[���ڂ̃N���b�N�ɑΏ�
;	�g�p�l	dllret	/ �I�����ꂽ���j���[��ID

*exesysmenu
	; [Ctrl] �L�[�������Ȃ��炾�Ɗg�����j���[�\��
	getkey i,17
	if i :i=dllret :goto *shwextmenu
	; �����N���̎擾
	gosub *getlink
	; [Shift] �L�[�������Ȃ��炾�ƃt�H���_���J��
	getkey i,16
	; �J��
	if tmp="EXE" :tmp="" :else :tmp="open"
	exec_ ss,s
	goto *main

; �g�����j���[�̕\��
;	�g�p�l	i	/ �g�����j���[��\�����郊���N�ɑΉ��������C�����j���[��ID

*shwextmenu
	; �\���̏���
	; �I�����ڂ̌��݂̃`�F�b�N�󋵂𒲂ׂ�
	ii=i/filemax-1
	mii.1=1 :getmii hmenu.ii,i
	;  ���ڂ��A�v�����ۂ��ɉ����āA[���j���[�ړ�] �̎g�p�ۂ�ݒ�
	mii.3=mii.3&8=0*3
	setmii hmenu_modlink,23
	setmii hmenu_modlink,24
	; �g�����j���[�̕\��
	pmenu hmenu_modlink
	if dllret=0 :goto *main
	goto *runextmenu

; �g�����j���[���ڂ̎��s
;	�g�p�l	i	/ �g�����j���[���ڂ����s���郊���N�ɑΉ��������C�����j���[��ID
;		dllret	/ �I�����ꂽ���j���[��ID

*runextmenu
	ii=i/filemax-1
	; �A�v���o�^/�폜
	if dllret=20 {
	 dllret=i
	 gosub *resappli
	 gosub *modappli
	 goto *main
	}
	; �A�v���ړ�
	if dllret>22 {
	 ii=-1
	 repeat appnum
	  if appid.cnt=i :ii=cnt :break
	 loop
	 ; (��)
	 if dllret=23 :i=ii+1 :ii=0 :else {
	 ; (��) �c if dllret=24
	 i=ii+1 :ii=1 }
	 gosub *movappli :goto *main
	}
	; �����N�ւ̑���
	notesel filelist.ii
	noteget s,i\filemax
	;  �����N�����J��
	if dllret<20 {
	 ; (�����N���t�@�C�����J��)
	 if dllret=18 {
	  dllret=i :gosub *getlink
	 ; (�����N���t�H���_���J��) �c if dllret=19
	 } else {
	  dllret=i :gosub *getlink
	  gosub *getfolderlgt
	  strmid ss,ss,0,i
	  tmp=""
	 }
	 if tmp="EXE" :tmp="" :else :tmp="open"
	 exec_ ss,s
	 goto *main
	}
	;  �����N���̕ύX
	if dllret=21 {
	 prmex.10=i
	 ss="";sdim ss,512 :getptr pss,ss
	 ss=s :s="" ;sdim s,512 :getptr ps,s
	 gosub *getfolderlgt:strlen ii,ss
	 strmid s,ss,0,i	; �t�H���_�p�X
	 strmid ss,ss,i,ii-i	; �t�@�C����(�g���q�t��)
	 gosub *getext :i++ :strlen ii,ss
	 strmid tmp,ss,ii-i,i	; �g���q(.�t��)
	 strmid ss,ss,0,ii-i	; �t�@�C����(�g���q����)
	 dialoginput ss,"�����N���̕ύX"
	 if refstr!"" {
	  ss=s+ss+tmp
	  tmp=s+refstr+tmp
	  ; s, ss �̓��e����x��ɂ��Ă����Ȃ��ƌ듮����N����
	  sdim s ,512 :s =tmp :getptr ps ,s  :tmp=ss
	  sdim ss,512 :ss=tmp :getptr pss,ss
	  ; �t�@�C�����̕ύX�����s
	  prmex=hwnd,4,pss,ps,$40,pi,0,0
	  dllprocp pfunc.FNC_SHFileOperationA,pprmex,1
	  if dllret=0 {
	   ; ����������f�[�^��������
	   i=prmex.10/filemax-1
	   notesel filelist.i
	   noteadd s,prmex.10\filemax,1
	   ; ���j���[�\����������ύX
	   s=refstr
	   tmenu s,prmex.10,hmenu.i
	   if i=0 :tmenu s,prmex.10,hmenu_ex
	   ; �A�v���o�^����Ă�����`�b�v�w���v�\����������ύX
	   ii=-1
	   repeat appnum
	    if appid.cnt=prmex.10 :ii=cnt :break
	   loop
	   if ii>=0 :apptitle.ii=s :tiphelp s,ii+1
	  }
	 }
	}
	;  �����N��̕ύX
	if dllret=22 {
	 tmp="properties" :pidl=0
	 ss=""
	 exec_ s,ss
	 goto *main
	}
	goto *main

; �ŏ���/���ɖ߂�

*minimize
	mii.1=1
	getmii hmenu_setting1,148
	minimized=mii.3&8=0
	gosub *minimize_
	goto *main


; �\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\
; �T�u���[�`��
; �\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\

; �����N���̎擾
;	�O��	���̃T�u���[�`������߂����� exec_ ���߂����s����K�v������
;	�g�p�l	dllret	/ �����擾���郊���N�ɑΉ����郁�j���[ID
;	�߂�l	ss	/ �����N���t�@�C��
;		s	/ �����N���t�@�C���ɓn���R�}���h���C��
;		tmp	/ �����N���t�@�C���̊g���q
;		pidl	/ ITEMIDLIST �ւ̃|�C���^(exec_ �p)

*getlink
	i=dllret/filemax-1
	notesel filelist.i
	noteget ss,dllret\filemax
	gosub *getext
	s=""
	if tmp="LNK" {
	 ; COM �ɂ�郊���N���t�@�C���̎擾
	 uni ss
	 ;  IPersistFile->Load
	 prmex=pss,0
	 prm=pprmex,2,5,pPersistFile
	 ll_callfunc prm,4,pCallMethod
	 ;
	 ;   �����̒��ɂ͂��̌� Resolve ���\�b�h�̎��s��K�v�Ƃ���|�̋L�q��������̂����������A
	 ;   �����N��t�@�C����t�H���_�����݂��邩�m�F���� ���݂��Ȃ��ꍇ�͈ړ�����������鏈��
	 ;   �Ȃ̂ŁA�ʂɖ����Ă��ǂ������B
	 ;
	 ;  IShellLink->GetPath
	 prmex=pss,512,pprmex,0
	 prm=pprmex,4,3,pShellLink
	 ll_callfunc prm,4,pCallMethod
	 exist_ ss
	 if stat=0 {
	  ;  IShellLink->GetIDList
	  ;
	  ;   �����ŃV�F���ɂ���č쐬���ꂽ ITEMIDLIST �\���̂̃������̈�́A
	  ;   �T�u���[�`������߂������ exec_ ���ߓ��ŉ������B
	  ;
	  prmex=pi
	  prm=pprmex,1,4,pShellLink
	  ll_callfunc prm,4,pCallMethod
	  pidl=i
	  prm=pidl,pss
	  dllprocp pfunc.FNC_SHGetPathFromIDListA,prm,2
	 } else :pidl=0
	 ;  IShellLink->GetArguments
	 prmex=ps,512
	 prm=pprmex,2,10,pShellLink
	 ll_callfunc prm,4,pCallMethod
	 ; �����N���t�@�C���̊g���q���擾
	 gosub *getext
	} else :pidl=0
	return

; ���C����ʂ̍ŏ���/���ɖ߂�
;	�g�p�l	minimized / �ŏ�������(1)����(0)��

*minimize_
	; width (appnum+1*(sysiconsize+mg)+mg+mg_girth+mg_hover)*(minimized=0)+mg_left+mg_girth,mg+mg_girth*2+sysiconsize+mg_hover
	if minimized {
	 dllprocp pfunc.FNC_CloseWindow,hwnd,1
	 gsel 4,-1
	} else {
	 gsel 4,1+forelock
	 dllprocp pfunc.FNC_OpenIcon,hwnd,1
	}
	mii.3=minimized*8
	setmii hmenu_setting1,148
	return

; �A�v���̓o�^�܂��͉���
;	�g�p�l	dllret	/ �o�^�܂��͉�������A�v���ɑΉ����郁�j���[ID

*modappli
	redraw 2
	; ���擾
	i=dllret/filemax-1 :ii=dllret
	prm=hmenu.i,ii
	mii.1=1 :getmii prm,prm.1
	; �o�^����
	if mii.3&8 {
	 ; �c���Ă���f�[�^�ƃ`�b�v�w���v�����ɃV�t�g
	 repeat appmax
	  if appid.cnt=ii :prmex.10=cnt :break
	 loop
	 tiphelp "",appnum
	 appnum--
	 repeat appnum-prmex.10,prmex.10
	  ii=cnt+1
	  appid.cnt=appid.ii
	  apptitle.cnt=apptitle.ii
	  tiphelp apptitle.cnt,cnt+1
	 loop
	 ; �A�v���A�C�R�������ɃV�t�g
	 pos prmex.10+1*(sysiconsize+mg)+mg_girth+mg_left,mg_girth
	 gcopy 4,prmex.10+2*(sysiconsize+mg)+mg_girth+mg_left,mg_girth,appnum-prmex.10*(sysiconsize+mg)+mg+mg_girth+mg_hover,winy-mg_girth
	 mii.3-=8
	; �o�^
	} else {
	 appid.appnum=ii
	 notesel filelist.i
	 ii=ii\filemax
	 noteget ss,ii
	 boxf_ appnum+1*(sysiconsize+mg)+mg+mg_girth+mg_left,mg_girth,appnum+2*(sysiconsize+mg)+mg_left+mg+mg_hover+mg_girth,winy-mg_girth,hdc,hbrush
	 prmex=appnum+1*(sysiconsize+mg)+mg+mg_left+mg_girth,mg+mg_girth
	 ; �A�v���A�C�R���̕`��
	 if oschk_ {
	  bitbltex bmscr.4,0,0,iconsize,iconsize,hbmp.i.ii,1
	  pos prmex,prmex.1
	  gzoom sysiconsize,sysiconsize,3,0,0,iconsize,iconsize
	 } else {
	  prmex.2=hdc,pss,pi
	  dllprocp pfunc.FNC_ExtractAssociatedIconA,prmex.2,3
	  if dllret {
	   i=dllret
	   prmex.2=hdc,prmex,prmex.1,i,sysiconsize,sysiconsize,0,0,3
	   dllprocp pfunc.FNC_DrawIconEx,prmex.2,9
	   dllprocp pfunc.FNC_DestroyIcon,i,1
	  }
	 }
	 ; �e�̕`��
	 color col,col.1,col.2
	 line prmex,prmex.1+sysiconsize,prmex+sysiconsize,prmex.1+sysiconsize
	 line prmex+sysiconsize,prmex.1,prmex+sysiconsize,prmex.1+sysiconsize
	 ; �`�b�v�w���v�o�^
	 gosub *getfolderlgt
	 strlen ii,ss
	 strmid ss,ss,i,ii-i
	 gosub *getext
	 strlen ii,ss
	 strmid apptitle.appnum,ss,0,ii-i-1
	 tiphelp apptitle.appnum,appnum+1
	 ; �A�v���o�^�����I
	 appnum++
	 mii.3+=8
	}
	width appnum+1*(sysiconsize+mg)+mg+mg_girth+mg_hover+mg_left+mg_girth,mg+mg_girth*2+sysiconsize+mg_hover
	; width (appnum+1*(sysiconsize+mg)+mg+mg_girth+mg_hover)*(minimized=0)+mg_left+mg_girth,mg+mg_girth*2+sysiconsize+mg_hover
	setmii prm,prm.1
	if prm=hmenu :setmii hmenu_ex,prm.1
	redraw 1
	return

; �A�v���A�C�R�����ړ�����
;	�g�p�l	i	/ �ړ�����A�v���A�C�R���̔ԍ�(1-)
;		ii	/ �ړ��̌���(0=��,1=�E)

*movappli
	if 2-ii>i|(appnum-ii<i) :return
	gosub *resappli
	redraw 2
	i--
	ii=ii*2-1
	; �ړ����A�C�R�����ꎞ�ޔ�
	gsel 3
	prm=i+1*(sysiconsize+mg)+mg+mg_left+mg_girth,mg+mg_girth
	gcopy 4,prm,prm.1,sysiconsize,sysiconsize
	; �ړ���A�C�R�����ړ����̈ʒu�Ɏ����Ă���
	gsel 4
	pos prm,prm.1
	gcopy 4,ii*(mg+sysiconsize)+prm,prm.1,sysiconsize,sysiconsize
	; �ޔ����Ă������ړ����A�C�R�����ړ���̈ʒu�Ɏ����Ă���
	pos ii*(mg+sysiconsize)+prm,prm.1
	gcopy 3,0,0,sysiconsize,sysiconsize
	; ���j���[ID�̓���ւ�
	ii+=i
	prmex		= appid.i
	s		= apptitle.i
	appid.i		= appid.ii
	apptitle.i	= apptitle.ii
	appid.ii	= prmex
	apptitle.ii	= s
	; �`�b�v�w���v�̓o�^
	tiphelp apptitle.i,i+1
	tiphelp apptitle.ii,ii+1
	redraw 1
	return

; �A�v���A�C�R�����A�N�e�B�u�ɂ���(mg_hover�����E���Ɉړ��\��)
;	�g�p�l	i	/ �A�N�e�B�u�ɂ���A�v���A�C�R���̔ԍ�(1-)
;	�߂�l	curappli/ �A�N�e�B�u�ȃA�v���A�C�R���̔ԍ�

*hovappli
	prm=i*(sysiconsize+mg)+mg+mg_left+mg_girth,mg+mg_girth
	redraw 2
	pos prm+mg_hover,prm.1+mg_hover
	gcopy 4,prm,prm.1,sysiconsize,sysiconsize
	color col,col.1,col.2
	line prm,prm.1-1,prm,prm.1+sysiconsize
	line prm,prm.1,prm+sysiconsize,prm.1
	curappli=i
	redraw 1
	return

; �A�N�e�B�u�������A�v���A�C�R�������ɖ߂�
;	�g�p�l	curappli/ �A�N�e�B�u�ȃA�v���A�C�R���̔ԍ�
;	�߂�l	curappli/ -1

*resappli
	if curappli>=0 {
	 redraw 2
	 prm=curappli*(sysiconsize+mg)+mg+mg_left+mg_girth,mg+mg_girth
	 pos prm,prm.1
	 gcopy 4,prm+mg_hover,prm.1+mg_hover,sysiconsize,sysiconsize
	 color col,col.1,col.2
	 line prm,prm.1+sysiconsize,prm+sysiconsize,prm.1+sysiconsize
	 line prm+sysiconsize,prm.1,prm+sysiconsize,prm.1+sysiconsize
	 curappli=-1
	 redraw 1
	}
	return

; [�@�\�̐ݒ�] ���j���[�Ƀ`�F�b�N��t����
;	�O��	mii.1=1, mii.3=8
;	�g�p�l	bandmode, noclickpop

*chkmenu_setting2
	mii.3=8
	setmii hmenu_setting2,bandmode+70
	if bandmode!'n' {
	 setmii hmenu_setting2,165+noclickpop
	 mii.3=bandmode='u'*8 :setmii hmenu_setting2,'u'+70
	 mii.3=bandmode='r'*8 :setmii hmenu_setting2,'r'+70
	 mii.3=bandmode='d'*8 :setmii hmenu_setting2,'d'+70
	 mii.3=bandmode='l'*8 :setmii hmenu_setting2,'l'+70
	} else {
	 mii.3=3
	 setmii hmenu_setting2,'u'+70
	 setmii hmenu_setting2,'r'+70
	 setmii hmenu_setting2,'d'+70
	 setmii hmenu_setting2,'l'+70
	}
	return

; �t�@�C�������̃��[�g�t�H���_�p�X�����擾
;	�g�p�l	ss	/ �t�@�C����
;	�߂�l	i	/ �t�H���_�p�X��

*getfolderlgt
	i=0
	repeat
	 instr ii,ss,"\\",i
	 if ii=-1 :break
	 i+=ii+1
	loop
	return

; �t�@�C���̊g���q���擾����
;	�g�p�l	ss	/ �t�@�C����
;	�߂�l	tmp	/ �g���q�����
;		i	/ �g���q��

*getext
	i=0
	repeat
	 instr ii,ss,".",i
	 if ii=-1 :break
	 i+=ii+1
	loop
	strlen ii,ss
	strmid tmp,ss,i,ii-i
	strlen i,tmp
	repeat i,0
	 peek ii,tmp,cnt
	 if (ii>='a')&(ii<='z') :ii-=32
	 poke tmp,cnt,ii
	loop
	return


; �\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\
; (C) arc��arcis 2004
; arX Launcher ���݃T�C�g �� http://hp.vector.co.jp/authors/VA022483/arxlc/?
