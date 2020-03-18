if &compatible
set nocompatible					" Be iMproved
endif

set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
let g:python3_host_prog = '/Users/muhammedzahidkizmaz/.pyenv/versions/py3nvim/bin/python'

" PLUGINS
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'rhysd/committia.vim'
Plug 'mhinz/vim-signify'
Plug 'rhysd/git-messenger.vim'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'dense-analysis/ale'
Plug 'vim-scripts/django.vim', {'for': ['html', 'htmldjango', 'txt']}
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
Plug 'majutsushi/tagbar'
Plug 'vim-scripts/AutoTag'
Plug 'davidhalter/jedi-vim', {'for': 'python'}
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'deoplete-plugins/deoplete-jedi', {'for': 'python'}
Plug 'cespare/vim-toml'
Plug 'zxqfl/tabnine-vim', {'for': 'python'}
Plug 'stephpy/vim-yaml', {'for': ['yaml', 'yml']}
Plug 'christoomey/vim-tmux-navigator'
Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'bash install.sh',}
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'liuchengxu/vista.vim'
Plug 'morhetz/gruvbox' " Theme
Plug 'machakann/vim-highlightedyank'
Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

call plug#end()


set encoding=utf-8
set number                     				" Show current line number
set relativenumber             				" Show relative line numbers
set splitright
filetype plugin indent on
syntax enable
let mapleader = ","
vmap '' :w !pbcopy<CR><CR>				" Copy to system clipboard

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
set showtabline=1
set showmatch
" auto-adjust splits when window is resized
" https://vi.stackexchange.com/questions/201/make-panes-resize-when-host-window-is-resized
autocmd VimResized * wincmd =
set equalalways

set background=dark    " Setting dark mode
colorscheme gruvbox
let g:gruvbox_contrast_dark = 'hard'
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set lazyredraw

" Permanent undo
set undodir=~/.vimdid
set undofile

" PLUGIN SETTINGS
"
" Vim
let g:indent_guides_auto_colors = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1
set updatetime=100
" { } free jumplist
nnoremap } :<C-u>execute "keepjumps norm! " . v:count1 . "}"<CR>
nnoremap { :<C-u>execute "keepjumps norm! " . v:count1 . "{"<CR>
" Show those damn hidden characters
" Verbose: set listchars=nbsp:¬,eol:¶,extends:»,precedes:«,trail:•
set listchars=nbsp:¬,extends:»,precedes:«,trail:•
"
" HighlightedYank
"
let g:highlightedyank_highlight_duration = 300
"
"
" LeaderF
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline" }
let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }
"
" Ale
let g:ale_fixers = {
  \   '*': ['remove_trailing_lines', 'trim_whitespace'],
  \   'python': ['yapf', 'isort', 'black']
  \ }
let g:ale_fix_on_save = 1
let g:ale_sign_column_always = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
"
" Jedi
let g:jedi#completions_enabled = 0
"
" Deoplete-nvim
let g:deoplete#auto_complete_delay = 100
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#jedi#enable_typeinfo = 1
let g:deoplete#sources#jedi#show_docstring = 0
call deoplete#custom#var('tabnine', {
\ 'line_limit': 500,
\ 'max_num_results': 10,
\ })
"
" Pymode
let g:pymode_lint = 0
let g:pymode_utils_whitespaces = 1
let g:pymode_rope = 0
let g:pymode_folding = 0
let g:pymode_virtualenv = 0
let g:pymode_doc = 0
let g:pymode_run = 0
let g:pymode_rope_completion = 0
let g:pymode_rope_complete_on_dot = 0
let g:pymode_options_colorcolumn = 1
let g:pymode_options = 1
let g:pymode_options_max_line_length = 88
let g:pymode_python = 'python3'
let g:pymode_indent = 1
let g:pymode_motion = 1
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'
let g:pymode_breakpoint_cmd = ''
let g:pymode_syntax = 1
let g:pymode_syntax_slow_sync = 0

" LanguageServer
"
let g:LanguageClient_serverCommands = {'python': ['/Users/muhammedzahidkizmaz/.pyenv/versions/3.6.9/envs/vim-env/bin/pyls'],}

" FZF
"
let g:fzf_tags_command = 'ctags -R'
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, fzf#vim#with_preview('right'))
command! -bang GitFiles
  \ call fzf#vim#gitfiles(
  \   '--cached --exclude-standard --others',
  \   fzf#vim#with_preview('right')
  \ )
" custom BTags and Tags to include preview
" inspired by https://github.com/junegunn/fzf.vim/issues/800
command! -bang BTags
  \ call fzf#vim#buffer_tags('', {
  \     'options': '--with-nth 1,2
  \                 --preview-window=right
  \                 --reverse
  \                 --preview "
  \                     bat {2} --color=always |
  \                     tail -n +\$(echo {3} | tr -d \";\\\"\")
  \                     "'
  \ })

command! -bang Tags
  \ call fzf#vim#tags('', {
  \     'options': '--with-nth 1,2
  \                 --preview-window=right
  \                 --reverse
  \                 --preview "
  \                     bat {2} --color=always |
  \                     tail -n +\$(echo {3} | tr -d \";\\\"\")
  \                     "'
  \ })

" Vista
"
" python stays through ctags, looks better
let g:vista#renderer#enable_icon = 1
let g:vista_fzf_preview = ['right:60%']
let g:vista_echo_cursor_strategy = 'floating_win'
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }
"
" Semshi
"
let g:semshi#error_sign = 'v:false'

" MAPPING SHORTCUTS
"
" Vim
" Move around splits with <c-hjkl>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
" run Ag with word under cursor or selection
nmap <leader>ag "zyiw:exe "Ag ".@z.""<CR>
vnoremap <leader>ag "zy:exe "Ag ".@z.""<CR>
"
" NerdTree
map <C-n> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
"
" Vista
nmap <leader>t :Vista!!<CR>
"
" Fugitive
nnoremap <leader>gds :Gdiffsplit!<CR>
nnoremap <leader>gh :diffget //2<CR>]c
nnoremap <leader>gl :diffget //3<CR>]c
"
" Deoplete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
"
" NeoSnippet
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
"
"
noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>
"
" LanguageClient
nmap <leader>gd :call LanguageClient#textDocument_definition()<CR>
"
" FZF
map <leader>ff :GitFiles<CR>
nmap <leader>p :call fzf#vim#files('$VIRTUAL_ENV', fzf#vim#with_preview('right'))<CR>
"
" Ale
nmap <silent> <leader>ge <Plug>(ale_next_wrap)
nmap <silent> <leader>Ge <Plug>(ale_previous_wrap)
"
nmap <leader>fd :BLines<CR>
nmap <leader>fs :BTags<CR>
nmap <leader>F :Tags<CR>
nmap <leader>m :Buffers<CR>
nmap <leader>. :History<CR>
nmap <leader>h :Helptags<CR>
"
" GitMessenger
nmap <leader>gm :GitMessenger<CR>

"" common typos .. (W, Wq WQ)
cnoreabbrev E e
cnoreabbrev W w
cnoreabbrev WQ wq
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev WA wa
cnoreabbrev Q q
cnoreabbrev QA qa
cnoreabbrev Qa qa
cnoreabbrev q1 q!
cnoreabbrev Q1 q!

source ~/.config/nvim/statusline.vim
