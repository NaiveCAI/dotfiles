let hostname=substitute(system('hostname'), '\n', '', '')

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'mileszs/ack.vim'
Plugin 'rking/ag.vim'
Plugin 'dense-analysis/ale'
Plugin 'jiangmiao/auto-pairs'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'dyng/ctrlsf.vim'
Plugin 'junegunn/goyo.vim'
Plugin 'sainnhe/everforest'
Plugin 'morhetz/gruvbox'
Plugin 'mtth/locate.vim'
Plugin 'vim-scripts/matchit.zip'
Plugin 'vim-scripts/ruby-matchit'
Plugin 'Valloric/MatchTagAlways'
Plugin 'scrooloose/nerdtree'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'ervandew/supertab'
Plugin 'SirVer/ultisnips'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-commentary'
Plugin 'easymotion/vim-easymotion'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'machakann/vim-highlightedyank'
Plugin 'pangloss/vim-javascript'
Plugin 'MaxMEllon/vim-jsx-pretty'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'elzr/vim-json'
Plugin 'stephpy/vim-yaml'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-repeat'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-surround'
Plugin 'pbrisbin/vim-mkdir'
Plugin 'suan/vim-instant-markdown'
Plugin 'plasticboy/vim-markdown'
Plugin 'thoughtbot/vim-rspec'
Plugin 'slim-template/vim-slim'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'mbbill/undotree'
Plugin 'mattn/emmet-vim'
Plugin 'mhinz/vim-startify'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'chr4/nginx.vim'
Plugin 'MattesGroeger/vim-bookmarks'
Plugin 'leafgarland/typescript-vim'
Plugin 'vim-scripts/SQLUtilities'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'chrisbra/csv.vim'
Plugin 'jparise/vim-graphql'

call vundle#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"common conf
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
set ai                      "自动缩进
set hidden
set bs=2                    "在insert模式下用退格键删除
set showmatch               "代码匹配
set laststatus=2            "总是显示状态行
set showtabline=0
set nobackup
set nocompatible
"This could be an inconvenience in some cases where you are storing something else in the clipboard as it will override it.
"set clipboard=unnamed
set background=dark
set hlsearch
set incsearch

set autoindent
set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab

set mouse=a                 "可以在buffer的任何地方使用鼠标
set cursorline              "为光标所在行加下划线
set cursorcolumn            "highlight current column
set selectmode=mouse,key

set relativenumber
set nu
set autoread                "文件在Vim之外修改过，自动重新读入
set autowrite               "切换buffer前保存内容
set ignorecase              "检索时忽略大小写
set smartcase
set hls                     "检索时高亮显示匹配项

set matchtime=1             "匹配括号高亮时间（十分之一秒）
set lazyredraw              "buffer screen updates instead of updating all the time
set ttyfast

set helplang=cn             "帮助系统设置为中文
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

set completeopt=menu,preview
set wildmode=longest,list:longest

set foldmethod=indent
set nofoldenable

set iskeyword=@,48-57,_,-,192-255,@-@,?-?,!-!,$-$
set updatetime=100

filetype off
filetype plugin indent on
" To ignore plugin indent changes, instead use:
"filetype plugin on

"Specific configurations
if has("gui_macvim")
  "set transparency=3
  set lines=55 columns=220
  set guifont=OperatorMono\ Nerd\ Font:h13
  set linespace=2

  "Hide toolbar and scrollbars in MacVim
  set guioptions-=m  "remove menu bar
  set guioptions-=T  "remove toolbar
  set guioptions-=r  "remove right-hand scroll bar
  set guioptions-=L  "remove left-hand scroll bar
endif

colorscheme gruvbox
let g:airline_theme='gruvbox'

if has("gui_macvim")
  set termguicolors
  highlight Comment gui=italic
else
  set fillchars+=vert:\|
end

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
  endif
endif

"Change vertical split line style
set fillchars+=vert:\|
" highlight VertSplit guibg=bg guifg=fg


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"conf for plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"conf for NERDTree
let g:NERDTreeWinSize=50
let g:NERDTreeHijackNetrw=0
let NERDTreeIgnore=['__pycache__[[dir]]', '\.pyc$[[file]]']


