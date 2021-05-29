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

" NerdTree setting
set guifont=Cica:h16
set printfont=Cica:h12
set ambiwidth=double
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:NERDTreeWinSize = 40
nnoremap <silent><C-e> :NERDTreeToggle<CR>

nnoremap <ESC><ESC> :noh<CR>

" カーソルラインを表示
set cursorline
" if v:version >= 802 && !has('nvim')
" 	set cursorlineopt=screenline
" endif


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

" golang -  https://budougumi0617.github.io/2020/07/24/make_vimrc_with_lsp/
function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  setlocal signcolumn=yes
  nmap <buffer> gd <plug>(lsp-definition)
  nmap <buffer> <C-]> <plug>(lsp-definition)
  nmap <buffer> <f2> <plug>(lsp-rename)
  nmap <buffer> <Leader>d <plug>(lsp-type-definition)
  nmap <buffer> <Leader>r <plug>(lsp-references)
  nmap <buffer> <Leader>i <plug>(lsp-implementation)
  inoremap <expr> <cr> pumvisible() ? "\<c-y>\<cr>" : "\<cr>"
endfunction

augroup lsp_install
  au!
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
command! LspDebug let lsp_log_verbose=1 | let lsp_log_file = expand('~/lsp.log')

let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
" let g:asyncomplete_auto_popup = 1
" let g:asyncomplete_auto_completeopt = 0
let g:asyncomplete_popup_delay = 200
let g:lsp_text_edit_enabled = 1
let g:lsp_preview_float = 1
let g:lsp_diagnostics_float_cursor = 1
let g:lsp_settings_filetype_go = ['gopls', 'golangci-lint-langserver']

let g:lsp_settings = {}
let g:lsp_settings['gopls'] = {
  \  'workspace_config': {
  \    'usePlaceholders': v:true,
  \    'analyses': {
  \      'fillstruct': v:true,
  \    },
  \  },
  \  'initialization_options': {
  \    'usePlaceholders': v:true,
  \    'analyses': {
  \      'fillstruct': v:true,
  \    },
  \  },
  \}

" For snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

set completeopt+=menuone
" /golang ==================================


let g:goimports_simplify = 1

