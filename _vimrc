"Autocommands"
if has("autocmd")
   "$VIMRUNTIME/filetype.vim records all the filetype
   "The '{' bracket style languages
   autocmd FileType c,cpp,lex,java set tabstop=4
   autocmd FileType c,cpp,lex,java set shiftwidth=4
   autocmd FileType c,cpp,lex,java inoremap { {<Enter>}<Esc>O

   "C/C++ exclusive
   autocmd FileType c,cpp,lex,yacc inoremap \pg #include<space><><Esc>i
   autocmd FileType c,cpp,lex,yacc inoremap \pl #include<space>""<Esc>i
   autocmd FileType c,cpp,lex,yacc inoremap \+un using<space>namespace<space>
   autocmd FileType c,cpp,lex,yacc nnoremap \pg I#include<space><><Esc>i
   autocmd FileType c,cpp,lex,yacc nnoremap \pl I#include<space>""<Esc>i
   autocmd FileType c,cpp,lex,yacc nnoremap \+un Iusing<space>namespace<space>

   "lex"
   autocmd FileType lex set cindent
   autocmd FileType lex,yacc set tabstop=4
   autocmd FileType lex,yacc set shiftwidth=4
   autocmd FileType lex,yacc inoremap { {}<Esc>i
   autocmd BufNewFile,BufFilePre,BufRead *.ypp set filetype=yacc

   "Script languages
   autocmd FileType perl inoremap { {}<ESC>i
   autocmd FileType perl inoremap \{ <Esc>A{<Enter>}<Esc>O
   autocmd FileType python,perl,sh set tabstop=4
   autocmd FileType python,perl,sh set shiftwidth=4
   autocmd FileType python set foldmethod=indent

   "Javascript
   autocmd FileType javascript set tabstop=4
   autocmd FileType javascript set shiftwidth=4
   autocmd FileType javascript inoremap { {<Enter>}<Esc>O

   "Markup languages
   autocmd FileType text set spell
   autocmd FileType text set spelllang=en
   autocmd FileType html,jsp,xml set tabstop=2
   autocmd FileType html,jsp,xml set shiftwidth=2

   "Markdown language
   autocmd BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
   autocmd FileType markdown inoremap \> <Esc>A<br>
   autocmd FileType markdown nnoremap \> A<br><Esc>
   autocmd FileType markdown nnoremap <C-L> [s1z=<c-o>
   autocmd FileType markdown set foldmethod=marker
   autocmd FileType markdown set spell
   autocmd FileType markdown let b:surround_112 = "\\\\(\r\\\\)"
   autocmd FileType markdown let b:surround_80 = "\\\\(\r\\\\)"
   autocmd FileType markdown let b:surround_98 = "\\\\[\r\\\\]"
   autocmd FileType markdown let b:surround_66 = "\\\\[\r\\\\]"
   if(has("mac"))
	   autocmd FileType markdown nnoremap \mk :!open -a marked\ 2 %<CR><CR>
   endif

   "Arduino
   autocmd FileType arduino set tabstop=4
   autocmd FileType arduino set shiftwidth=4
   autocmd FileType arduino inoremap { {<Enter>}<Esc>O

   "SQL
   autocmd FileType sql set tabstop=4
   autocmd FileType sql set shiftwidth=4
   autocmd FileType sql nnoremap \, A,<Esc>
   let g:ftplugin_sql_omni_key = '<C-?>'

   if has("syntax")
	  let r_syntax_folding = 1
	  let sh_fold_enabled = 1
          let xml_syntax_folding = 1
          let perl_fold = 1
	  let vimsyn_folding = 'af'
	  let javaScript_fold = 1
      autocmd FileType c,cpp,h,lex set foldmethod=syntax
      autocmd FileType java set foldmethod=syntax
      autocmd FileType arduino set foldmethod=syntax
   endif
endif





"Settings"
if &diff
   set lines=24 columns=120
else
   set lines=24 columns=80
endif

set fileformats=unix,dos,mac

set fileencoding=utf-8
set fileencodings=utf-8,ucs-bom,cp936

set backspace=indent,eol,start
set cinoptions=g0

set clipboard+=unnamed
set dictionary+=$VIMFILES/bundle/dict/words

set display+=lastline

set linebreak
set incsearch
set ignorecase smartcase
set showcmd
set noexpandtab
set nocp





"let perl_fold_blocks = 1
if has("syntax")
   filetype on
   filetype plugin on
   filetype indent on
   syntax on
endif

"gui Settings"
if(has("win32")||has("win64"))
   set guifont=Courier_New:h18
   let $VIMFILES=$HOME.'/vimfiles'
else
   set guifont=Courier_New:h22
   let $VIMFILES=$HOME.'/.vim'
endif





"Mappings"
iabbrev inlcude include

nnoremap <C-Tab> gt
nnoremap <C-S-Tab> :tabp<CR>
nnoremap \tn :tabnew .<CR>
nnoremap <C-N> :tabnew<CR>

nnoremap <Space> @=((foldclosed(line('.'))<0)?'zc':'zo')<CR>

nnoremap \tr :NERDTreeToggle<CR>
nnoremap \tl :Tlist<CR>
nnoremap \l :se<Space>columns=120<CR>
nnoremap \h :se<Space>columns=80<CR>
nnoremap \j :se<Space>lines=30<CR>
nnoremap \k :se<Space>lines=24<CR>
nnoremap \; A;<Esc>
nnoremap \: A:<Esc>

inoremap <C-S> <Esc>:w<CR>a
inoremap <C-Z> <Esc>ua
inoremap \o <Esc>o
inoremap \; <Esc>A;
inoremap \: <Esc>A:
inoremap \, <Esc>A,
inoremap \j <Down>
inoremap \l <Right>

inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap " ""<Esc>i





if version >=7.4
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

command -nargs=1 Pickonly g/^\(\(<args>\)\@!.\)*$/d
command -nargs=0 Cdfiledir cd %:p:h





"#Plugins#"
"vim-pathogen"
":Helptags			//update help file of plugins
"git submodule foreach git pull origin master
let g:pathogen_disabled = []
runtime bundle/vim-pathogen/autoload/pathogen.vim

"OmniCppComplete"
set completeopt=menu
let OmniCpp_MayCompleteScope = 1

"Taglist"
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