"conf for CtrlP
let g:ctrlp_map='<c-p>'
let g:ctrlp_custom_ignore={
      \ 'dir':  '\v[\/](\.git|\.hg|\.svn|_site|_build|dist|node_modules|.webassets-cache|.temp|__pycache__|public\/(assets|packs))$',
      \ 'file': '\v\.(log|jpg|jpeg|png)$',
      \ }
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
let g:ctrlp_open_multiple_files='3vjr'
let g:ctrlp_show_hidden=1
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
" CtrlP auto cache clearing.
" function! SetupCtrlP()
"   if exists("g:loaded_ctrlp") && g:loaded_ctrlp
"     augroup CtrlPExtension
"       autocmd!
"       autocmd FocusGained  * CtrlPClearCache
"       autocmd BufWritePost * CtrlPClearCache
"     augroup END
"   endif
" endfunction
" if has("autocmd")
"   autocmd VimEnter * :call SetupCtrlP()
" endif


"conf for ctrlsf
let g:ctrlsf_search_mode='async'
let g:ctrlsf_winsize='35%'
let g:ctrlsf_mapping={
      \ "vsplit": "<C-V>"
      \}
let g:ctrlsf_auto_focus = {
      \ "at" : "done",
      \ "duration_less_than": 4000
      \ }
let g:ctrlsf_ignore_dir = ['node_modules', 'dist', 'public', 'log', 'tmp', '.temp', 'tags', '_build']
let g:ctrlsf_context = '-B 6 -A 6'
let g:ctrlsf_backend = 'ag'


"conf for ag
let g:ag_working_path_mode="r"


"conf for bufExplorer
let g:bufExplorerSortBy='mru'
let g:bufExplorerFindActive=1
let g:bufExplorerSplitRight=1     "Split right.
let g:bufExplorerVertSize=30      "New split windows size set by Vim.
let g:bufExplorerShowNoName=1     "Show No Name buffers.


"conf for airline
" let g:airline#extensions#bufferline#enabled=1
" let g:airline#extensions#tabline#enabled=1
" let g:airline#extensions#branch#enabled=1
let g:airline#extensions#ale#enabled=1
let g:airline_powerline_fonts=1
"let g:airline#extensions#tabline#left_sep=' '
"let g:airline#extensions#tabline#left_alt_sep='|'
" let g:airline#extensions#syntastic#enabled=1
" let g:airline_section_a       (mode, crypt, paste, spell, iminsert)
let g:airline_section_b=''
" let g:airline_section_c       (bufferline or filename)
" let g:airline_section_gutter  (readonly, csv)
let g:airline_section_x=''
let g:airline_section_y=''
" let g:airline_section_z=''
let g:airline_skip_empty_sections=1


"conf for ale - Asynchronous Lint Engine
let g:ale_linters = {
      \ 'ruby': ['rubocop'],
      \ 'python': ['pylint'],
      \ 'javascript': ['eslint'],
      \ 'jsx': ['eslint'],
      \ 'typescript': ['eslint'],
      \ 'css': ['stylelint'],
      \ 'scss': ['stylelint']
      \}
let g:ale_fixers = {
      \ 'ruby': ['rubocop'],
      \ 'python': ['autopep8'],
      \ 'javascript': ['eslint'],
      \ 'jsx': ['eslint'],
      \ 'typescript': ['eslint'],
      \ 'css': ['stylelint'],
      \ 'scss': ['stylelint']
      \}
let g:ale_sign_error = '❗️'
let g:ale_sign_warning = '❕'
let g:ale_lint_delay=50
" let g:ale_fix_on_save=1
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow


"conf for js-libraries-syntax
let g:used_javascript_libs='jquery,underscore,react'
let g:go_highlight_functions=1
let g:go_highlight_methods=1
let g:go_highlight_structs=1
let g:go_highlight_operators=1
let g:go_highlight_build_constraints=1
autocmd BufReadPre *.js let b:javascript_lib_use_jquery=1
autocmd BufReadPre *.js let b:javascript_lib_use_underscore=1
autocmd BufReadPre *.js let b:javascript_lib_use_react=1
"autocmd BufReadPre *.js let b:javascript_lib_use_angularjs=1
"autocmd BufReadPre *.js let b:javascript_lib_use_angularui=1
"autocmd BufReadPre *.js let b:javascript_lib_use_angularuirouter=1


"conf for Ultisnips
let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsEditSplit='vertical'
"let g:UltiSnipsJumpForwardTrigger="<tab>"
"let g:UltiSnipsJumpBackwardTrigger="<s-tab>"


"conf for gitgutter
"To customise your sign column's background color, first tell vim-gitgutter to leave it alone:
let g:gitgutter_override_sign_column_highlight=0
" highlight clear SignColumn


