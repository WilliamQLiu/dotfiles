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
Plugin 'Valloric/YouCompleteMe'
"Plugin 'jnurmine/Zenburn'  " Color Scheme for terminal mode
"Plugin 'altercation/vim-colors-solarized'  " Color Scheme for GUI mode

" Try :Explore or :Ex instead of NerdTree

" Tree File Explorer
Plugin 'scrooloose/nerdtree'

" Setup NERDtree Tabs"
Plugin 'jistr/vim-nerdtree-tabs'

" Jedi autocompletion library for Python
"Plugin 'davidhalter/jedi-vim'

" Check syntax, but runs a little slow
"Plugin 'scrooloose/syntastic'

" Faster than Syntastic, async to check syntax
"Plugin 'neomake/neomake'

" PEP8 autochecking
Plugin 'nvie/vim-flake8'

" Lightweight status/tabline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Git support
"Plugin 'tpope/vim-fugitive'

" Add gitgutter
"Plugin 'airblade/vim-gitgutter'

" Display list of buffers
"Plugin 'jeetsukumaran/vim-buffergator'

" Easily add, change, delete surrounding parenthesis
"Plugin 'tpope/vim-surround'

" Shortcuts for Ctags
Plugin 'szw/vim-tags'

" Nice JSON formatting
"Plugin 'elzr/vim-json'

" pep-8 indenting
"Plugin 'Vimjas/vim-python-pep8-indent'

" virtualenv
"Plugin 'jmcantrell/vim-virtualenv'

" Needed for Ag Search
"Plugin 'mileszs/ack.vim'

" Make splitting and moving on Neovim's Terminal easier (:term and :10Term for terminal w/ 10 height)
"Plugin 'mklabs/split-term.vim'

" Strip whitespace
"Plugin 'ntpeters/vim-better-whitespace'

" Add CtrlP Plugin to search files, buffers
Plugin 'ctrlpvim/ctrlp.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" END VUNDLE PLUGIN MANAGER

" VISUAL (COLORS, UI)
" colorscheme atom-dark-256
"set guifont=Monaco:h10
set number  " display line numbers by default
set noswapfile " Don't use swapfile
set nobackup " Don't create annoying backup files
set nowritebackup
"set cursorline "highlight current line  " runs slower
set nocursorline  " Do not highlight line
set nocursorcolumn  " Do not highlight column
set wildmenu " visual autocomplete for command menu, e.g. `:e ~/.vim<tab>`
set noshowmatch " do not highlight matching [{()}]
set colorcolumn=120 " Add a colored column here
set background=dark
"let g:solarized_termcolors=256
"let g:solarized_termtrans=1
colorscheme darkblue
set guioptions-=L
set guioptions+=a
set cmdheight=2 " command line height for messages

" Wildignore
set wildmode=list:full

set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX
set wildignore+=*.luac                           " Lua byte code
set wildignore+=migrations                       " Django migrations
set wildignore+=go/pkg                           " Go static files
set wildignore+=go/bin                           " Go bin files
set wildignore+=go/bin-vagrant                   " Go bin-vagrant files
set wildignore+=*.pyc                            " Python byte code
set wildignore+=*.orig                           " Merge resolution files
set wildignore+=.tmp
set wildignore+=*/.coverage,.coverage/**
set wildignore+=*/.git,.gitkeep
"set wildignore+=*__pycache__
set wildignore+=*.egg,*.egg-info
set wildignore+=*DS_Store*
set wildignore+=*.png,*.jpg,*.gif
"set wildignore+=__pycache__
"set wildignore+=*\\vendor\\**


syntax on " enable syntax processing
syntax sync minlines=200
set synmaxcol=300
"set re=1  " force old regex engine

" NAVIGATION
" Allow alternate navigation navigations
" set scrolljump=5 " lines to jump when cursor leaves screen
" set scrolloff=4 " minimum number of lines to keep above and below cursor


