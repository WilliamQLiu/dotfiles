" VUNDLE PLUGIN MANAGEm
" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
set nocompatible " required
filetype off " required
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin() 
" alternatively, pass a path where Vundle should install plugins

" Let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"Plugin 'tmhedberg/SimpylFold' " helps with code folding
"Plugin 'vim-scripts/indentpython.vim' " helps with auto indents
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'jnurmine/Zenburn'  " Color Scheme for terminal mode
"Plugin 'altercation/vim-colors-solarized'  " Color Scheme for GUI mode

" Tree File Explorer
Plugin 'scrooloose/nerdtree'

" Jedi autocompletion library for Python
Plugin 'davidhalter/jedi-vim'

" Check syntax
Plugin 'scrooloose/syntastic'

" PEP8 autochecking
Plugin 'nvie/vim-flake8'

" Setup NERDtree Tabs"
" Plugin 'jistr/vim-nerdtree-tabs'

" Lightweight status/tabline
Plugin 'vim-airline/vim-airline'

" Git support
Plugin 'tpope/vim-fugitive'

" Plugin 'vim-airline/vim-airline-themes'

" Add gitgutter
Plugin 'airblade/vim-gitgutter'

" Add CtrlP Plugin to search files, buffers
Plugin 'ctrlpvim/ctrlp.vim' 

" Display list of buffers
Plugin 'jeetsukumaran/vim-buffergator'

" Easily add, change, delete surrounding parenthesis
Plugin 'tpope/vim-surround'

" Shortcuts for Ctags
Plugin 'szw/vim-tags'

" Nice JSON formatting
Plugin 'elzr/vim-json'

" pep-8 indenting
Plugin 'Vimjas/vim-python-pep8-indent'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" END VUNDLE PLUGIN MANAGER

" VISUAL (COLORS, UI)
" colorscheme atom-dark-256
set guifont=Monaco:h10
set number  " display line numbers by default
syntax enable " enable syntax processing
set noswapfile " Don't use swapfile
set nobackup " Don't create annoying backup files
" set cursorline "highlight current line
set wildmenu " visual autocomplete for command menu, e.g. `:e ~/.vim<tab>`
set showmatch " highlight matching [{()}]
set colorcolumn=120 " Add a colored column here
set background=dark
set cmdheight=2 " command line height for messages

" NAVIGATION
" Allow alternate navigation navigations
nnoremap <C-J> <C-W><C-J>
noremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" set scrolljump=5 " lines to jump when cursor leaves screen
" set scrolloff=4 " minimum number of lines to keep above and below cursor


" TABS
" if you're new to vim and using tabs, you should probably use buffers instead
" Shift and Direction to change tabs instead of with 'gt' and 'gT'
"noremap <S-l> gt
"noremap <S-h> gT
nnoremap tn :tabnew<Space>
nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>
nnoremap th :tabfirst<CR>
nnoremap tl :tablast<CR>

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
set clipboard^=unnamed,unnamedplus
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
"set path+=**          " Allows search down into subfolders for tab-completion

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
"let g:javascript_plugin_jsdoc = 1

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
":ignoremap jk <esc>
let g:bufferline_echo=0

set runtimepath^=~/.vim/bundle/ctrlp.vim

set guicursor=

" Remeber last known cursor position
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

" Plugin CtrlP options
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

" BufferGator Settings
" use the right side of the screen
let g:buffergator_viewport_split_policy = 'R'
"let g:buffergator_suppress_keymaps = 1

" Buffer prev/next
nnoremap <C-x> :bnext<CR>
nnoremap <C-z> :bprev<CR>

" Better split switching
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Set path to help 'find' find files
set path=$PWD/**
