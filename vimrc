"Zorig's vimrc file

"Vim conf
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * Plugstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')
" let vim-plug using
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'mattn/emmet-vim'
Plug 'kien/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'ervandew/supertab'
Plug 'terryma/vim-multiple-cursors'
Plug 'scrooloose/nerdcommenter'
Plug 'mitsuhiko/vim-jinja', { 'for': ['htmljinja', 'htmldjangojinjahtml', 'htmldjango'] }
Plug 'Raimondi/delimitMate'
Plug 'alvan/closetag.vim'
Plug 'Valloric/MatchTagAlways'
Plug 'SirVer/ultisnips'
Plug 'tmhedberg/SimpylFold'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'tpope/vim-surround'
Plug 'joukevandermaas/vim-ember-hbs'
Plug 'jmcantrell/vim-virtualenv'
Plug 'davidhalter/jedi-vim', { 'for': 'python' }
Plug 'arcticicestudio/nord-vim'
Plug 'w0rp/ale'
Plug 'maralla/completor.vim'
Plug 'honza/vim-snippets'
Plug 'posva/vim-vue', { 'for': ['vue'] }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'mxw/vim-jsx', { 'for': ['javascript', 'jsx'] }
call plug#end()

set nu 					" Line number
let mapleader=","   	" Leader key
set nocompatible 		" Enable Vim features


filetype on 			" Enable file type detection
set smartindent
set cursorline          " highlight current line
set clipboard=unnamedplus "use system clipboard
set backspace=indent,eol,start
nmap <c-s> :w<CR>       " ctrl + s to save in normal mode
imap <c-s> <Esc>:w<CR>a " ctrl + s to save in insert mode
nmap <c-q> :q<CR>       " ctrl + q to quit
vmap <Leader>y "+y      " , + y to copy
nmap <Leader>p "+p      " , + p to paste in normal mode
nmap <Leader>P "+P      " , + p to paste in normal mode
vmap <Leader>p "+p      " , + p to paste in visual mode
vmap <Leader>P "+P      " , + p to paste in visual mode


"NERDTree
" Fast toggle
map <c-\> :NERDTreeToggle<CR>

" NerdTree
let g:NERDTreeMapOpenVSplit = 'a'
let g:NERDTreeCaseSensitiveSort = 1
let g:NERDTreeMouseMode = 3
let g:NERDTreeWinPos = 'right'
let g:NERDTreeBookmarksFile = $HOME . '/.vim/.nerdtree-bookmarks'
let g:NERDTreeIgnore=['\~$', 'node_modules', '.git', 'tmp', 'bower_components' ]
nmap w <C-w>

function! NERDTreeCustomIgnoreFilter(path)
  if b:NERDTreeShowHidden ==# 1
    return 0
  endif

  let pathlist = [
        \ $HOME . '/Desktop',
        \ $HOME . '/Documents',
        \ $HOME . '/Downloads',
        \ $HOME . '/Dropbox',
        \ $HOME . '/Music',
        \ $HOME . '/Pictures',
        \ $HOME . '/Videos',
        \]

  let patterns = [
        \ '\.min\.js$',
        \ '\.min\.css$',
        \]

  for p in pathlist
    if a:path.pathSegments == split(p, '/')
      return 1
    endif
  endfor

  for p in patterns
    if a:path.getLastPathComponent(0) =~# p
      return 1
    endif
  endfor
endfunction
" File type Plugs
filetype plugin on 		" Enable Plugs
filetype indent on 		" Enable indent
let $PYTHONDONTWRITEBYTECODE = 1 " Python dont write .pyc, pyo
let $PYTHONIOENCODING = 'utf-8'  " Python encoding= utf-8

" Turn on WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc,*.min.js
set wildignore+=.git\*,.hg\*,.svn\*,node_modules\*
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*,node_modules\*
endif

" Current position showing
set ruler

" Smart searching about cases
set ignorecase
" highlight search results
set hlsearch
set incsearch
" Show matching brackets when indicator over them
set showmatch

