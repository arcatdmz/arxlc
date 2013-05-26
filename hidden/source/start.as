
; ■ arX Launcher Starter for arxlc ver.10.0x			      起動器
;							 最終更新日 04/09/11
; ―――――――――――――――――――――――――――――――――――――

; ※ EXE ファイル作成時 「メインウィンドウ非表示」をチェックすること。
; gsel 0,-1

; 各種オブジェクトファイルを run します。


; ―――――――――――――――――――――――――――――――――――――
; 準備
; ―――――――――――――――――――――――――――――――――――――

; コマンドラインの解析
; "run:HSPのオブジェクトファイル名,オブジェクトファイルに渡す新コマンドライン"

	sdim s,1024
	sdim ss,512
	s=cmdline
	strlen i,s
	strmid ss,s,0,4

	; プラグイン
	if ss="run:" {
	 i-=4
	 strmid ss,s,4,i
	 gosub *chkcmdline

	; ランチャー本体？
	} else {
	 s=exedir+"\\hidden\\startup.dat"
	 exist s
	 if strsize=-1 {
	  ss="hidden\\arxlc.ax"
	  s =cmdline

	 ; その他の何か
	 } else {
	  bload s,ss
	  s=""
	  strlen i,ss
	  gosub *chkcmdline
	 }

	}

; オブジェクトファイルの実行
	 exist exedir+"\\"+ss
	 if strsize=-1 {
	  dialog "\""+ss+"\" が見つかりません。",0,"arxlc starter"
	 } else :run exedir+"\\"+ss,s
	 end

; 新コマンドラインの検索
*chkcmdline
	instr ii,ss,",",0
	if ii!-1 {
	 strmid s,ss,ii+1,i-ii-1
	 strmid ss,ss,0,ii
	}
	return


; ―――――――――――――――――――――――――――――――――――――
; (C) arc＠arcis 2004
; arX Launcher 特設サイト ＠ http://hp.vector.co.jp/authors/VA022483/arxlc/?
