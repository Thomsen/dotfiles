"===========================vundle 插件管理==============================="
filetype off

set backupdir=~/.saves/vim

set rtp+=~/.vim/bundle/Vundle.vim/

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-fugitive'

Plugin 'L9'

Plugin 'git://git.wincent.com/command-t.git'

"git repos on your local machine
"Plugin 'file://home/'

Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

call vundle#end()

"Bundle 'Lokaltog/vim-easymotion'
"Bundle 'tpope/vim-rails.git'

"Bundle 'FuzzyFinder'

" 语法配色
Bundle 'tomasr/molokai'
" markdown vim mode
Bundle 'plasticboy/vim-markdown'
" write blog for oschina
Bundle 'vim-scripts/UltraBlog'
" c vim mode
Bundle 'vim-scripts/c.vim'

" :PluginList
" :PluginInstall
" :PluginSearch foo
" :PluginClearn

filetype plugin indent on

"====================================基本配置================================="
set nocompatible	" 关闭vi兼容模式

syntax on
"colorscheme molokai

set cursorline		" 突出显示当前行


"===================================连接blog服务器============================"
if filereadable($HOME . '/.vim/vimrc/ultrablog.vimrc')
	source $HOME/.vim/vimrc/ultrablog.vimrc
endif
