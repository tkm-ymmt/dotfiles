
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
"set list
"set listchars=nbsp:.,eol:_,tab:>>,trail:.,extends:>,precedes:<

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

"#######################
" 検索系
"#######################
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
"set columns=150
"set lines=28
set linespace=5
set guifont=Sauce\ Code\ Powerline\ for\ Powerline:h11
set wildmenu wildmode=list:full "コマンドラインモードの補完機能 on
" set cursorline " カーソルのある行の強調表示

" ハイライト色の設定
highlight Normal ctermbg=black ctermfg=grey
highlight StatusLine term=none cterm=none ctermfg=black ctermbg=grey
highlight CursorLine term=none cterm=none ctermfg=none ctermbg=darkgray


" メタキー変更
imap jj <esc>

" ファイルを開くとそのディレクトリに移動
au BufEnter * execute ":lcd " . expand("%:p:h")

" 検索の際に正規表現を普通に使えるようにする。
nmap / /\v

" ローカルファイル読み込み。
if filereadable(expand('~/dotfiles/vim/.vimrc.local'))
source ~/dotfiles/vim/.vimrc.local
endif


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
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/neocomplete'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'honza/vim-snippets'
NeoBundle 'alpaca-tc/alpaca_powertabline'
NeoBundle 'https://github.com/Lokaltog/powerline.git'
NeoBundle "godlygeek/tabular"
NeoBundle "joker1007/vim-markdown-quote-syntax"
NeoBundle "rcmdnk/vim-markdown"
NeoBundle "Shougo/vimfiler"
NeoBundle "Shougo/vimproc"
NeoBundle "Shougo/vimshell"
"NeoBundle "nathanaelkane/vim-indent-guides"
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'taichouchou2/html5.vim'
NeoBundle 'taichouchou2/vim-javascript'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'mattn/gist-vim', {'depends': 'mattn/webapi-vim'}
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-git'
NeoBundle 'cohama/agit.vim'
NeoBundle 'rhysd/committia.vim'
NeoBundle 'idanarye/vim-merginal'
NeoBundle 'gregsexton/gitv.git'
NeoBundle 'rking/ag.vim'


filetype plugin indent on

set guifont=M+\ 2m\ regular\ for\ Powerline:h13

"powerline用
set laststatus=2
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
let g:Powerline_symbols = 'off'
"set noshowmode


"mdプラグイン用
let g:vim_markdown_liquid=1
let g:vim_markdown_frontmatter=1
let g:vim_markdown_math=1
au BufRead,BufNewFile *.{txt,text,md} set filetype=markdown

" Plugin key-mappings.  " <C-k>でsnippetの展開
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)

" NeoSnippet用 他ファイル使用
let g:neosnippet#enable_snipmate_compatibility = 1

" NeoSnippet用 他ディレクトリ使用の際に追記
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'


"unite prefix key.
nnoremap [unite] <Nop>
nmap <Space>f [unite]

"unite general settings
"インサートモードで開始
let g:unite_enable_start_insert = 1
"最近開いたファイル履歴の保存数
let g:unite_source_file_mru_limit = 50

"file_mruの表示フォーマットを指定。空にすると表示スピードが高速化される
"let g:unite_source_file_mru_filename_format = ''

"現在開いているファイルのディレクトリ下のファイル一覧。
"開いていない場合はカレントディレクトリ
nnoremap <silent> [unite]f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
"バッファ一覧
nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>
"レジスタ一覧
nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register register<CR>
"最近使用したファイル一覧
nnoremap <silent> [unite]m :<C-u>Unite file_mru<CR>
"ブックマーク一覧
nnoremap <silent> [unite]c :<C-u>Unite bookmark<CR>
"ブックマークに追加
nnoremap <silent> [unite]a :<C-u>UniteBookmarkAdd<CR>
"uniteを開いている間のキーマッピング
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()"{{{
"escでuniteを終了
  nmap <buffer> <esc> <plug>(unite_exit)
"入力モードのときjjでノーマルモードに移動
  imap <buffer> jj <plug>(unite_insert_leave)
"入力モードのときctrl+wでバックスラッシュも削除
  imap <buffer> <c-w> <plug>(unite_delete_backward_path)
"ctrl+jで縦に分割して開く
  nnoremap <silent> <buffer> <expr> <c-j> unite#do_action('split')
  inoremap <silent> <buffer> <expr> <c-j> unite#do_action('split')
"ctrl+jで横に分割して開く
  nnoremap <silent> <buffer> <expr> <c-l> unite#do_action('vsplit')
  inoremap <silent> <buffer> <expr> <c-l> unite#do_action('vsplit')
"ctrl+oでその場所に開く
  nnoremap <silent> <buffer> <expr> <c-o> unite#do_action('open')
  inoremap <silent> <buffer> <expr> <c-o> unite#do_action('open')
"ctrl+tでその場所に開く
  nnoremap <silent> <buffer> <expr> <c-t> unite#do_action('tabopen')
  inoremap <silent> <buffer> <expr> <c-t> unite#do_action('tabopen')
endfunction"}}}

" indentLine用
let g:indentLine_leadingSpaceChar = '·'
let g:indentLine_leadingSpaceEnabled = 1
