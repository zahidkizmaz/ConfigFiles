set nocompatible              " be iMproved, required
filetype off                  " required
let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'
set number                     " Show current line number
set relativenumber             " Show relative line numbers
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'valloric/youcompleteme'
Plugin 'tpope/vim-fugitive'
Plugin 'nvie/vim-flake8'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'michaeljsmith/vim-indent-object'
map <C-n> :NERDTreeToggle<CR>
" All of your Plugins must be added before the following line

call vundle#end()            " required
filetype plugin indent on    " required

set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
aug python
  " ftype/python.vim overwrites this
  au FileType python setlocal ts=8 sts=0 expandtab sw=4 smarttab
aug end

let g:indent_guides_enable_on_vim_startup = 0
let g:indent_guides_start_level=1
let g:indent_guides_guide_size=1
