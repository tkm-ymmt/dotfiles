

set nocompatible "vi非互換モード



set number "行番号表示
set showmode "モード表示
set title "編集中のファイル名を表示
set ruler "ルーラーの表示
set showcmd "入力中のコマンドをステータスに表示する
set showmatch "括弧入力時の対応する括弧を表示
set laststatus=2 "ステータスラインを常に表示
set clipboard=unnamed,autoselect
set nrformats= " 0Nを10進数扱い

syntax on "カラー表示
set smartindent "オートインデント
" tab関連
set expandtab "タブの代わりに空白文字挿入
set ts=2 sw=2 sts=0 "タブは半角4文字分のスペース
" 空白文字表示
"set list
"set listchars=nbsp:.,eol:_,tab:>>,trail:.,extends:>,precedes:<

set diffopt=filler,vertical " diffモード設定


" ファイルを開いた際に、前回終了時の行で起動
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

" 括弧、クォーテーションを入力した際にカーソルを内部に持っていく
imap {} {}<Left>
imap [] []<Left>
imap () ()<Left>
imap “” “”<Left>
imap '' ''<Left>
imap <> <><Left>
imap “ “<Left>

"set ignorecase "検索文字列が小文字の場合は大文字小文字を区別なく検索する
set smartcase "検索文字列に大文字が含まれている場合は区別して検索する
set wrapscan "検索時に最後まで行ったら最初に戻る
set incsearch "インクリメンタルサーチ on
"set nohlsearch "検索結果文字列の非ハイライト表示
set hlsearch " 検索結果のハイライト

set noswapfile
set nobackup
" set ambiwidth=double
set antialias
set showtabline=2
set linespace=5
set guifont=M+\ 2m\ regular\ for\ Powerline:h13
set wildmenu wildmode=list:full "コマンドラインモードの補完機能 on
" set cursorline " カーソルのある行の強調表示

filetype plugin indent on

" ハイライト色の設定
highlight Normal ctermbg=black ctermfg=grey
highlight StatusLine term=none cterm=none ctermfg=black ctermbg=grey
highlight CursorLine term=none cterm=none ctermfg=none ctermbg=darkgray


" メタキー変更
imap jj <esc>

" 移動キー remap
noremap <S-h>   ^
noremap <S-l>   $

" ファイルを開くとそのディレクトリに移動
" au BufEnter * execute ":lcd " . expand("%:p:h")
" autocm BufEnter * if expand('%:p') ~! '://' | cd %:p:h | endif

let mapleader = "\<Space>"
" 検索の際に正規表現を普通に使えるようにする。
nmap / /\v

set foldmethod=manual
" this is better to write end of file.
set encoding=utf-8
" set fileencodings=iso-2022-jp,cp932,sjis,euc-jp,utf-8


" setting for powerline
set rtp+=/Users/takumi/.cache/dein/repos/github.com/Lokaltog/powerline/powerline/bindings/vim
" python from powerline.vim import setup as powerline_setup
" python powerline_setup()
" python del powerline_setup
" set rtp+=/Users/takumi/.cache/dein/repos/github.com/Lokaltog/powerline/powerline/bindings/vim
"powerline用
set laststatus=2
let g:Powerline_symbols = 'on'
set showtabline=2
set noshowmode
"set noshowmode

" ローカルファイル読み込み。
if filereadable(expand('~/dotfiles/vim/.vimrc.local'))
source ~/dotfiles/vim/.vimrc.local
endif



" " ローカルファイル読み込み。
" if filereadable(expand('~/dotfiles/vim/.vimrc.dein'))
" source ~/dotfiles/vim/.vimrc.dein
" endif

" load functions
if filereadable(expand('~/dotfiles/vim/.vimrc.func'))
source ~/dotfiles/vim/.vimrc.func
endif





" Plugin key-mappings.  " <C-k>でsnippetの展開
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
vmap <C-k> <Plug>(neosnippet_expand_or_jump)

" NeoSnippet用 他ファイル使用
let g:neosnippet#enable_snipmate_compatibility = 1

" NeoSnippet用 他ディレクトリ使用の際に追記
let g:neosnippet#snippets_directory='~/dotfiles/vim/snippets'


