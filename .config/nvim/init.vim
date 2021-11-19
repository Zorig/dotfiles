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
" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
" Nvim tree
Plug 'kyazdani42/nvim-tree.lua'
Plug 'kyazdani42/nvim-web-devicons'
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
Plug 'scrooloose/nerdcommenter'
Plug 'mattn/emmet-vim', { 'for': ['html', 'javascript', 'css', 'javascriptreact', 'typescriptreact'] }
" Syntax
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'neoclide/vim-jsx-improve', { 'for': ['typescript', 'ts', 'js', 'tsx', 'jsx', 'javascript', 'javascriptreact', 'typescriptreact'] }
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'js', 'javascriptreact'] }
Plug 'leafgarland/typescript-vim', { 'for': ['typescript', 'ts', 'tsx', 'typescriptreact'] }
Plug 'peitalin/vim-jsx-typescript', { 'for': ['typescript', 'tsx', 'typescriptreact', 'typescript.tsx'] }
Plug 'jparise/vim-graphql', { 'for': ['typescriptreact', 'javascriptreact'] }
" Wakatime
Plug 'wakatime/vim-wakatime'
Plug 'liuchengxu/eleline.vim'
call plug#end()

" General
let mapleader = "\<Space>"
noremap <C-J> <C-W>j
noremap <C-K> <C-W>k
noremap <C-H> <C-W>h
noremap <C-L> <C-W>l
set autoindent
set signcolumn=yes
set nocompatible
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
set nocursorline
set nowritebackup
set encoding=UTF-8
set ai
set si
filetype plugin on
syntax enable
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
let g:airline#extensions#tabline#enabled = 1
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

" Emmet
let g:user_emmet_install_global = 0
autocmd Filetype html,css,javascriptreact,typescriptreact EmmetInstall
let g:user_emmet_leader_key = '<C-z'

" Coc
let g:coc_global_extensions = ['coc-eslint', 'coc-prettier', 'coc-tsserver', 'coc-css', 'coc-json', 'coc-emmet', 'coc-pyright']
autocmd CursorHold * silent call CocActionAsync('highlight')
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
inoremap <silent><expr> <TAB>
\ pumvisible() ? "\<C-n>" :
\ <SID>check_back_space() ? "\<TAB>" :
\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
nnoremap <silent> K :call <SID>show_documentation()<CR>
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gd <Plug>(coc-definition)
nmap <leader> rn <Plug>(coc-rename)
nmap <leader> do <Plug>(coc-codeaction)
" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

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

" Filetype
"autocmd FileType python,ruby,php,java,json setlocal ts=4 sw=4 sts=4 expandtab
"autocmd FileType html,css,javascript,typescript,hbs setlocal ts=2 sw=2 sts=2 expandtab
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

" Fold
autocmd FileType html,css,javascript.jsx,typescript,typescriptreact,tsx,javascriptreact,python setlocal foldmethod=indent
nmap <space> za
set foldlevelstart=0

" IndentLine {{
let g:indentLine_first_char = '▏'
let g:indentLine_char_list = ['▏', '│', '┆', '┊']
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_setColors = 0
"}}

"Prettier {{
"let g:prettier#autoformat = 1
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')
"autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.yaml,*.html PrettierAsync
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
	set wildignore+=env,venv,.env,.venv
endif

"telescope
nnoremap <c-p> <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

lua << EOF
require('telescope').setup {
	defaults = {
		layout_strategy= 'vertical'
	}
}
EOF

"NvimTree
nnoremap <C-\> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
let g:nvim_tree_side = 'right'
let g:nvim_tree_gitignore = 1
let g:nvim_tree_disable_window_picker = 1
let g:nvim_tree_git_hl = 1
let g:nvim_tree_highlight_opened_files = 1
let g:nvim_tree_add_trailing = 1
let g:nvim_tree_show_icons = {
    \ 'git': 1,
    \ 'folders': 1,
    \ 'files': 1,
    \ 'folder_arrows': 1,
    \ }
lua << EOF
require'nvim-tree'.setup {
	diagnostics = {
    enable = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  },
	view = {
		side = 'right'
		}
	}
EOF
"Eleline
let g:eleline_powerline_fonts = 1
