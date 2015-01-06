
set nocompatible "vi非互換モード

"#######################
" 表示系
"#######################
set number "行番号表示
set showmode "モード表示
set title "編集中のファイル名を表示
set ruler "ルーラーの表示
set showcmd "入力中のコマンドをステータスに表示する
set showmatch "括弧入力時の対応する括弧を表示
set laststatus=2 "ステータスラインを常に表示

"#######################
" プログラミングヘルプ系
"#######################
syntax on "カラー表示
set smartindent "オートインデント
" tab関連
set expandtab "タブの代わりに空白文字挿入
set ts=2 sw=2 sts=0 "タブは半角4文字分のスペース
" 空白文字表示
set list
set listchars=nbsp:.,eol:_,tab:>>,trail:.,extends:>,precedes:<

" ファイルを開いた際に、前回終了時の行で起動
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

"#######################
" 検索系
"#######################
"set ignorecase "検索文字列が小文字の場合は大文字小文字を区別なく検索する
set smartcase "検索文字列に大文字が含まれている場合は区別して検索する
set wrapscan "検索時に最後まで行ったら最初に戻る
"set noincsearch "検索文字列入力時に順次対象文字列にヒットさせない
"set nohlsearch "検索結果文字列の非ハイライト表示

set antialias
set showtabline=2
"set columns=150
"set lines=28
set linespace=5
set guifont=Sauce\ Code\ Powerline\ for\ Powerline:h11

" メタキー変更
imap jj <esc>

" ファイルを開くとそのディレクトリに移動
au BufEnter * execute ":lcd " . expand("%:p:h")


" ローカルファイル読み込み。
if filereadable(expand('~/dotfiles/vim/.vimrc.local'))
source ~/dotfiles/vim/.vimrc.local
endif


" キーバインド
" escキーを ctrl+jに。
imap <c-j> <esc>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 以下プラグインの設定
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set runtimepath+=~/dotfiles/vim/plugin/neobundle.vim/

" 以下を追記
set nocompatible
filetype plugin indent off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
  call neobundle#begin(expand('~/.vim/bundle/'))
  NeoBundleFetch 'Shougo/neobundle.vim'
  call neobundle#end()
endif 

" 以下は必要に応じて追加
NeoBundle 'Shougo/unite.vim'
"NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'alpaca-tc/alpaca_powertabline'
NeoBundle 'https://github.com/Lokaltog/powerline.git'
NeoBundle "godlygeek/tabular"
NeoBundle "joker1007/vim-markdown-quote-syntax"
NeoBundle "rcmdnk/vim-markdown"
NeoBundle "Shougo/vimfiler"
NeoBundle "Shougo/vimproc"
NeoBundle "Shougo/vimshell"


filetype plugin indent on


"powerline用
set laststatus=2
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
let g:Powerline_symbols = 'fancy'
"set noshowmode

"mdプラグイン用
let g:vim_markdown_liquid=1
let g:vim_markdown_frontmatter=1
let g:vim_markdown_math=1
au BufRead,BufNewFile *.{txt,text} set filetype=markdown
