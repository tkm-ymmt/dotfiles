set antialias
set showtabline=2
set columns=150
set lines=28
set linespace=4

" フォントの設定
"seat guifont=mplus-2m-regular:h13
"set guifont=mplus-2m-regular-forPowerline:h13
set guifont=M+\ 2m\ regular\ for\ Powerline:h13


" Color Scheme
syntax enable
set background=dark
colorscheme darcula


" 以下を追記
set nocompatible
filetype plugin indent off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
  call neobundle#rc(expand('~/.vim/bundle/'))
endif 

NeoBundleFetch 'Shougo/neobundle.vim'

" 以下は必要に応じて追加
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'alpaca-tc/alpaca_powertabline'
NeoBundle 'https://github.com/Lokaltog/powerline.git'

filetype plugin indent on


"powerline用
set laststatus=2
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
let g:Powerline_symbols = 'fancy'
set noshowmode

