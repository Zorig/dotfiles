"""
"NVIM conf"
"""

if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
   \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

" Plugins
call plug#begin('~/.config/nvim/plugged')
Plug 'ghifarit53/tokyonight-vim'
"Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
" airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
" Nvim tree
Plug 'kyazdani42/nvim-tree.lua'
Plug 'kyazdani42/nvim-web-devicons', {'on': 'NvimTreeToggle'}
" 
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'Yggdroot/indentLine'
" GIT
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'rhysd/git-messenger.vim'
" Edit
Plug 'terryma/vim-multiple-cursors'
Plug 'prettier/vim-prettier', { 'do': 'yarn install', 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
Plug 'scrooloose/nerdcommenter'
" Syntax
Plug 'mattn/emmet-vim', { 'for': ['html', 'css', 'jsx', 'tsx'] }
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'neoclide/vim-jsx-improve', { 'for': ['typescript', 'ts', 'js', 'tsx', 'jsx'] }
Plug 'mitsuhiko/vim-jinja', { 'for': ['htmljinja', 'htmldjangojinjahtml', 'htmldjango'] }
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'js'] }
Plug 'leafgarland/typescript-vim', { 'for': ['typescript', 'ts', 'tsx'] }
Plug 'peitalin/vim-jsx-typescript', { 'for': ['typescript', 'tsx'] }
" Wakatime
Plug 'wakatime/vim-wakatime'
call plug#end()

" General
let mapleader = "\<Space>"
noremap <C-J> <C-W>j
noremap <C-K> <C-W>k
noremap <C-H> <C-W>h
noremap <C-L> <C-W>l
set cursorline
set autoindent
set signcolumn=yes
set nocompatible
set ruler
set hidden
set number
set showmatch
set hlsearch
set incsearch
set ignorecase
set smartcase
set tabstop=2
set softtabstop=2
set shiftwidth=2
set smarttab
set mouse=a
set splitbelow
set splitright
set conceallevel=0
set nobackup
set nowritebackup
set encoding=UTF-8
set ai
set si
syntax enable
filetype plugin on
nmap w <C-w>
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>t> :tabnext<cr>
noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p
noremap <C-t> :bottom terminal<CR>

" Airline
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#coc#enabled = 1
let airline#extensions#coc#error_symbol = '✖:'
let airline#extensions#coc#warning_symbol = 'W:'

let g:airline_theme = 'seoul256'

" Tokyo night specific
set termguicolors             " enable true color support
let g:tokyonight_style = 'storm' " available: night, storm
let g:tokyonight_enable_italic = 1
let g:tokyonight_disable_italic_comment = 1
colorscheme tokyonight

" Coc
let g:coc_global_extensions = ['coc-eslint', 'coc-prettier', 'coc-python', 'coc-tsserver', 'coc-css', 'coc-json', 'coc-pyls', 'coc-java', 'coc-jedi', 'coc-graphql']
autocmd CursorHold * silent call CocActionAsync('highlight')
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
inoremap <silent><expr> <TAB>
	\ pumvisible() ? "\<C-n>" :
	\ <SID>check_back_space() ? "\<TAB>" :
	\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
nnoremap <silent> K :call <SID>show_documentation()<CR>
nmap <silent> gr <Plug>(coc-references)

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col-1] =~# '\s'
endfunction

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

let g:python3_host_prog = expand("/usr/bin/python3")

"Emmet just for html/css
imap ;; <C-y>,
let g:user_emmet_install_global = 1
autocmd FileType html,css,js EmmetInstall
let g:user_emmet_settings = {
\ 'javascript.jsx': {
\		'extends': 'jsx',
\ }
\}

" Filetype
autocmd FileType python,ruby,php,java,json setlocal ts=4 sw=4 sts=4 expandtab
autocmd FileType html,jinja,css,htmljinja,htmldjango,javascript,typescript,hbs setlocal ts=2 sw=2 sts=2 expandtab
au BufNewFile,BufRead *.ts set filetype=typescript.tsx
au BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx

" Fold
autocmd FileType html,jinja,css,htmljinja,htmldjango,javascript.jsx,typescript,tsx setlocal foldmethod=indent
nmap <space> za
set fillchars=vert:\|,fold:\
set foldlevelstart=0

" NERDTree {{
map <C-\> :NERDTreeToggle<CR>
let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrowCollapsible = '⬎'
let g:NERDTreeMapOpenVSplit = 'a'
let g:NERDTreeCaseSensitiveSort = 1
let g:NERDTreeMouseMode = 3
let g:NERDTreeWinPos = 'right'
let g:NERDTreeRespectWildIgnore = 1
"}}

" IndentLine {{
let g:indentLine_first_char = '▏'
let g:indentLine_char_list = ['▏', '│', '┆', '┊']
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_setColors = 0
"}}

"Prettier {{
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.yaml,*.html PrettierAsync
let g:prettier#config#single_quote = 'false'
let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#arrow_parens = 'avoid'
let g:prettier#config#parser = 'babylon'
let g:prettier#config#trailing_comma = "none"
"}}

" typescript
let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_options = '--p tsconfig.json'

"true Wildmenu
if has('wildmenu')
	set wildmenu
	set wildmode=list:longest,full
	set wildoptions=tagfile
	set wildignorecase
	set wildignore+=.git,.hg,.svn,.stversions,*.pyc,*.spl,*.o,*.out,*~,%*
	set wildignore+=*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store
	set wildignore+=**/node_modules/**,**/bower_modules/**,*/.sass-cache/*
	set wildignore+=__pycache__,*.egg-info,.pytest_cache
	set wildignore+=env,venv
endif

"telescope
nnoremap <c-p> <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>	

lua << EOF
require('telescope').setup{
	defaults = {
		layout_strategy= 'vertical'
	}
}
EOF
"NvimTree
nnoremap <C-\> :NvimTreeToggle<CR>
nnoremap r :NvimTreeRefresh<CR>
nnoremap n :NvimTreeRefresh<CR>
let g:nvim_tree_side = 'right'
let g:nvim_tree_ignore = ['.git', 'node_modules', '.cache']
