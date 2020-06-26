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
Plug 'dense-analysis/ale'
Plug 'ghifarit53/tokyonight.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'
Plug 'neoclide/coc.nvim', { 'tag': '*', 'do': { -> coc#util#install() } }
Plug 'mitsuhiko/vim-jinja', { 'for': ['htmljinja', 'htmldjangojinjahtml', 'htmldjango'] }
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'js'] }
Plug 'leafgarland/typescript-vim', { 'for': ['typescript', 'ts', 'tsx'] }
Plug 'peitalin/vim-jsx-typescript', { 'for': ['typescript', 'tsx'] }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Yggdroot/indentLine'
Plug 'davidhalter/jedi-vim', { 'for': ['python', 'py'] }
Plug 'mattn/emmet-vim', { 'for': ['html', 'css', 'jsx'] }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'terryma/vim-multiple-cursors'
Plug 'prettier/vim-prettier', { 'do': 'yarn install', 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
call plug#end()

" General
let mapleader = ","
noremap <C-J> <C-W>j
noremap <C-K> <C-W>k
noremap <C-H> <C-W>h
noremap <C-L> <C-W>l
set cursorline
set autoindent
set signcolumn=yes
set ruler
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
set ai
set si
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
imap <Tab> <C-n>

" Ale
let g:ale_sign_error = '✖'
let g:ale_sign_warning = '⚠'
let g:ale_python_flake8_executable = '/usr/bin/flake8'
let g:ale_linters = {
\ 'javascript': ['eslint'],
\ 'typescript': ['eslint',],
\ 'python': ['flake8',],
\}
let g:ale_fixes = {
\ 'javascript': ['eslint', 'prettier'],
\ 'typescript': ['eslint', 'prettier'],
\ 'python': ['black'],
\}
let g:ale_fix_on_save = 1

" Airline
let g:airline#extensions#ale#error_symbol = '✖:'
let g:airline#extensions#ale#warning_symbol = '⚠:'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline_powerline_fonts   = 1
let g:airline_theme = 'seoul256'


" Tokyo night specific
set termguicolors             " enable true color support
let g:tokyonight_style = 'storm' " available: night, storm
let g:tokyonight_enable_italic = 1
let g:tokyonight_disable_italic_comment = 1
colorscheme tokyonight

" Coc
let g:coc_global_extensions = ['coc-eslint', 'coc-prettier', 'coc-tsserver', 'coc-css', 'coc-json', 'coc-pyls']
autocmd CursorHold * silent call CocActionAsync('highlight')

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
endif
