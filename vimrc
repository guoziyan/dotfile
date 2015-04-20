set nu
syntax on
set bs=2
set tabstop=4
set expandtab
set softtabstop=4
set helplang=cn
set foldmethod=syntax
set ignorecase

colorscheme darkblue

"NeoBundle Scripts-----------------------------
if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=/Users/lxh/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('/Users/lxh/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:

NeoBundle 'Shougo/neocomplete'
NeoBundle 'fatih/vim-go'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'Lokaltog/vim-powerline'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Xuyuanp/nerdtree-git-plugin'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'digitaltoad/vim-jade'

" You can specify revision/branch/tag.

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------

let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 2
let g:clang_library_path = '/Users/lxh/Documents/llvm-clang/lib'

inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {}<ESC>i

if !exists('g:neocomplete#keyword_patterns')
	let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete

if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
endif

let g:user_emmet_install_global = 0
autocmd FileType html,css,jade EmmetInstall
let g:user_emmet_leader_key='<C-X>'
let g:Powerline_symbols = 'fancy'
set laststatus=2
set t_Co=256

