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
   autocmd FileType c,cpp,h set foldmethod=syntax

   autocmd FileType perl inoremap \{ <Esc>A{<Enter>}<Esc>O
   autocmd FileType perl inoremap { {}<ESC>i
   autocmd FileType perl set foldmethod=indent
   autocmd FileType txt set spell
   autocmd FileType txt set spelllang=en
   autocmd FileType html,jsp set tabstop=2
   autocmd FileType html,jsp set shiftwidth=2
endif

if &diff
   set lines=24 columns=120
else
   set lines=24 columns=80
endif



"Settings"
set fileformats=unix,mac,dos

set fileencoding=utf-8
set fileencodings=utf-8,ucs-bom,cp936

"set foldmethod=syntax

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

"let perl_fold = 1
"let perl_fold_blocks = 1

filetype on
filetype plugin on
filetype indent on
syntax on

"gui Settings"
if(has("win32")||has("win64"))
   set guifont=Courier_New:h18
   let $VIMFILES=$HOME.'/vimfiles'
else
   set guifont=Courier_New:h22
   let $VIMFILES=$HOME.'/.vim'
endif
colorscheme darkblue 

"Mappings"
nnoremap <C-Tab> gt
nnoremap <C-S-Tab> :tabp<CR>
nnoremap \tn :tabnew .<CR>
nnoremap <C-N> :tabnew<CR>

nnoremap <Space> @=((foldclosed(line('.'))<0)?'zc':'zo')<CR>
"vnoremap <C-C> y 
"nnoremap <C-V> p

nnoremap \tr :NERDTreeToggle<CR>
nnoremap \tl :Tlist<CR>

""nnoremap ;; A;<Esc>

inoremap <C-V> <Esc>pa
inoremap <C-S> <Esc>:w<CR>a
inoremap <C-Z> <Esc>ua
inoremap \o <Esc>o
inoremap \; <Esc>A;
inoremap \j <Down>
inoremap \l <Right>

inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap " ""<Esc>i
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

iabbrev inlcude include



"vim-pathogen"
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

"OmniCppComplete"
set completeopt=menu
let OmniCpp_MayCompleteScope = 1

"Notes"
""Encoding is for Vim's internal use.
""set cinoptions=>s,e0,n0,f0,{0,}0,^0,L-1,:s,=s,l0,b0,g0,hs,N0,ps,ts,is,+s,c3,C0,/0,(2s,us,U0,w0,W0,k0,m0,j0,J0,)20,*70,#0    
