"Zorig's vimrc file
set runtimepath+=~/.vim
execute pathogen#infect()
filetype off 
syntax on
filetype plugin indent on
" File type plugins
filetype plugin on
filetype indent on


" Auto read setting
set autoread

" Line number 
set nu

" Set 7 line to the cursor
set so=7

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

" Show matching brackets when indicator over them
set showmatch

" Syntax highlight
syntax enable
set t_Co=256
set background=light
color molokai


" UTF-8 as standart
set encoding=utf8

" space instead of tab, and smarttab

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

"--ENABLE PYTHON/DJANGO OMNICOMPLETE

filetype plugin on
set omnifunc=syntaxcomplete#Complete
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

"--SuperTab Integration
set completeopt-=previewtj
let g:SuperTabDefaultCompletionType = ""


