# vimconf
* Super easy, one-click installation
* Extensive supports for multiple programming languages
* Compatibility across platforms and over different versions of Vim

## Installation
### Windows
Download the repository [here](https://github.com/davidxk/vimconf/archive/master.zip) and click ```install.bat```. 

### macOS and Linux
```bash
git clone git@github.com:davidxk/vimconf.git
pushd vimconf; chmod 700 install.sh; ./install.sh; popd
```

## Features
* Brackets auto-pairing
* Space key folding toggle
* Auto spell correction
* Handy customized vim commands
* Supports C/C++, Python, Scala, Markdown, Perl, HTML/XML, etc. 

![](demo.gif)

### Included Plugins
Selected from top 40 plugins in [vim.org](https://vim.sourceforge.io/scripts/script_search_results.php?keywords=&script_type=&order_by=downloads&direction=descending&search=search), managed with pathogen. 

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

### Customized Commands
Command | Description
|-------|-----------|
**:Tabr** | Close tabs to the right
**:Cdfiledir** | Change working directory to location of the file
**:Pickonly** regex | Delete all lines not matching pattern 'regex'
**:Chmod700** | Make current file executable
**:C** | Switch between .c file and .h file
**:Rerunvimrc** | Rerun ~/\_vimrc
**:Ctags** | Run ctags recursively in current directory


## Try these out ... 
Here is a hint of some of the handy features that you don't want to miss. 

* In insert mode, ```<C-X><C-K>``` for dictionary completion
* In normal mode, ```<C-L>``` for spell correction in text/markdown editing
* In normal mode, ```:Cdfiledir``` to change working directory to enclosing directory of current file
* In normal mode, ```<Space>``` for toggle folding in code editing
* In normal mode, ```<leader>n``` to change color scheme
* In normal mode gVim, ```<leader>j``` to show more lines in the buffer. 