" Syntax highlight
syntax enable
set t_Co=256
set background=dark
syntax sync fromstart
if (has("termguicolors"))
  set termguicolors
endif
colorscheme nord
hi Directory guifg=#00FFFF ctermfg=cyan
":1 GUI only settings
if has('gui_running')
  set background=dark
  let g:airline#extensions#branch#enabled = 1
  let g:airline#extensions#ale#enabled = 1
  let g:airline_powerline_fonts   = 1
  set guioptions-=T             " Remove toolbar
  set guioptions-=l             " Remove scroll
  set guioptions-=L             " Remove scroll in splitted window
  set guioptions-=m             " Remove menu bar
  set guicursor+=a:blinkon0     " Disable cursor blinking
endif

" UTF-8 as standart
set encoding=utf8

set guifont=Source\ Code\ Pro\ for\ Powerline\ 11
"set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 11
" Linebreak on 500 characters
set lbr
set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" don't bother redrawing during macros and such
set lazyredraw

" Map <Space> to / (search) and Shift-<Space> to ? (backwards search)
map <space> /
map <s-space> ?
" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext
" Always show status line
set laststatus=2

" Spell check, press ss will toggle and untoggle spell checking
map <leader>ss : setlocal spell!<cr>

"Emmet just for html/css
let g:user_emmet_install_global = 1
autocmd FileType html,css EmmetInstall
let g:user_emmet_settings = {
  \ 'javascript.jsx': {
  \    'extends': 'jsx',
\ }
\}

" airline
""""""""""""""""""""""""""""""
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline_powerline_fonts   = 1
"
"CloseTag
autocmd FileType html,htmldjangojinjahtml,eruby,mako,jsx,js let b:closetag_html_style=1
autocmd FileType html,xhtml,xml,jinjahtml,jinja,eruby,mako,jsx,js source ~/.vim/bundle/closetag/Plug/closetag.vim

"emmet vim remap
imap ;; <C-y>,

"tab space
set shiftwidth=2
set softtabstop=2
set expandtab
set smarttab
set showtabline=2
autocmd FileType python,ruby,php,java,json setlocal ts=4 sw=4 sts=4 expandtab
autocmd FileType html,jinja,css,htmljinja,htmldjango,javascript,hbs,vue setlocal ts=2 sw=2 sts=2 expandtab

"folding
set foldmethod=indent
set foldlevel=99
set fillchars=vert:\|,fold:\  " Make foldtext more clean
nmap <space> za
set foldlevelstart=0
set foldnestmax=7
let python_fold=1 	"Python fold
let python_higlight_all=1
let javaScript_fold=1 	"Javascript fold
let html_fold=1 "HTML fold
autocmd FileType html,jinja,css,htmljinja,htmldjango,javascript.jsx setlocal foldmethod=indent

"indent guide
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level=1
let g:indent_guides_guide_size=1
hi IndentGuidesOdd ctermbg=lightgray
hi IndentGuidesEven ctermbg=blue
"django
let g:django_projects = '~/projects' "Sets all projects under project
let g:django_activate_virtualenv = 1 "Try to activate the associated virtualenv
let g:django_activate_nerdtree = 1 "Try to open nerdtree at the project root.

let g:mta_filetypes = {'html': 1, 'jinja': 1, 'xml': 1}
let g:mta_use_matchparan_group = 1
let g:mta_set_default_matchtag_color = 1
let g:ale_emit_conflict_warnings = 0

let g:ale_linters = {
\ 'javascript': ['eslint'],
\ 'vue': ['eslint'],
\ 'python': ['flake8', 'pylint'],
\}

let g:ale_fixers = {
\  'javascript': ['eslint', 'prettier'],
\  'python': ['black', 'pep8']
\}

" fix files automatically on save.
let g:ale_fix_on_save = 1
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'

" Trigger configuration
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsSnippetDirectories=["~/.vim/plugged/vim-snippets/UltiSnips"]
let g:vue_disable_pre_processors=1

let g:nord_cursor_line_number_background = 1
