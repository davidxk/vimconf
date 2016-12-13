"Settings"
if &diff
	set lines=24 columns=120	"For vimdiff mode
else
	set lines=24 columns=80		"Default size
endif

set tabstop=4
set shiftwidth=4

set fileformats=unix,dos,mac
set fileencoding=utf-8
set fileencodings=utf-8,ucs-bom,cp936

set backspace=indent,eol,start
set cinoptions=g0				"C indent option: indented 'case' 

set clipboard+=unnamed
let $VIMFILES = $HOME.'/.vim'
set dictionary+=$VIMFILES/bundle/dict/words

set display+=lastline

set linebreak
set incsearch
set ignorecase smartcase
set showcmd
set noexpandtab
set nocp





"Autocommands"
if has("autocmd")
	"$VIMRUNTIME/filetype.vim records all the filetype
	"The '{' brace style languages
	autocmd FileType c,cpp,lex,java,javascript inoremap { {<Enter>}<Esc>O

	"C/C++ exclusive
	autocmd FileType c,cpp,lex,yacc inoremap \pg #include<space><><Esc>i
	autocmd FileType c,cpp,lex,yacc inoremap \pl #include<space>""<Esc>i
	autocmd FileType c,cpp,lex,yacc inoremap \+un using<space>namespace<space>
	autocmd FileType c,cpp,lex,yacc nnoremap \pg I#include<space><><Esc>i
	autocmd FileType c,cpp,lex,yacc nnoremap \pl I#include<space>""<Esc>i
	autocmd FileType c,cpp,lex,yacc nnoremap \+un Iusing<space>namespace<space>

	"lex"
	autocmd FileType lex set cindent
	autocmd FileType lex,yacc inoremap { {}<Esc>i
	autocmd BufNewFile,BufFilePre,BufRead *.ypp set filetype=yacc

	"Script languages
	autocmd FileType perl inoremap { {}<ESC>i
	autocmd FileType perl inoremap \{ <Esc>A{<Enter>}<Esc>O
	autocmd FileType python set foldmethod=indent

	"Markup languages
	autocmd FileType html,jsp,xml set tabstop=2
	autocmd FileType html,jsp,xml set shiftwidth=2

	"Markdown language
	autocmd BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
	autocmd FileType markdown inoremap \> <Esc>A<br>
	autocmd FileType markdown nnoremap \> A<br><Esc>
	autocmd FileType markdown nnoremap <C-L> [s1z=<c-o>
	autocmd FileType markdown let b:surround_112 = "\\\\(\r\\\\)"
	autocmd FileType markdown let b:surround_80 = "\\\\(\r\\\\)"
	autocmd FileType markdown let b:surround_98 = "\\\\[\r\\\\]"
	autocmd FileType markdown let b:surround_66 = "**\r**"
	autocmd FileType markdown,text set spell
	autocmd FileType markdown,text set spelllang=en
	autocmd FileType markdown,text set foldmethod=marker
	if(has("mac"))
		"Local marked2 shortcut
		autocmd FileType markdown nnoremap \mk :!open -a marked\ 2 %<CR><CR>
	endif

	"Arduino
	autocmd FileType arduino inoremap { {<Enter>}<Esc>O

	"SQL
	autocmd FileType sql nnoremap \, A,<Esc>
	autocmd FileType sql inoremap \, <Esc>A,
	let g:ftplugin_sql_omni_key = '<C-?>'

	if has("syntax")
		let r_syntax_folding = 1
		let sh_fold_enabled = 1
		let xml_syntax_folding = 1
		let perl_fold = 1
		let vimsyn_folding = 'af'
		autocmd FileType c,cpp,h,lex set foldmethod=syntax
		autocmd FileType java set foldmethod=syntax
		autocmd FileType arduino set foldmethod=syntax
	endif
endif





"If support syntax"
if has("syntax")
	filetype on
	filetype plugin on
	filetype indent on
	syntax on
endif

"GUI Settings"
if(has("win32")||has("win64"))
	set runtimepath+=~/.vim
	set guifont=Courier_New:h18
elseif(has("gui_gtk2"))
	set guifont=Courier\ 18
else
	set guifont=Courier_New:h22
endif





"Mappings"
iabbrev inlcude include
"nnoremap for tabs
nnoremap <C-Tab> gt
nnoremap <C-S-Tab> gT
nnoremap \tn :tabe .<CR>
nnoremap <C-N> :tabnew<CR>
"nnoremap toggle folding
nnoremap <Space> @=((foldclosed(line('.'))<0)?'zc':'zo')<CR>
"nnoremap on <leader>
nnoremap \tr :NERDTreeToggle<CR>
nnoremap \tl :Tlist<CR>
nnoremap \l :se<Space>columns=120<CR>
nnoremap \h :se<Space>columns=80<CR>
nnoremap \j :se<Space>lines=30<CR>
nnoremap \k :se<Space>lines=24<CR>
nnoremap \; A;<Esc>
nnoremap \: A:<Esc>
"inoremap
inoremap <C-S> <Esc>:w<CR>a
inoremap <C-Z> <Esc>ua
inoremap \o <Esc>o
inoremap \; <Esc>A;
inoremap \: <Esc>A:
inoremap \j <Down>
inoremap \l <Right>
"Pairing
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap " ""<Esc>i





"Uncompatible part"
if version >= 7.4
	"START"
	inoremap ) <C-R>=ClosePair(')')<CR>
	inoremap ] <C-R>=ClosePair(']')<CR>
	inoremap } <C-R>=ClosePair('}')<CR>

	function! ClosePair(char)
		if getline('.')[col('.')-1]==a:char
			return "\<Right>"
		endif
		return a:char
	endfunction

	if !exists(':Pickonly') && !exists(':Cdfiledir')
		
		"Usage: :Pickonly regex
		"Delete all lines except lines with patter 'regex'
		command -nargs=1 Pickonly g/^\(\(<args>\)\@!.\)*$/d
		
		"Usage: :Cdfiledir
		"Change directory to current file's enclosing directory
		command -nargs=0 Cdfiledir cd %:p:h

	endif





	"#Plugins#"
	"vim-pathogen"
	":Helptags			//update help file of plugins
	let g:pathogen_disabled = []
	runtime bundle/vim-pathogen/autoload/pathogen.vim

	"OmniCppComplete"
	set completeopt=menu
	let OmniCpp_MayCompleteScope = 1

	"Taglist"
	"If exuberant ctags not installed, disable Taglist
	if !exists('Tlist_Ctags_Cmd')
		if executable('exuberant-ctags')
			let Tlist_Ctags_Cmd = 'exuberant-ctags'
		elseif executable('exctags')
			let Tlist_Ctags_Cmd = 'exctags'
		elseif executable('ctags')
			let Tlist_Ctags_Cmd = 'ctags'
		elseif executable('ctags.exe')
			let Tlist_Ctags_Cmd = 'ctags.exe'
		elseif executable('tags')
			let Tlist_Ctags_Cmd = 'tags'
		else
			call add(g:pathogen_disabled, 'taglist')
		endif
	endif

	"#END of Plugins#"
	call pathogen#infect()
	colorscheme molokai


	"END"
endif
