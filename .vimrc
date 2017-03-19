set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'fzzylogic/Vundle.vim'

" VIM monokai color scheme - supports vim-gtk (gvim)
Plugin 'crusoexia/vim-monokai'

" :Search <term> to highlight all or :SearchReset to clear
" Plugin 'vim-scripts/MultipleSearch'

" Multi-cursor plugin. Visual mode (v) tap Ctrl-n for each new cursor starting
" at beginnging of words that match the current one.
" ctrl-p - go one step back
" ctrl-x - don't apply cursor to current match
" shift-I - enter edit mode so you can add text at these cursors
Plugin 'terryma/vim-multiple-cursors'

" Cloned from http://vim.wikia.com/wiki/Auto_highlight_current_word_when_idle
" For easy install with vundle.
Plugin 'fzzylogic/vim-auto-highlight.vim'

" Nice and fast file-finder for VIM
" However, it requires ruby..
" Plugin 'wincent/command-t'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}
" Plugin 'Enhanced-Javascript-syntax'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
syntax enable
colorscheme monokai
