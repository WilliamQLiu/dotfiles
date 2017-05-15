
" Will's vimrc

" VUNDLE PLUGIN MANAGER
" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
set nocompatible " required
filetype off " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin() " alternatively, pass a path where Vundle should install plugins
Plugin 'VundleVim/Vundle.vim' " Let Vundle manage Vundle, required
"Plugin 'tmhedberg/SimpylFold' " helps with code folding
"Plugin 'vim-scripts/indentpython.vim' " helps with auto indents
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'jnurmine/Zenburn'  " Color Scheme for terminal mode
"Plugin 'altercation/vim-colors-solarized'  " Color Scheme for GUI mode
Plugin 'scrooloose/nerdtree' " Tree File Explorer
Plugin 'davidhalter/jedi-vim' " Jedi autocompletion library for Python
Plugin 'scrooloose/syntastic' " Check syntax
Plugin 'nvie/vim-flake8' " PEP8 autochecking
"Plugin 'jistr/vim-nerdtree-tabs' " Setup NERDtree Tabs
Plugin 'vim-airline/vim-airline' " Lightweight status/tabline
Plugin 'tpope/vim-fugitive' " Git support
"Plugin 'vim-airline/vim-airline-themes'
Plugin 'airblade/vim-gitgutter' " Add gitgutter
"Plugin 'pangloss/vim-javascript' " Add javascript code completion
"Plugin 'vbundles/ctrlp' " Add CtrlP Plugin to search files, buffers
Plugin 'jeetsukumaran/vim-buffergator' " Display list of buffers
Plugin 'tpope/vim-surround' " Easily add, change, delete surrounding parenthesis
Plugin 'szw/vim-tags' " Shortcuts for Ctags
Plugin 'elzr/vim-json' " Nice JSON formatting
Plugin 'Vimjas/vim-python-pep8-indent'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" END VUNDLE PLUGIN MANAGER

" VISUAL (COLORS, UI)
colorscheme atom-dark-256
set guifont=Monaco:h10
set number  " display line numbers by default
syntax enable " enable syntax processing
set showcmd " show commands in visual mode
set noswapfile " Don't use swapfile
set nobackup "Don't create annoying backup files
set cursorline "highlight current line
set wildmenu " visual autocomplete for command menu, e.g. `:e ~/.vim<tab>`
set showmatch " highlight matching [{()}]
set colorcolumn=120 " Add a colored column here
set background=dark
set cmdheight=4 " command line height for messages

" NAVIGATION
" Allow alternate navigation navigations
nnoremap <C-J> <C-W><C-J>
noremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set scrolljump=5 " lines to jump when cursor leaves screen
set scrolloff=5 " minimum number of lines to keep above and below cursor

" Shift and Direction to change TABS instead of with 'gt' and 'gT'
noremap <S-l> gt
noremap <S-h> gT

" Control + Direction to change PANES instead of Control + w
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k

" SPACES AND TABS
set shiftwidth=4    " Indents will have a width of 4
set softtabstop=4   " Sets the number of columns for a TAB
set expandtab       " tabs are spaces
set tabstop=4       " Number of visual spaces per tab
set backspace=indent,eol,start " use backspace like a normal program

" GENERAL SETTINGS
set encoding=utf-8    " add UTF-8 support
set clipboard=unnamed " enable normal clipboard
set autoread          " automatically reloads vim
set history=10000     " Store a ton of history
set ignorecase        " case insensitive
set smartcase         " use case if any caps used
"set nowrap            " do not wrap lines
set wrap
set textwidth=79
set formatoptions=qrn1
set mouse=a           " allow mouse movements
set ruler             " show a ruler
set showcmd           " show commands as you type out
set path+=**          " Allows search down into subfolders for tab-completion

" SEARCH
set incsearch " show search match as you're typing in characters
set hlsearch " search highlighting

" FOLDING CODE
set foldenable         " enable folding
set foldmethod=indent  " folds are based on indent level
set foldlevelstart=99  " open all folds by default
" Enable folding (open/close) with the spacebar
nnoremap <space> za

" MAPLEADER
:let mapleader = ',' " Create a mapleader

" NERDTREE
"autocmd VimEnter * NERDTree " NERDTree automatically opens when vim starts up
"autocmd VimEnter * wincmd p " Refocus window (go to previously accessed window) instead of NERDTree
" Open NERDTree with Control + N
map <C-n> :NERDTreeToggle<CR>
" hide .pyc files
if !exists("g:NERDTreeIgnore")
    let g:NERDTreeIgnore=['\.vim$', '\~$', '\.pyc$', '\.swp$']
endif

" Enable syntax highlight for JSDocs
let g:javascript_plugin_jsdoc = 1

" SYNTASTIC
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Airline Bar
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

" PYTHON
let python_highlight_all=1
" Load rope plugin
let g:pymode_rope=0
let g:pymode_folding=0
let g:jedi#show_call_signatures=0
let g:jedi#popup_on_dot=0

" Remaps insert mode typing 'jk' to be same as exit
:inoremap jk <esc>
let g:bufferline_echo=0

set runtimepath^=~/.vim/bundle/ctrlp.vim
