# vimconf
Vimconf is a ready-to-use Vim configuration set that supports both \*nix and Windows systems. It includes a vimrc file, a dictionary, a colorscheme pack and a collection of plugins(managed with pathogen). 

## Features
The following customized features are defined in \_vimrc. 

* Brackets auto-pairing
* Dictionary completion
* Spelling correction key map
* Handy customized vim commands
* Code folding support for 10+ languages

### Included Plugins
Most of the plugins included here rank top 40 in downloads on [vim.org](vim.org). These plugins make your coding experience more seamless and comfortable. 

* [a.vim](https://github.com/vim-scripts/a.vim)
* [emmet-vim](https://github.com/mattn/emmet-vim)
* [neocomplcache](https://github.com/Shougo/neocomplcache.vim)
* [nerdcommenter](https://github.com/scrooloose/nerdcommenter)
* [nerdtree](https://github.com/scrooloose/nerdtree)
* [omnicppcomplete](https://github.com/vim-scripts/OmniCppComplete)
* [scrollcolors](https://github.com/vim-scripts/ScrollColors)
* [surround](http://github.com/tpope/vim-surround)
* [syntastic](https://github.com/vim-syntastic/syntastic)
* [taglist](https://github.com/vim-scripts/taglist.vim)
* [vim-pathogen](http://github.com/tpope/vim-pathogen)

### Key Mappings

Language | Key mapping | Supported By | Description
|--------|-------|-------|-------|
C/C++ | \<leader\>**pl**, \<leader\>**pg** | vimrc | Insert "#include" line like c.vim
C/C++ | \<leader\>**\+un** | vimrc | Insert "using namespace" line like c.vim
C/C++ | **:A** | A.vim | Toggle between header file and c/cxx file
C/C++ | \<leader\>**tl** | taglist | Display tags in the file
C/C++ | \<leader\>**;** | vimrc | Add semicolon at end of line
Perl | \<leader\>**{** | vimrc | Add bracket at end of line with line break and pairing
Python | \<leader\>**:** | vimrc | Add colon at end of line
HTML/XML | tag\<C-Y\>**,** | emmet | Make html tag pairs
HTML/XML | **ys**aw\<tag\> | surround | Add tag around word under cursor
markdown | **ys**aw**B** | surround | Add bold to the word under cursor
markdown | \<C-L\> | vimrc | Correct the spelling of the first misspelled word left of the cursor
SQL | \<leader\>**,** | vimrc | Add comma to end of line
\-  | \<space\> | vimrc | Toggle code fold
\-  | \<leader\>**c**\<space\> | nerdcommenter | Toggles the comment state of the selected line(s)
\-  | \<leader\>**tr** | NERDTree | Toggle file explorer panel

### Customized Commands
Command | Description
|-------|-----------|
**:Pickonly** regex | Delete all lines except lines with patter 'regex'
**:Cdfiledir** | Change directory to current file's enclosing directory
**:Chmod700** | Change file mode to 700 so as to make shell script executable
**:Rerunvimrc** | Rerun ~/\_vimrc
**:Ctags** | Run ctags recursively in current directory

## Installation
First download the repository.

```bash
git clone git@github.com:davidxk/vimconf.git
```

Next run installation script. 

* For Mac or Linux users, run
```
pushd vimconf; chmod 700 install.sh; ./install.sh; popd
```


* For Windows users, run ```install.bat```

## Try things out ... 
Here is a hint of some of the handy features that you simply cannot miss. 

* In insert mode, ```<C-X><C-K>``` for dictionary completion
* In normal mode, ```<C-L>``` for spelling correction in text/markdown editing
* In normal mode, ```:Cdfiledir``` to change working directory to enclosing directory of current file
* In normal mode, ```<Space>``` for toggle folding in code editing
* In normal mode, ```<leader>n``` to change color scheme
* In normal mode gVim, ```<leader>j``` to show more lines in the buffer. 