" TABS
" if you're new to vim and using tabs, you should probably use buffers instead
" Shift and Direction to change tabs instead of with 'gt' and 'gT'
"noremap <S-l> gt
"noremap <S-h> gT
"nnoremap tn :tabnew<Space>
"nnoremap tk :tabnext<CR>
"nnoremap tj :tabprev<CR>
"nnoremap th :tabfirst<CR>
"nnoremap tl :tablast<CR>

" WINDOWS
" Control + Direction to change PANES instead of Control + W + Direction
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k

" GENERAL SETTINGS
set encoding=utf-8    " add UTF-8 support
set clipboard=unnamed,unnamedplus
set autoread          " automatically reloads vim
set history=1000      " Store a lot of history
set ignorecase        " case insensitive
set smartcase         " use case if any caps used
set nowrap            " do not wrap lines
"set wrap              " wrap lines
set textwidth=79
set formatoptions=qrn1
set ruler             " show a ruler
set showcmd           " show commands as you type out
set showmode          " show current mode.
"set autoindent        " autoindent
set autowrite         " automatically save before :next, :make, etc
set ttyfast           " scroll fast
set lazyredraw        " wait to redraw
"set path+=**          " Allows search down into subfolders for tab-completion
set complete-=i
syntax on  " enable syntax highlighting

" SEARCH
set incsearch " show search match as you're typing in characters
set hlsearch  " search highlighting

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
"hide .pyc files
if !exists("g:NERDTreeIgnore")
    let g:NERDTreeIgnore=['\.vim$', '\~$', '\.pyc$', '\.swp$']
endif

let NERDTreeIgnore = ['\.pyc$', '\~$', '\.swp$']  "ignore files in NERDTree

" Enable syntax highlight for JSDocs
"let g:javascript_plugin_jsdoc = 1

" SYNTASTIC
set laststatus=2  " always show window info / is visible
set statusline=
"set statusline+=%F  " file name
set statusline+=%t%m  " show current file and modified flag [+]
set statusline+=%#warningmsg#  " show warning messages
"set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
"set statusline+=%l:%c(%p%%)  " show current line, column and percentage through file
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_python_pylint_post_args="--max-line-length=120"
"let g:syntastic_python_checkers = ['flake8']
"let g:syntastic_python_flake8_exec = 'python'
"let g:syntastic_python_flake8_args = ['-m', 'flake8']


" Airline Bar
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#right_sep = ' '
let g:airline#extensions#tabline#right_alt_sep = '|'
let g:airline_left_sep = ' '
let g:airline_left_alt_sep = '|'
let g:airline_right_sep = ' '
let g:airline_right_alt_sep = '|'
"let g:airline_theme= 'gruvbox'

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

" Time out on key codes but not mappings
" Makes terminal Vim work okay
set notimeout
set ttimeout
set ttimeoutlen=10

" In many terminal emulators the mouse works fine, enable it
if has('mouse')
    set mouse=a
endif

set runtimepath^=~/.vim/bundle/ctrlp.vim

" Remeber last known cursor position
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
"endif

" Plugin CtrlP options
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
"let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_max_files=0
"let g:ctrlp_max_depth=40

" Note: check .agignore if you're using `ag`, the silver searcher
let g:ctrlp_custom_ignore = '__pycache__\|build\|dist\|*.egg-info\|*.pyc\|__pycache__*'

" BufferGator Settings
" use the right side of the screen
"let g:buffergator_viewport_split_policy = 'R'
"let g:buffergator_suppress_keymaps = 1

" Buffer prev/next
"nnoremap <C-x> :bnext<CR>
"nnoremap <C-z> :bprev<CR>
nnoremap gn :bn<CR>
nnoremap gp :bp<CR>
nnoremap gd :bd<CR>

