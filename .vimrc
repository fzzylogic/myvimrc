set nocompatible              " disable vi compatibility (required by Vundle)
filetype off                  " force reloading *after* Vundle loaded (required by Vundle)

" ----------------------------------------------------------------------
" Vundle things 
" ----------------------------------------------------------------------
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'fzzylogic/Vundle.vim'

" VIM monokai color scheme - supports vim-gtk (gvim)
Plugin 'crusoexia/vim-monokai'

" Cloned from http://vim.wikia.com/wiki/Auto_highlight_current_word_when_idle
" For easy install with vundle.
Plugin 'fzzylogic/vim-auto-highlight.vim'

" Doesn't require +python vim
" :UndotreeToggle or map to key with e.g.:
" nnoremap <F5> :UndotreeToggle<cr>
Plugin 'mbbill/undotree'

" Nice and fast file-finder for VIM
" However, it requires ruby..
" Plugin 'wincent/command-t'

" Better than command-t
" Run :CtrlP or :CtrlP [starting-directory] to invoke CtrlP in find file mode.
" Run :CtrlPBuffer or :CtrlPMRU to invoke CtrlP in find buffer or find MRU file mode.
" Run :CtrlPMixed to search in Files, Buffers and MRU files at the same time.
" Check :help ctrlp-commands and :help ctrlp-extensions for other commands.
Plugin 'ctrlpvim/ctrlp.vim'

" Install ack plugin that uses ack or silver surfer to search 
" through source code for specific lines
" Usage
" :Ack [options] {pattern} [{directories}]
" e.g. :Ack function_name
" Use \\\ to escape chars like #
" Use :Ack! to not jump to first result automatically
Plugin 'mileszs/ack.vim'

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

" ----------------------------------------------------------------------
" Custom things 
" ----------------------------------------------------------------------
syntax enable           " enable syntax processing
colorscheme monokai     " use this colorscheme. It is loaded by Vundle.

" These options ensure no actual tabs are ever used. Useful for Python / Bash
" scripting.
set tabstop=4           " number of visual spaces per TAB
set softtabstop=4       " number of spaces in tab when editing (when tab is pressed)
set expandtab           " tabs are spaces

set number              " show line numbers
set cursorline          " highlight current line
filetype indent on      " load filetype-specific indent files e.g. ~/vim/indent/python.vim
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to (so not while running macros for e.g.)
set showmatch           " highlight matching [{()}] - this is on by default, but just to be safe..
set incsearch           " search as characters are entered
set hlsearch            " highlight matches

" turn off search highlight by pressing spacebar
" alternately this can be done with :noh
" nnoremap <space> :nohlsearch<CR>

set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
set nowrap              " disables linewrap (enable with :set wrap!)


" space open/closes folds (also default now..)
nnoremap <space> za

" fold based on indent level
" or: marker, manual, expr, syntax, diff
" help: foldmethod for more
set foldmethod=indent 

" visually select last inserted text
nnoremap gV `[v`]

" toggles visual undo tree with F5
" It shows where you are visually on when using 'u' or ctrl-r to undo or redo
" To change between branches on the tree, use :earlier or :later to tell vim
" which history branch you'd like to traverse.
nnoremap <F5> :UndotreeToggle<cr>

" put all persistent undo files in the same place
if has("persistent_undo")
    set undodir=~/.undodir/
    set undofile
endif

" Use silver surfer instead of ack with ack.vim
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

