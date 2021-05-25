""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" プラグイン管理
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PlugInstallで下記のプラグインがインストールされる
" call plug#begin('~/.vim/plugged')
"   Plug 'joshdick/onedark.vim'
"   Plug 'itchyny/lightline.vim'
"   Plug 'ntpeters/vim-better-whitespace'
"   Plug 'Yggdroot/indentLine'
"   Plug 'vim-scripts/vim-auto-save'                              " 自動保存 :AutoSaveToggleで切り替え
"   Plug 'scrooloose/nerdtree', { 'on' : 'NERDTreeToggle' }
"   Plug 'majutsushi/tagbar', { 'on' : 'TagbarToggle' }
"   Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
"   Plug 'junegunn/fzf.vim'
"   Plug 'airblade/vim-rooter'
"   Plug 'tpope/vim-fugitive'
"   Plug 'xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }
"   Plug 'kassio/neoterm'
"   Plug 'jiangmiao/auto-pairs'
"   Plug 'tpope/vim-commentary'
" call plug#end()

set fenc=utf-8
set termguicolors " TrueColorで表示
set updatetime=100 "airblade/vim-gitgutter
set showmatch " かっこ入力時の対応するかっこを表示
" 行番号表示
set number
" タブ文字の代わりにスペースを使う
set expandtab
" タブはスペース2
set tabstop=2
" プログラミング言語に合わせてインデントを自動挿入
set smartindent
" 空白部分でtabキーやbackspaceを押した時にカーソル移動する幅
set shiftwidth=2
" 改行時に前行インデントを継承する
set autoindent
" 余計なtabや文末の空白を可視化
set list
set listchars=tab:»-,trail:-
" yank した文字列をクリップボードにコピー
set clipboard=unnamed


" テキスト背景色
au ColorScheme * hi Normal ctermbg=none
" 括弧対応
au ColorScheme * hi MatchParen cterm=bold ctermfg=214 ctermbg=black
" スペルチェック
au Colorscheme * hi SpellBad ctermfg=23 cterm=none ctermbg=none

set background=dark

au ColorScheme * hi LineNr       ctermbg=none ctermfg=240 cterm=italic " 行番号
au ColorScheme * hi StatusLine   ctermbg=none " アクティブなステータスライン
au ColorScheme * hi StatusLineNC ctermbg=none " 非アクティブなステータスライン
au ColorScheme * hi Comment      ctermfg=243 cterm=italic " コメントアウト
au ColorScheme * hi Statement    ctermfg=45
au ColorScheme * hi DiffAdd      ctermbg=24  " 追加行
au ColorScheme * hi Identifier   ctermfg=45 "cterm=bold

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" プラグイン管理【dein.vim】
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if &compatible
  set nocompatible
endif
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')
  call dein#load_toml('~/.config/nvim/dein.toml', {'lazy': 0})      " tomlファイルを読み込む
  call dein#load_toml('~/.config/nvim/dein_lazy.toml', {'lazy': 1})
  " dein.tomlとdein_lazy.tomlについて
  " dein.toml: Neovimを起動した際に起動した際にロードされる
  " dein_lazy.toml: プラグインを使用する際にロードされる
  call dein#end()
  call dein#save_state()
endif
" プラグインのインストールを自動化
if dein#check_install()
  call dein#install()
endif
filetype plugin indent on
syntax enable



let g:indentLine_conceallevel=2

" terminalの起動位置やサイズをを指定
let g:neoterm_default_mod='belowright'
let g:neoterm_size=10
let g:neoterm_autoscroll=1

let g:lightline = {
  \ 'active': {
  \ 'left': [ [ 'mode', 'paste' ],
  \            [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
  \ },
  \ 'component': {
  \  'helloworld': 'Hello, world'
  \ }
  \ }

tnoremap <silent> <C-w> <C-\><C-n><C-w>

colorscheme onedark
let g:lightline = {'colorscheme': 'onedark'}

" keymaping
nmap <C-e> :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>
nmap <C-p> :History<CR>
nmap <C-t><C-t> :Ttoggle<CR>

nmap <Esc><Esc> :noh<CR><Esc>

noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>