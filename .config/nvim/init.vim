
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
au ColorScheme * hi MatchParen cterm=bold ctermfg=214 ctermbg=black
au Colorscheme * hi SpellBad ctermfg=23 cterm=none ctermbg=none

set background=dark

noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
