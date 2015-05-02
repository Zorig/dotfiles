"Zorig's vimrc file

"Vim conf
set nu 					" Line number 
let mapleader=","   	" Leader key
set nocompatible 		" Enable Vim features
set runtimepath+=~/.vim " Pointing vim directory
execute pathogen#infect() 
filetype on 			" Enable file type detection 
syntax on 				" Enable syntax highlight
set smartindent
nmap <c-s> :w<CR>       " ctrl + s to save in normal mode
imap <c-s> <Esc>:w<CR>a " ctrl + s to save in insert mode
nmap <c-q> :q<CR>       " ctrl + q to quit
" File type plugins
filetype plugin on 		" Enable plugins
filetype indent on 		" Enable indent
let $PYTHONDONTWRITEBYTECODE = 1 " Python dont write .pyc, pyo
let $PYTHONIOENCODING = 'utf-8'  " Python encoding= utf-8

" Turn on WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
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
colorscheme lapis256
hi Directory guifg=#00FFFF ctermfg=cyan
":1 GUI only settings
if has('gui_running')
" solarized highlight
	set background=dark
	let g:solarized_termtrans=1
	let g:solarized_termcolors=256
	let g:solarized_contrast="high"
	let g:solarized_visibility = "high"
	let g:airline_theme = ''
	let g:airline#extensions#branch#enabled = 1
	let g:airline#extensions#syntastic#enabled = 1
	let g:airline_powerline_fonts   = 1
	set guioptions-=T             " Remove toolbar
  	set guioptions-=l             " Remove scroll
  	set guioptions-=L             " Remove scroll in splitted window
	colorscheme underwater
endif

" UTF-8 as standart
set encoding=utf8

" 1tab = 4spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500
set ai "Auto indent 
set si "Smart indent
set wrap "Wrap lines

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

"NERDTree
" Fast toggle
map <F2> :NERDTreeToggle<CR>
nmap <W> <C-W>
" Common
let g:NERDTreeMapOpenVSplit = 'a'
let g:NERDTreeCaseSensitiveSort = 1
let g:NERDTreeMouseMode = 3
let g:NERDTreeWinPos = 'right'
nmap w <C-w>
function! NERDTreeCustomIgnoreFilter(path)
  if b:NERDTreeShowHidden ==# 0
    let patterns = [
          \ '\.min\.js$',
          \ '\.min\.css$',
          \ '\.eot$',
          \ '\.svg$',
          \ '\.ttf$',
          \ '\.woff$',
          \ '\.pyc$',
          \]

    let pathlist = [
          \ $HOME . '/Downloads',
          \ $HOME . '/Dropbox',
          \ $HOME . '/Videos',
          \ $HOME . '/Music',
          \ $HOME . '/Pictures',
          \ $HOME . '/Desktop',
          \ $HOME . '/Documents',
          \ $HOME . '/Public',
          \ $HOME . '/Templates',
          \ $HOME . '/VirtualBox VMs',
          \ $HOME . '/deja-dup',
          \]

    for p in pathlist
      if a:path.pathSegments == split(p, "/")
        return 1
      endif
    endfor

    for p in patterns
      if a:path.getLastPathComponent(0) =~# p
        return 1
      endif
    endfor
  endif
endfunction

" airline
""""""""""""""""""""""""""""""
let g:airline_theme             = 'lucius'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline_powerline_fonts   = 1
":1 Plugin - Syntastic
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_python_checkers = ['pyflakes']
let g:syntastic_auto_loc_list = 1
let g:syntastic_loc_list_height=3

"CloseTag 
autocmd FileType html,htmldjango,jinjahtml,eruby,mako let b:closetag_html_style=1
autocmd FileType html,xhtml,xml,htmldjango,jinjahtml,jinja,eruby,mako, source ~/.vim/bundle/closetag/plugin/closetag.vim

"emmet vim remap
imap ;; <C-y>,

"Vim-Django
let g:django_projects = '~/Projects/Django_' "Sets all projects under Project directory
let g:django_activate_virtualenv = 1 "Try to activate associated virtualenv
let g:django_activate_nerdtree = 1   "Try to open nerdtree at project

"tab space
autocmd FileType python setlocal sw=4 ts=4 sts=4 expandtab
autocmd FileType html,jinja,css,htmljinja setlocal ts=2 sw=2 expandtab
autocmd FileType javascript setlocal ts=4 sw=4 sts=0 noexpandtab

"folding
set foldmethod=indent
set foldlevel=99
nmap <space> za
set foldlevelstart=0
set foldnestmax=5
let python_fold=1 	"Python fold
let javaScript_fold=1 	"Javascript fold
let html_fold=1 "HTML fold
autocmd FileType html,jinja,css,htmljinja setlocal foldmethod=indent

"indent guide
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
hi IndentGuidesOdd ctermbg=lightgray
hi IndentGuidesEven ctermbg=blue
