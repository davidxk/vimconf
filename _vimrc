"Autocommands"
if has("autocmd")
   autocmd FileType c,cpp,java,perl set tabstop=4
   autocmd FileType c,cpp,java,perl set shiftwidth=4
   autocmd FileType c,cpp,h nnoremap \pg I#include<space><><Esc>i
   autocmd FileType c,cpp,h nnoremap \pl I#include<space>""<Esc>i
   autocmd FileType c,cpp,h nnoremap \+un Iusing<space>namespace<space>
   autocmd FileType c,cpp,h inoremap \pg #include<space><><Esc>i
   autocmd FileType c,cpp,h inoremap \pl #include<space>""<Esc>i
   autocmd FileType c,cpp,h inoremap \+un using<space>namespace<space>
   autocmd FileType c,cpp,h inoremap { {<Enter>}<Esc>O

   autocmd FileType perl inoremap \{ <Esc>A{<Enter>}<Esc>O
   autocmd FileType perl inoremap { {}<ESC>i

   autocmd BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
   autocmd FileType text set spell
   autocmd FileType text set spelllang=en
   autocmd FileType html,jsp,xml set tabstop=2
   autocmd FileType html,jsp,xml set shiftwidth=2

   if has("syntax")
	  let perl_fold = 1
	  let g:xml_syntax_folding = 1
      autocmd FileType c,cpp,h set foldmethod=syntax
      autocmd FileType xml setlocal foldmethod=syntax
      autocmd FileType perl set foldmethod=syntax
   endif

endif





"Settings"
if &diff
   set lines=24 columns=120
else
   set lines=24 columns=80
endif

set fileformats=unix,mac,dos

set fileencoding=utf-8
set fileencodings=utf-8,ucs-bom,cp936

set backspace=indent,eol,start
set cinoptions=g0

set clipboard+=unnamed
set dictionary+=$VIMFILES/bundle/dict/words

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

"inoremap <C-V> <Esc>pa
inoremap <C-S> <Esc>:w<CR>a
inoremap <C-Z> <Esc>ua
inoremap \o <Esc>o
inoremap \; <Esc>A;
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

map <F5> :call CompileRun()<CR>
inoremap <F5> <Esc>:call CompileRun()<CR>a
func! CompileRun()
   exec "w"
   if &filetype == 'c'
      exec "!gcc % -o %<"
      if(has("win32")||has("win64"))
         exec "! %<"
      else 
	     exec "! ./%<"
      endif
   elseif &filetype == 'cpp'
      exec "!g++ % -o %<"
      if(has("win32")||has("win64"))
		 exec "! %<"
      else 
		  exec "! ./%<"
      endif
   elseif &filetype == 'java' 
      exec "!javac %" 
      exec "!java %<"
   elseif &filetype == 'sh'
      :!./%
   endif
endfunc





"#Plugins#"
"vim-pathogen"
":Helptags			//update help file of plugins
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

"OmniCppComplete"
set completeopt=menu
let OmniCpp_MayCompleteScope = 1
colorscheme molokai

"END"
endif