"conf for vim-bookmark
let g:bookmark_no_default_key_mappings=1
nmap <Leader>mt <Plug>BookmarkToggle
nmap <Leader>mi <Plug>BookmarkAnnotate
nmap <Leader>ma <Plug>BookmarkShowAll
nmap <Leader>mn <Plug>BookmarkNext
nmap <Leader>mp <Plug>BookmarkPrev
"nmap <Leader>c <Plug>BookmarkClear
"nmap <Leader>x <Plug>BookmarkClearAll
"nmap <Leader>kk <Plug>BookmarkMoveUp
"nmap <Leader>jj <Plug>BookmarkMoveDown
"nmap <Leader>g <Plug>BookmarkMoveToLine
"highlight BookmarkSign ctermbg=whatever ctermfg=whatever
"highlight BookmarkAnnotationSign ctermbg=whatever ctermfg=whatever
"highlight BookmarkLine ctermbg=whatever ctermfg=whatever
"highlight BookmarkAnnotationLine ctermbg=whatever ctermfg=whatever


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"conf for other key maps
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap jk <ESC>
vnoremap , <ESC>
imap <Tab> <C-X>
nmap <Leader>w :bd<cr>
nmap <Leader>z :nohl<cr>
nmap <Leader>t :Tab /
nmap <Leader>ssp :set paste<cr>
nmap <Leader>nsp :set nopaste<cr>
nmap <Leader>sss :set syntax=
nmap <Leader>l :L 
nmap <Leader>lc :Lpurge<cr>
nmap <F10> :%bd<cr>
" moving aroung in command mode
cnoremap <c-b> <left>
cnoremap <c-d> <right>

"for macvim's sb screen bug
nmap <Leader>fk <C-W><S-H> <C-W><S-L> <C-W><S-H>

"for NERDTree
nmap mm :NERDTreeToggle<cr>
nmap mf :NERDTreeFind<cr>

"for CtrlSF
nmap <Leader>f :CtrlSF 
nmap <Leader>fc <Plug>CtrlSFCwordPath
nmap <Leader>ot :CtrlSFToggle<cr>
nmap <Leader>of :CtrlSFFocus<cr>
nmap <F4> :!rspec % --no-color<cr>

"for fugitive
nmap <Leader>gb :Git blame<cr>

"for highlightedyank
map y <Plug>(highlightedyank)

"for split screen
nmap <Leader>vs :vsplit<cr>
nmap <Leader>sp :split<cr>

"for switch bg color
nmap <Leader>bgl :set background=light<cr>
nmap <Leader>bgd :set background=dark<cr>

"for rails.vim
nmap <Leader>rg :Rgenerate 
nmap <Leader>rd :Rdestroy 

"for undotree
nmap <Leader>ou :UndotreeToggle<cr>

"for move cursor between windows
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"for change window size manually in OS X
nnoremap ¬ :vertical resize +6<cr>
"nnoremap ¬ <C-W>>
nnoremap ˙ :vertical resize -6<cr>
"nnoremap ˙ <c-w><
nnoremap ˚ :resize +6<cr>
"nnoremap ˚ <C-W>+
nnoremap ∆ :resize -6<cr>
"nnoremap ∆ <C-W>-
nnoremap ≠ <C-W>=

"use CTRL and TAB to switch between tabs.
noremap <C-Tab> :tabnext<CR>
noremap <C-S-Tab> :tabprev<CR>

"for vim-indent-guides
nmap <Leader>id :IndentGuidesToggle<cr>

"for locate
let g:locate_jump_to = 'stay'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"color themes conf
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"conf for Gruvbox color theme
" let g:gruvbox_contrast_dark='hard'
" let g:gruvbox_contrast_light='hard'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"other conf
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"close the netrw at vim startup
let loaded_netrwPlugin=1
"NERDTree at vim startup
"autocmd VimEnter * NERDTree

"Try speed vim syntax rendering up
augroup vimrc
  autocmd!
  autocmd BufWinEnter,Syntax * syn sync minlines=500 maxlines=500
augroup END

augroup FiletypeGroup
  autocmd!
  au BufNewFile,BufRead *.jsx set filetype=javascript.jsx
  au BufNewFile,BufRead *.tsx set filetype=javascript.ts
  au BufNewFile,BufRead *.es6 set filetype=javascript.ts
augroup END
