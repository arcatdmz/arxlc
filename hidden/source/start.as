
; �� arX Launcher Starter for arxlc ver.10.0x			      �N����
;							 �ŏI�X�V�� 04/09/11
; �\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\

; �� EXE �t�@�C���쐬�� �u���C���E�B���h�E��\���v���`�F�b�N���邱�ƁB
; gsel 0,-1

; �e��I�u�W�F�N�g�t�@�C���� run ���܂��B


; �\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\
; ����
; �\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\

; �R�}���h���C���̉��
; "run:HSP�̃I�u�W�F�N�g�t�@�C����,�I�u�W�F�N�g�t�@�C���ɓn���V�R�}���h���C��"

	sdim s,1024
	sdim ss,512
	s=cmdline
	strlen i,s
	strmid ss,s,0,4

	; �v���O�C��
	if ss="run:" {
	 i-=4
	 strmid ss,s,4,i
	 gosub *chkcmdline

	; �����`���[�{�́H
	} else {
	 s=exedir+"\\hidden\\startup.dat"
	 exist s
	 if strsize=-1 {
	  ss="hidden\\arxlc.ax"
	  s =cmdline

	 ; ���̑��̉���
	 } else {
	  bload s,ss
	  s=""
	  strlen i,ss
	  gosub *chkcmdline
	 }

	}

; �I�u�W�F�N�g�t�@�C���̎��s
	 exist exedir+"\\"+ss
	 if strsize=-1 {
	  dialog "\""+ss+"\" ��������܂���B",0,"arxlc starter"
	 } else :run exedir+"\\"+ss,s
	 end

; �V�R�}���h���C���̌���
*chkcmdline
	instr ii,ss,",",0
	if ii!-1 {
	 strmid s,ss,ii+1,i-ii-1
	 strmid ss,ss,0,ii
	}
	return


; �\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\�\
; (C) arc��arcis 2004
; arX Launcher ���݃T�C�g �� http://hp.vector.co.jp/authors/VA022483/arxlc/?
