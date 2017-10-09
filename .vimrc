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
" To install vundle the first time use:
" $ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" Plugin 'fzzylogic/Vundle.vim'

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
" Plugin 'mileszs/ack.vim'

" Good javascript syntax support
" Might be slow, disable unless needed.
Plugin 'pangloss/vim-javascript.git'

" Good python syntax folding plugin
" However, it is very slow.. , so disabling for now.
" Indexed based folding works fine for my needs and is much faster.
" Plugin 'tmhedberg/SimpylFold'

" Show number of matches when doing searches
" This can be done manually using - :%s/pattern//gn
" However this plugin will do it for any vim search method.
Plugin 'henrik/vim-indexed-search'

Plugin 'bitc/vim-bad-whitespace'

" syntax checking for many languages on save
" For python, requires flake8 or pylint (i prefer pylint)
" sudo -H pip3 install pylint
" For javascript, use: jshint (haven't tried eslint, maybe good too. jslint is too strict)
" sudo -H npm install -g jshint
" Slow on older hardware, disabled for now.
" Plugin 'vim-syntastic/syntastic'

" Valloric : Code completion for many languages
" Pretty slow..
Plugin 'Valloric/YouCompleteMe'

" nicer file manager than netrw
Plugin 'scrooloose/nerdtree'

" using vim tabs:
" Use tabnew, tabnext, tabprev, tabfirst, tablast

" use just one nerdtree
Plugin 'jistr/vim-nerdtree-tabs'

Plugin 'tpope/vim-fugitive'         " git integregation

" nice display
" Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

" nice footer display, lighter than powerline
Plugin 'vim-airline/vim-airline'

" match closing tags
" This has a bug where it doesn't correctly match to the last tag
" in some cases. For example, with nested tags, it will match the
" closing tag of the nested tag, instead of the outer tag.
" Using matchit below, we can find closing tags anywhere using %
" Plugin 'https://github.com/gregsexton/MatchTag'

" so % will jump to closing html / xml tags also
Plugin 'https://github.com/tmhedberg/matchit'

" Ultisnips code snippet plugin
Plugin 'SirVer/ultisnips'

" Snippets are separated from the ultisnips engine.
Plugin 'honza/vim-snippets'

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
" End of Vundle things
" ----------------------------------------------------------------------
syntax enable           " enable syntax processing

" Set gui fonts for linux or windows
if has('gui_running')
  " set guioptions-=T  " no toolbar
  if has('gui_win32')
    set guifont=DejaVu_Sans_Mono:h10:cANSI
  else
    set guifont=DejaVu\ Sans\ Mono\ 10
  endif
endif

" some vim-snippets things: Trigger configuration.
" Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
" If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"

" enable 256 color mode so editing in the terminal isn't
" quite so annoying.
set t_Co=256

" This is how one might use two colorschemes.
" However, i'm using monokai for gui and terminal.
" if has('gui_running')
colorscheme monokai     " loaded by Vundle
"    else
"        colorscheme zenburn
"    endif

" ensure syntastic uses pylint and jshint by default
" disabled pylint for now as it's too slow on older hardware.
" let g:syntastic_python3_checkers = ['pylint']
" let g:syntastic_javascript_checkers = ['jshint']

" recommended syntastic settings (i.e. waterwings)
" remove or modify as needed
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" must indicate python version your vim was compiled for.. else ycm will
" crash. When using venv, indicate name of python binary that matches the
" one vim was compiled for. Which basically means you can only use it when
" venv is activated if the non-activated python binary has a different name..
let g:ycm_server_python_interpreter = 'python'

let g:nerdtree_tabs_open_on_gui_startup=2       " only opens when opening a directory

set laststatus=2                                " so airline plugin status bar is always visible

" Applies to anything edited in vim.
" These options ensure no actual tabs are ever used. Useful for Python / Bash scripting.
set tabstop=4           " number of visual spaces per TAB
set softtabstop=4       " number of spaces in tab when editing (when tab is pressed)
set shiftwidth=4        " how many spaces to insert when auto indenting (< > , << >>)
set expandtab           " tabs are spaces
set linespace=5         " ensure underscores are visible

set colorcolumn=120     " show visual column at 120 char mark
" color can be set with below with std vim (but monokai theme already does this)
" highlight ColorColumn ctermbg=0 guibg=lightgrey

" Applies only to python files. PEP8 settings.
" au BufNewFile,BufRead *.py
"     \ set tabstop=4
"     \ set softtabstop=4
"     \ set shiftwidth=4
"     \ set textwidth=79
"     \ set expandtab
"     \ set autoindent
"     \ set fileformat=unix

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
" set foldnest higher to support more fold nesting. 1 is often all one needs.
set foldnestmax=2      " 1 nested fold max
set nowrap              " disables linewrap (enable with :set wrap!)


" space open/closes folds (also default now..)
nnoremap <space> za

" fold based on indent level
" or: marker, manual, expr, syntax, diff
" help: foldmethod for more
set foldmethod=indent
set encoding=utf-8      " set's uft-8 as the default encoding.
set ff=unix             " unix file format is the default. plays nicely with git.

" visually select last inserted text
nnoremap gV `[v`]

" toggles visual undo tree with F5
" It shows where you are visually when using 'u' or ctrl-r to undo or redo
" To change between branches on the tree, use :earlier or :later to tell vim
" which history branch you'd like to traverse. In gui mode you may simply
" click on the history point you want.
nnoremap <F5> :UndotreeToggle<cr>
nnoremap <F6> :NERDTreeToggle<cr>

nnoremap tn :tabnew<Space>
nnoremap tl :tabnext<cr>
nnoremap th :tabprev<cr>
nnoremap tj :tabfirst<cr>
nnoremap tk :tablast<cr>

" to strip all trailing whitespace
nnoremap strip :%s/\s\+$//e

" For Undotree : put all persistent undo files in the same place
if has("persistent_undo")
    set undodir=~/.undodir/
    set undofile
endif

" Use silver surfer instead of ack with ack.vim
" Silver surfer is for fuzzy file search
" if executable('ag')
"   let g:ackprg = 'ag --vimgrep'
" endif

" hide or show menubar, toolbar and vertical scrollbar
" hide icon toolbar by default
set go-=T

nnoremap <S-F1> :if &go=~#'m' <Bar>set go-=m <Bar>else <Bar>set go+=m <Bar>endif<CR>
nnoremap <S-F2> :if &go=~#'T' <Bar>set go-=T <Bar>else <Bar>set go+=T <Bar>endif<CR>
nnoremap <S-F3> :if &go=~#'r' <Bar>set go-=r <Bar>else <Bar>set go+=r <Bar>endif<CR>

" make window full screen.
:set lines=999 columns=999

" Since ALT-X happens to do this on most platforms..
" au GUIEnter * simalt ~x

" show tabs visually
set list
set listchars=tab:>-
