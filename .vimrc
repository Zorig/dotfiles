"Zorig's vimrc file

"Vim conf
set nu 					" Line number 
let mapleader=","   	" Leader key
set nocompatible 		" Enable Vim features
set runtimepath+=~/.vim " Pointing vim directory
execute pathogen#infect() 
filetype on 			" Enable file type detection 
syntax on 				" Enable syntax highlight
" File type plugins
filetype plugin on 		" Enable plugins
filetype indent on 		" Enable indent

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
colorscheme lucius
hi Directory guifg=#00FFFF ctermfg=cyan
":1 GUI only settings
if has('gui_running')
" solarized highlight
	set background=dark
	let g:solarized_termtrans=1
	let g:solarized_termcolors=256
	let g:solarized_contrast="high"
	let g:solarized_visibility="high"
	let g:airline_theme='solarized'
	let g:airline_enable_branch     = 1
	let g:airline_enable_syntastic  = 1
	let g:airline_powerline_fonts   = 1
	set guioptions-=T             " Remove toolbar
  	set guioptions-=l             " Remove scroll
  	set guioptions-=L             " Remove scroll in splitted window
	colorscheme solarized
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

" Common
let g:NERDTreeMapOpenVSplit = 'a'
let g:NERDTreeCaseSensitiveSort = 1
let g:NERDTreeMouseMode = 3
let g:NERDTreeWinPos = 'right'

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
          \ $HOME . '/Projects',	
          \ $HOME . '/webprojs',
          \ $HOME . '/opt',
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
let g:airline_enable_branch     = 1
let g:airline_enable_syntastic  = 1
let g:airline_powerline_fonts   = 1

"CloseTag 
autocmd FileType html,htmldjango,jinjahtml,eruby,mako let b:closetag_html_style=1
autocmd FileType html,xhtml,xml,htmldjango,jinjahtml,eruby,mako, source ~/.vim/bundle/closetag/plugin/closetag.vim

"emmet vim remap
imap mm <C-y>,