" Better split switching
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Set path to help 'find' find files
set path=$PWD/**

set splitright " Split vertical windows right to the current windows
set splitbelow " Split horizontal windows below to the current windows

set fileformats=unix,mac,dos  " Prefer Unix over Windows and Mac

" Time out on key codes but not mappings
" Makes terminal Vim work sanely
set notimeout
set ttimeout
set ttimeoutlen=10

" Function to activate a virtualenv in the embedded interpreter for
" omnicomplete and other things like that.
function LoadVirtualEnv(path)
    let activate_this = a:path . '/bin/activate_this.py'
    if getftype(a:path) == "dir" && filereadable(activate_this)
        python << EOF
import vim
activate_this = vim.eval('l:activate_this')
execfile(activate_this, dict(__file__=activate_this))
EOF
    endif
endfunction

" Load up a 'stable' virtualenv if one exists in ~/.virtualenv
let defaultvirtualenv = $HOME . "/.virtualenvs/stable"

" Only attempt to load this virtualenv if the defaultvirtualenv
" actually exists, and we aren't running with a virtualenv active.
if has("python")
    if empty($VIRTUAL_ENV) && getftype(defaultvirtualenv) == "dir"
        call LoadVirtualEnv(defaultvirtualenv)
    endif
endif

" Fix paste through ssh
set t_BE=

" Fix paste so doesn't auto indent
set paste
set pastetoggle=<F10>

set tags=./tags,tags;
set autochdir

set ff=unix

" Code search very fast w/ the silver searcher (`ag`)
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

set title  " show title of file on terminal

" Use ag instead
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" Neomake - When writing a buffer.
"call neomake#configure#automake('w')

" Neomake - Open the list automatically
"let g:neomake_open_list=2

" Remove trailing whitespace for python files
autocmd BufWritePre *.py %s/\s\+$//e
" Always call Flake8 on save
"autocmd BufWritePost *.py call Flake8()

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|pycache|__pycache__)$',
  \ 'file': '\v\.(exe|so|dll|pyc)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

let g:flake8_quickfix_height=7
let g:flake8_show_in_gutter=1 " show
let g:flake8_show_in_file=1 " show

"set guicursor=

" SPACES AND TABS
set backspace=indent,eol,start " use backspace like a normal program
set expandtab       " tabs are spaces
set tabstop=4       " Number of visual spaces per tab
set nosmartindent
set noautoindent
set nosmarttab
set shiftwidth=4    " Indents will have a width of 4
set softtabstop=4   " Sets the number of columns for a TAB
set sw=4

au FileType nginx setlocal noet ts=4 sw=4 sts=4

" Go settings
au BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4
" autocmd BufEnter *.go colorscheme nofrils-dark

" scala settings
autocmd BufNewFile,BufReadPost *.scala setl shiftwidth=2 expandtab

" Markdown Settings
autocmd BufNewFile,BufReadPost *.md setl ts=4 sw=4 sts=4 expandtab

" lua settings
autocmd BufNewFile,BufRead *.lua setlocal noet ts=4 sw=4 sts=4

" Dockerfile settings
autocmd FileType dockerfile set noexpandtab

" shell/config/systemd settings
autocmd FileType fstab,systemd set noexpandtab
autocmd FileType gitconfig,sh,toml set noexpandtab

" python indent
autocmd BufNewFile,BufRead *.py setlocal tabstop=4 softtabstop=4 shiftwidth=4 textwidth=120 expandtab

" ========= vim-better-whitespace ==================

" auto strip whitespace except for file with extention blacklisted
"let blacklist = ['markdown', 'md']
"autocmd BufWritePre * if index(blacklist, &ft) < 0 | StripWhitespace

" :call TrimWhitespace()
fun! TrimWhitespace()
    let l:save = winsaveview()  " save the current 'view'
    %s/\s\+$//e
    call winrestview(l:save)
endfun
" Create command :TrimWhitespace (instead of :call TrimWhitespace())
command! TrimWhitespace call TrimWhitespace()


let g:netrw_banner = 0
let g:netrw_liststyle = 3
"let g:netrw_browse_split = 2
let g:netrw_winsize = 25

