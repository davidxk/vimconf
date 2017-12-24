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
set path+=**

if $TMUX == ''
	set clipboard+=unnamed
endif
let $VIMFILES = $HOME.'/.vim'
set dictionary+=$VIMFILES/bundle/dict/words

set display+=lastline
set tags=./tags;

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
	autocmd FileType c,cpp,lex,yacc inoremap <leader>pg #include<space><><Esc>i
	autocmd FileType c,cpp,lex,yacc inoremap <leader>pl #include<space>""<Esc>i
	autocmd FileType c,cpp,lex,yacc inoremap <leader>+un using<space>namespace<space>
	autocmd FileType c,cpp,lex,yacc nnoremap <leader>pg I#include<space><><Esc>i
	autocmd FileType c,cpp,lex,yacc nnoremap <leader>pl I#include<space>""<Esc>i
	autocmd FileType c,cpp,lex,yacc nnoremap <leader>+un Iusing<space>namespace<space>

	"lex"
	autocmd FileType lex set cindent
	autocmd FileType lex,yacc inoremap { {}<Esc>i
	autocmd BufNewFile,BufFilePre,BufRead *.ypp set filetype=yacc

	"Script languages
	autocmd FileType perl inoremap { {}<ESC>i
	autocmd FileType python set foldmethod=indent

	"K&R braces placement
	autocmd FileType go,perl,scala inoremap {<CR> {<CR>}<Esc>O
	autocmd FileType go,perl,scala inoremap <leader>{ <Esc>A{<Enter>}<Esc>O
	autocmd FileType go,perl,scala nnoremap <leader>{ A<space>{<Enter>}<Esc>O

	"Markup languages
	autocmd FileType html,jsp,xml set tabstop=2
	autocmd FileType html,jsp,xml set shiftwidth=2

	"Markdown language
	autocmd BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
	autocmd FileType markdown inoremap <leader>> <Esc>A<br>
	autocmd FileType markdown nnoremap <leader>> A<br><Esc>
	autocmd FileType markdown nnoremap <C-L> [s1z=<C-O>
	autocmd FileType markdown nnoremap <C-K> u<C-O>[s2z=<C-O>
	autocmd FileType markdown let b:surround_80 = "\\\\(\r\\\\)"
	autocmd FileType markdown let b:surround_112 = "\\\\(\r\\\\)"
	autocmd FileType markdown let b:surround_66 = "**\r**"
	autocmd FileType markdown let b:surround_98 = "\\\\[\r\\\\]"
	autocmd FileType markdown let b:surround_99 = "```\r```"
	autocmd FileType markdown set spell
	autocmd FileType markdown,text set spelllang=en
	autocmd FileType markdown,text set foldmethod=marker
	if(has("mac"))
		"Local marked2 shortcut
		autocmd FileType markdown nnoremap <leader>mk :silent !open -a marked\ 2 %<CR><CR>
		"Not supported on other systems
		set shortmess+=c
	endif

	"Arduino
	autocmd FileType arduino inoremap { {<Enter>}<Esc>O

	"SQL
	autocmd FileType sql nnoremap <leader>, A,<Esc>
	autocmd FileType sql inoremap <leader>, <Esc>A,
	let g:ftplugin_sql_omni_key = '<C-?>'

	if has("syntax")
		let r_syntax_folding = 1
		let sh_fold_enabled = 1
		let xml_syntax_folding = 1
		let perl_fold = 1
		let vimsyn_folding = 'af'
		autocmd FileType c,cpp,h,lex set foldmethod=syntax
		autocmd FileType java,scala  set foldmethod=syntax
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
nnoremap <leader>tn :tabe .<CR>
nnoremap <C-N> :tabnew<CR>
"nnoremap toggle folding
nnoremap <Space> @=((foldclosed(line('.'))<0)?'zc':'zo')<CR>
"nnoremap on <leader>
nnoremap <leader>tr :NERDTreeToggle<CR>
nnoremap <leader>tl :TlistToggle<CR>
nnoremap <leader>l :se<Space>columns=120<CR>
nnoremap <leader>h :se<Space>columns=80<CR>
nnoremap <leader>j :se<Space>lines=30<CR>
nnoremap <leader>k :se<Space>lines=24<CR>
nnoremap <leader>; A;<Esc>
nnoremap <leader>: A:<Esc>
"inoremap
inoremap <C-S> <Esc>:w<CR>a
inoremap <C-Z> <Esc>ua
inoremap <leader>o <Esc>o
inoremap <leader>; <Esc>A;
inoremap <leader>: <Esc>A:
inoremap <leader>j <Down>
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
inoremap <silent> <C-J> <C-r>=<SID>my_cr_function()<CR>
"Pairing
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap " ""<Esc>i
"Command
cnoremap Tabe tabe





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

	function! s:my_cr_function()
		return neocomplcache#close_popup() . "\<CR>"
	endfunction

	function! ToggleCAndHFile()
		if match(@%, "\.c$") != -1
			find %:t:r.h
		else
			find %:t:r.c
		endif
	endfunction

	"Customized commands
	if !exists(':Pickonly') && !exists(':Cdfiledir')
		
		"Usage: :Pickonly regex
		"Delete all lines except lines with patter 'regex'
		command -nargs=1 Pickonly g/^\(\(<args>\)\@!.\)*$/d
		
		"Usage: :Cdfiledir
		"Change directory to current file's enclosing directory
		command -nargs=0 Cdfiledir cd %:p:h

		"Usage: :Chmod700
		"Change file mode to 700 so as to make shell script executable
		command -nargs=0 Chmod700 silent !chmod 700 %

		"Usage: :Rerunvimrc
		"Rerun ~/_vimrc
		command -nargs=0 Rerunvimrc so ~/_vimrc

		"Usage: :Refresh
		"Refresh buffer
		command -nargs=0 Refresh e %

		"Usage: :Ctags
		"Run ctags recursively in current directory
		command -nargs=0 Ctags !ctags -R --c++-kinds=+p --fields=+iaS --extra=+qf
		"Usage: :Tabr
		"Close tabs to the right
		command -nargs=0 Tabr :.+1,$tabdo :q


		"Usage: :C   (called inside project root directory)
		"Switch between C file and Header file
		command -nargs=0 C call ToggleCAndHFile()
		
		"Typo saver
		command -nargs=0 W w

	endif




	"#Plugins#"
	"vim-pathogen"
	":Helptags			//update help file of plugins
	let g:pathogen_disabled = []
	runtime bundle/vim-pathogen/autoload/pathogen.vim

	"neocomplcache"
	let g:neocomplcache_enable_at_startup = 1

	"OmniCppComplete"
	set completeopt=menu
	let OmniCpp_MayCompleteScope = 1

	"Taglist"
	let Tlist_Show_One_File = 1
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
