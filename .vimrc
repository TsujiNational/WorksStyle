"------------------------------------------------------------------------------------------------------------------------
"設定
"------------------------------------------------------------------------------------------------------------------------
"全体設定
set fenc=utf-8 "文字コードをUFT-8に設定

set nobackup " バックアップファイルを作らない

set noswapfile " スワップファイルを作らない 

set autoread " 編集中のファイルが変更されたら自動で読み直す

set hidden " バッファが編集中でもその他のファイルを開けるように

"エンコ設定
set encoding=utf-8
set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
set fileformats=unix,dos,mac

"表示設定
set showcmd " 入力中のコマンドをステータスに表示する

set number " 行番号を表示

set cursorline " 現在の行を強調表示

set syntax=on "色付けON

set ambiwidth=double "文字崩れ防止

set laststatus=2 "ファイル名表示

highlight LineNr term=bold ctermfg=grey

augroup vimrcEx
  au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
  \ exe "normal g`\"" | endif
augroup END

set pumheight=10 "補完メニューの高さ

"検索設定
set ignorecase " 検索文字列が小文字の場合は大文字小文字を区別なく検索する

set smartcase " 検索文字列に大文字が含まれている場合は区別して検索する

set incsearch " 検索文字列入力時に順次対象文字列にヒットさせる

set wrapscan " 検索時に最後まで行ったら最初に戻る

set hlsearch " 検索語をハイライト表示
" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>

"grep後一覧表示
nnoremap <silent><C-g> :vimgrep
autocmd QuickfixCmdPost make,grep,grepadd,vimgrep tab cwindow

"------------------------------------------------------------------------------------------------------------------------
"編集系
"------------------------------------------------------------------------------------------------------------------------
"TAB->半角４つ分
set tabstop=4
set shiftwidth=4

"自動インデント
set smartindent

"置換時'g'オプション標準化
set gdefault

"クリップボードからのペーストで自動インデントOFF
if &term =~ "xterm"
    let &t_SI .= "\e[?2004h"
    let &t_EI .= "\e[?2004l"
    let &pastetoggle = "\e[201~"

    function XTermPasteBegin(ret)
        set paste
        return a:ret
    endfunction

    inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
endif

"カッコ飛び確認0.1秒
set showmatch
set matchtime=1

"------------------------------------------------------------------------------------------------------------------------
"マッピング
"------------------------------------------------------------------------------------------------------------------------
" Çタグ用マッピング
nnoremap <C-]> g<C-]>

"画面分割・タブ操作系
nnoremap s <Nop>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sw <C-w>w
nnoremap st :<C-u>tabnew<CR>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>

";:入れ替え
nnoremap ; :
nnoremap : ;

"jjでノーマルモードへ
inoremap <silent> jj <ESC>

"インクリメント・デクリメント
nnoremap + <C-a>
nnoremap - <C-x>
"------------------------------------------------------------------------------------------------------------------------
"プラグイン
"------------------------------------------------------------------------------------------------------------------------
if has('vim_starting')
    " 初回起動時のみruntimepathにNeoBundleのパスを指定する
    set runtimepath+=~/.vim/bundle/neobundle.vim/

    " NeoBundleが未インストールであればgit cloneする
    if !isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
        echo "install NeoBundle..."
        :call system("git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim")
    endif
endif

call neobundle#begin(expand('~/.vim/bundle/'))

" インストールするVimプラグインを以下に記述
" NeoBundle自身を管理
NeoBundleFetch 'Shougo/neobundle.vim'
"----------------------------------------------------------
" 追加Vimプラグイン

" 末尾の全角と半角の空白文字を赤くハイライト
NeoBundle 'bronson/vim-trailing-whitespace'

NeoBundle "majutsushi/tagbar", {
      \ "autoload": { "commands": ["TagbarToggle"] }}
if ! empty(neobundle#get("tagbar"))
   " Width (default 40)
  let g:tagbar_width = 20
  " Map for toggle
  nnoremap <silent> <leader>t :TagbarToggle<CR>
endif



"----------------------------------------------------------
call neobundle#end()

" ファイルタイプ別のVimプラグイン/インデントを有効にする
filetype plugin indent on

" 未インストールのVimプラグインがある場合、インストールするかどうかを尋ねてくれるようにする設定
NeoBundleCheck


