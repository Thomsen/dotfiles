"===========================vundle 插件管理==============================="
filetype off

set backupdir=~/.saves/vim

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'tpope/vim-rails.git'

Bundle 'L9'
Bundle 'FuzzyFinder'

Bundle 'git://git.wincent.com/command-t.git'

" 语法配色
Bundle 'tomasr/molokai'
" markdown vim mode
Bundle 'plasticboy/vim-markdown'
" write blog for oschina
Bundle 'vim-scripts/UltraBlog'
" c vim mode
Bundle 'vim-scripts/c.vim'

filetype plugin indent on

"====================================基本配置================================="
set nocompatible	" 关闭vi兼容模式

syntax on
colorscheme molokai

set cursorline		" 突出显示当前行


"===================================连接blog服务器============================"
if filereadable($HOME . '/.vim/vimrc/ultrablog.vimrc')
	source $HOME/.vim/vimrc/ultrablog.vimrc
endif
