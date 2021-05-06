" nvim/tool installation (Ubuntu 18.04LTS)
"
" sudo apt install neovim
" sudo update-alternatives --config vi
" sudo apt install python3-pip
" pip3 install --user pynvim
" sudo apt install clang
" sudo apt install libclang-dev
" sudo apt install clang-format
" sudo apt install universal-ctags
" sudo apt install silversearcher-ag
" sudo apt install fzf
" sudo apt install bat

set hlsearch
set number
set shiftwidth=4
set expandtab
"set clipboard+=unnamed

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'deoplete-plugins/deoplete-clang'

Plug 'Shougo/neoinclude.vim'

Plug 'dense-analysis/ale'

Plug 'sbdchd/neoformat'

Plug 'ludovicchabant/vim-gutentags'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Initialize plugin system
call plug#end()

" deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#clang#libclang_path = '/usr/lib/llvm-10/lib/libclang.so'
let g:deoplete#sources#clang#clang_header = '/usr/lib/llvm-10/lib/clang'

" ale
let g:ale_linters = {
	\ 'cpp': ['clang'],
	\ 'c': ['clang']
	\ }

" neoformat
let g:neoformat_cpp_clangformat = {
    \ 'exe': 'clang-format'
\}
let g:neoformat_enabled_cpp = ['clangformat']
let g:neoformat_enabled_c = ['clangformat']

" cscope
if has('cscope')
  set cscopetag cscopeverbose

  if has('quickfix')
    set cscopequickfix=s-,c-,d-,i-,t-,e-
  endif

  cnoreabbrev csa cs add
  cnoreabbrev csf cs find
  cnoreabbrev csk cs kill
  cnoreabbrev csr cs reset
  cnoreabbrev css cs show
  cnoreabbrev csh cs help
endif

" silver-searchar (ag)
let g:ackprg = 'ag --vimgrep'
