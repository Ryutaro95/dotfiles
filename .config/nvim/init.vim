set fenc=utf-8
set number
set smartindent
set clipboard=unnamed
set laststatus=2
set showcmd
set autoindent
set smartcase
set incsearch
set wrapscan
set list



"""""""""""""""""""
"" dein
"""""""""""""""""""
if &compatible
  set nocompatible " Be iMproved
endif

" Required:
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
" Required:
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  let s:toml_dir = $HOME . '/.config/nvim'
  let s:toml = s:toml_dir . '/dein.toml'

  call dein#load_toml(s:toml, {})
  " Let dein manage dein
  " Required:
  " call dein#add('/Users/ryutaro_takemura/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  " call dein#add('Shougo/neosnippet.vim')
  " call dein#add('Shougo/neosnippet-snippets')

  " You can specify revision/branch/tag.
  " call dein#add('Shougo/deol.nvim', { 'rev': '01203d4c9' })

  " Required:
  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------
