
; �� arX Launcher 10.0x	�A�g�v���O�����̃T���v�� (7)
#define apptitle	"arXmp Controller"
;							 �ŏI�X�V�� 04/09/25
; �\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\

; arxmp �𐧌䂵�܂��B
; �S�R arxlc �ƘA�g���Ă܂���B����Ȃ̂��A���ł��B

; �� �g���@�\����N������Ɖ��y�� [�Đ�] ���܂��B
;    �V���[�g�J�b�g�̃R�}���h���C����
;	"C:\...\arxlc.exe" run:hidden\sample_07.xpi,prev
;    �ȂǂƎw�肷�邱�Ƃő��̋@�\�𗘗p�ł��܂��B

; �� mbmod.as �� arc��arcis �̃T�C�g���Ŕz�z���Ă��܂��B
; 04/09/23 �̎��_�ł̍ŐV�ł�
;	http://www.prenavi.net/~arcis/data/?mbmod.lzh

	; hdtp.as ���~�j llmod.as �Ƃ��ė��p
	; (hdtp_*** �ɂ��A�g�@�\�͕s�g�p)
	#include "hdtp.as"
	; mbmod.as �p�ɏ����g�[
	ll_libload D_KERNEL,"kernel32"

	; mbmod.as �� arxmp �Ƃ̃f�[�^�ʐM�Ɏg�p
	; (�ڍׂ� arxmp �J���җp�y�[�W���Q�Ƃ��ĉ�����)
	#include "mbmod.as"
	#define global xpi_playerinfo	"xmp400_info"
	#const global xpimsg_command	$504

	; arxmp �̏����擾
	sdim info,1024
	sdim s,512 :sdim ss,512
	mbload xpi_playerinfo,info
	if stat=2 {
	 dialog "arX MusicPlayer ���N�����Ă��܂���B",0,apptitle
	 end
	}
	notesel info
	notemax i
	repeat i
	 noteget s,cnt
	 strmid ss,s,0,8
	 if ss="syshwnd=" {
	  strlen i,s
	  strmid s,s,8,i-8
	  break
	 }
	loop
	syshwnd=s :int syshwnd

	; arxmp �ɖ��߂𑗐M
	;	#const menuFunc			700
	;	;   ���y�Đ�
	;	#const objMusic_Play		8
	;	#const objMusic_PlayPrev	9
	;	#const objMusic_PlayNext	10
	;	#const objMusic_Pause		11
	;	#const objMusic_Stop		12
	prm=syshwnd,xpimsg_command,700,bmscr@hdtp.13
	repeat
	 if cmdline="prev"	:prm.2+=9	:break
	 if cmdline="next"	:prm.2+=10	:break
	 if cmdline="pause"	:prm.2+=11	:break
	 if cmdline="stop"	:prm.2+=12	:break
	 prm.2+=8 ;="play"
	 break
	loop
	sendmsg prm
	end
	

; �\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\
; (C) arc��arcis 2004
; arX Launcher ���݃T�C�g �� http://hp.vector.co.jp/authors/VA022483/arxlc/?
