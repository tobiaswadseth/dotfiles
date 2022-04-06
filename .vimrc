let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin()

Plug 'joshdick/onedark.vim'

Plug 'itchyny/lightline.vim'

Plug 'preservim/nerdtree'

Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'airblade/vim-gitgutter'

Plug 'dense-analysis/ale'

Plug 'machakann/vim-highlightedyank'

Plug 'luochen1990/rainbow'

Plug 'artur-shaik/vim-javacomplete2'

Plug 'ycm-core/YouCompleteMe', { 'do': 'python3 install.py --all' }

Plug 'mbbill/undotree'

Plug 'tpope/vim-surround'

Plug 'mg979/vim-visual-multi'

Plug 'ryanoasis/vim-devicons'

call plug#end()

syntax on

colorscheme onedark

autocmd FileType java setlocal omnifunc=javacomplete#Complete

if !exists('##TextYankPost')
	nmap y <Plug>(highligtedyank)
	xmap y <Plug>(highlightedyank)
	omap y <Plug>(highlightedyank)
endif

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
tnoremap <End> <C-\><C-n>

set encoding=utf8
set termguicolors
set number
set laststatus=2

let g:rainbow_active=1
let g:lightline={
  \ 'colorscheme': 'onedark',
  \ }

let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.git$']

highlight HighlightedYankRegion cterm=reverse gui=reverse
