# vimconf
This is my personal vim configurations, including a vimrc file, a dictionary, some color schemes and plugins managed with pathogen. It has been maintained for three years, since I started using Vim in my undergrad.

There's a lot of handy personalized configurations in vimrc and it supports folding and syntax highlight for a bunch of languages that I've been working with. I have been using it mainly for my Mac but I try to get it working compatibly with Windows and other Linux systems, as well.

Hope fellow vim-lovers could find something useful here! 

## Plugins
* [a.vim](https://github.com/vim-scripts/a.vim)
* [emmet-vim](https://github.com/mattn/emmet-vim)
* [nerdcommenter](https://github.com/scrooloose/nerdcommenter)
* [nerdtree](https://github.com/scrooloose/nerdtree)
* [omnicppcomplete](https://github.com/vim-scripts/OmniCppComplete)
* [scrollcolors](https://github.com/vim-scripts/ScrollColors)
* [surround](http://github.com/tpope/vim-surround)
* [taglist](https://github.com/vim-scripts/taglist.vim)
* [vim-pathogen](http://github.com/tpope/vim-pathogen)

> The plugins in this repository are downloaded from [vim.org](http://www.vim.org/scripts/index.php) since they are not updated frequently there and are free of the of ```.git/``` files. To get up-to-date versions of the plugins, please download them directly from github. Links given above. 

## Fun Things to Try Out
* in insert mode, ```<C-X><C-K>``` for dictionary completion
* in normal mode, ```<C-L>``` for spelling correction in text/markdown editing
* in normal mode, ```:Cdfiledir``` to change working directory to enclosing directory of current file
* in normal mode, ```<Space>``` for toggle folding in code editing
* in normal mode, ```\n``` to change color scheme
* in normal mode gVim, ```\j``` to show more lines in the buffer. 

## Install
* For Mac or Linux users, run ```install.sh```
* For Windows users, run ```install.bat```
