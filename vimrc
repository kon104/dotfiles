"#
"# .vimrc
"#

"#----------------------------------------------------------------------
"#  command
"#----------------------------------------------------------------------
syntax off		" カラー表示オフ

"#----------------------------------------------------------------------
"#  set options
"#----------------------------------------------------------------------
set tabstop=4
set ruler				" ルーラーを表示
set laststatus=2		" 常にステータス行を表示
set wildmenu			" 入力中の補完候補をステータスラインに表示
set statusline=%<%f\ %m%r%h%w%y%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%b\ 0x%B\ \ %l,%c%V%8P
						" ステータス行のフォーマット
set foldmethod=marker	" マーカーで折り畳み

"#----------------------------------------------------------------------
hi StatusLine term=NONE cterm=NONE ctermfg=black ctermbg=white

"#----------------------------------------------------------------------
"#  auto encoding (japanese)
"#----------------------------------------------------------------------
if &encoding !=# 'utf-8'
	set encoding=japan
endif
set fileencoding=japan
if has('iconv')
	let s:enc_euc = 'euc-jp'
	let s:enc_jis = 'iso-2022-jp'
	" iconvがJIS X 0213に対応しているかチェック
	if iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
		let s:enc_euc = 'euc-jisx0213'
		let s:enc_jis = 'iso-2022-jp-3'
	endif
	" fileencodingsを構築
	if &encoding ==# 'utf-8'
		let s:fileencodings_default = &fileencodings
		let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
		let &fileencodings = &fileencodings .','. s:fileencodings_default
		unlet s:fileencodings_default
	else
		let &fileencodings = &fileencodings .','. s:enc_jis
		set fileencodings+=utf-8,ucs-2le,ucs-2
		if &encoding =~# '^euc-\%(jp\|jisx0213\)$'
			set fileencodings+=cp932
			set fileencodings-=euc-jp
			set fileencodings-=euc-jisx0213
			let &encoding = s:enc_euc
		else
			let &fileencodings = &fileencodings .','. s:enc_euc
		endif
	endif
	" 定数を処分
	unlet s:enc_euc
	unlet s:enc_jis
endif

