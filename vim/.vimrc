let hostname=substitute(system('hostname'), '\n', '', '')

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'mileszs/ack.vim'
Plugin 'rking/ag.vim'
Plugin 'w0rp/ale'
Plugin 'jiangmiao/auto-pairs'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'dyng/ctrlsf.vim'
Plugin 'junegunn/goyo.vim'
Plugin 'NaiveCAI/gruvbox'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'junegunn/limelight.vim'
Plugin 'mtth/locate.vim'
Plugin 'vim-scripts/matchit.zip'
Plugin 'Valloric/MatchTagAlways'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-scripts/ruby-matchit'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'ervandew/supertab'
Plugin 'godlygeek/tabular'
Plugin 'majutsushi/tagbar'
Plugin 'tmm1/ripper-tags'
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
Plugin 'elzr/vim-json'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-repeat'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-haml'
Plugin 'wakatime/vim-wakatime'
Plugin 'reedes/vim-wordy'
Plugin 'pbrisbin/vim-mkdir'
Plugin 'suan/vim-instant-markdown'
Plugin 'plasticboy/vim-markdown'
Plugin 'thoughtbot/vim-rspec'
Plugin 'slim-template/vim-slim'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'mbbill/undotree'
Plugin 'Glench/Vim-Jinja2-Syntax'
Plugin 'mattn/emmet-vim'
Plugin 'mhinz/vim-startify'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'henrik/vim-ruby-runner'
Plugin 'chr4/nginx.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'MattesGroeger/vim-bookmarks'
Plugin 'leafgarland/typescript-vim'
Plugin 'zxqfl/tabnine-vim'
Plugin 'fatih/vim-go'
Plugin 'chemzqm/wxapp.vim'
Plugin 'wavded/vim-stylus'
Plugin 'vim-scripts/SQLUtilities'

call vundle#end()

filetype plugin indent on
" To ignore plugin indent changes, instead use:
"filetype plugin on


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

filetype indent on
filetype plugin on

"Specific configurations
if has("gui_macvim")
  set transparency=3
  set lines=50 columns=200
  "set guifont=Source\ Code\ Pro:h12
  set guifont=OperatorMono\ Nerd\ Font:h13
  set linespace=2
  if hostname == 'NaiveCAI'
    set lines=50 columns=200
    set guifont=OperatorMono\ Nerd\ Font:h11
    set linespace=0
  endif
  "Hide toolbar and scrollbars in MacVim
  set guioptions-=m  "remove menu bar
  set guioptions-=T  "remove toolbar
  set guioptions-=r  "remove right-hand scroll bar
  set guioptions-=L  "remove left-hand scroll bar
endif


if has("gui_vimr")
  "To keey consistent with the macvim's <C-6>
  noremap <C-6> <C-S-6>
endif

if has("gui_macvim") || has("gui_vimr")
  colorscheme gruvbox            "macvim_theme_theme
  "let g:airline_theme='sierra'  "macvim_airline_theme
  set termguicolors
  highlight Comment gui=italic
else
  colorscheme gruvbox
  set fillchars+=vert:\|
end

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
      \ 'dir':  '\v[\/](\.git|\.hg|\.svn|_site|dist|node_modules|.webassets-cache|__pycache__|public\/(assets|packs))$',
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
let g:ctrlsf_ignore_dir = ['node_modules',  'dist', 'vendor', 'public', 'log', 'tmp']
let g:ctrlsf_context = '-B 6 -A 6'


"conf for ag
let g:ag_working_path_mode="r"


"conf for bufExplorer
let g:bufExplorerSortBy='mru'
let g:bufExplorerFindActive=1
let g:bufExplorerSplitRight=1     "Split right.
let g:bufExplorerVertSize=30      "New split windows size set by Vim.


"conf for airline
let g:airline#extensions#bufferline#enabled=1
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#ale#enabled=1
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=0
"let g:airline#extensions#tabline#left_sep=' '
"let g:airline#extensions#tabline#left_alt_sep='|'
"let g:airline#extensions#syntastic#enabled=1
" let g:airline_section_a       (mode, crypt, paste, spell, iminsert)
let g:airline_section_b=''
" let g:airline_section_c       (bufferline or filename)
" let g:airline_section_gutter  (readonly, csv)
let g:airline_section_x=''
let g:airline_section_y=''
" let g:airline_section_z=''
let g:airline_skip_empty_sections=1


"conf for ale - Asynchronous Lint Engine
let g:ale_open_list=1
let g:ale_lint_on_enter=0
let g:ale_set_loclist=0
"let g:ale_set_quickfix=1
let g:ale_lint_on_text_changed='never'
let g:ale_linters={
      \  'ruby': ['rubocop'],
      \  'python': ['pylint'],
      \  'javascript': ['eslint']
      \}
let b:ale_fixers = {'python': ['autopep8']}
let g:ale_sign_error = '❗️'
let g:ale_sign_warning = '❕'
let g:ale_fix_on_save = 1
let g:ale_lint_delay=50
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow


"conf for YCM
let g:ycm_autoclose_preview_window_after_insertion=1
let g:ycm_autoclose_preview_window_after_completion=1


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


"con for limelight
"Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg='gray'
let g:limelight_conceal_ctermfg=240
"Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg='DarkGray'
let g:limelight_conceal_guifg='#777777'
"Default: 0.5
let g:limelight_default_coefficient=0.7
"Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span=2
"Beginning/end of paragraph
"When there's no empty line between the paragraphs and each paragraph starts with indentation
let g:limelight_bop='^\s'
let g:limelight_eop='\ze\n^\s'
"Highlighting priority (default: 10)
"Set it to -1 not to overrule hlsearch
"let g:limelight_priority=-1"


"conf for deoplete
let g:deoplete#enable_at_startup = 1


"conf for Ultisnips
let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsEditSplit='vertical'
"let g:UltiSnipsJumpForwardTrigger="<tab>"
"let g:UltiSnipsJumpBackwardTrigger="<s-tab>"


"conf for tagbar
let g:tagbar_autofocus = 1


"for ruby, delete if you do not need
let g:tagbar_type_ruby = {
    \ 'kinds' : [
        \ 'm:modules',
        \ 'c:classes',
        \ 'd:describes',
        \ 'C:contexts',
        \ 'f:methods',
        \ 'F:singleton methods'
    \ ]
    \ }
if executable('ripper-tags')
  let g:tagbar_type_ruby = {
        \ 'kinds'      : ['m:modules',
        \ 'c:classes',
        \ 'C:constants',
        \ 'F:singleton methods',
        \ 'f:methods',
        \ 'a:aliases'],
        \ 'kind2scope' : { 'c' : 'class',
        \ 'm' : 'class' },
        \ 'scope2kind' : { 'class' : 'c' },
        \ 'ctagsbin'   : 'ripper-tags',
        \ 'ctagsargs'  : ['-f', '-']
        \ }
endif


"conf for wxapp
let g:user_emmet_settings = {
\ 'wxss': {
\   'extends': 'css',
\ },
\ 'wxml': {
\   'extends': 'html',
\   'aliases': {
\     'div': 'view',
\     'span': 'text',
\   },
\  'default_attributes': {
\     'block': [{'wx:for-items': '{{list}}','wx:for-item': '{{item}}'}],
\     'navigator': [{'url': '', 'redirect': 'false'}],
\     'scroll-view': [{'bindscroll': ''}],
\     'swiper': [{'autoplay': 'false', 'current': '0'}],
\     'icon': [{'type': 'success', 'size': '23'}],
\     'progress': [{'precent': '0'}],
\     'button': [{'size': 'default'}],
\     'checkbox-group': [{'bindchange': ''}],
\     'checkbox': [{'value': '', 'checked': ''}],
\     'form': [{'bindsubmit': ''}],
\     'input': [{'type': 'text'}],
\     'label': [{'for': ''}],
\     'picker': [{'bindchange': ''}],
\     'radio-group': [{'bindchange': ''}],
\     'radio': [{'checked': ''}],
\     'switch': [{'checked': ''}],
\     'slider': [{'value': ''}],
\     'action-sheet': [{'bindchange': ''}],
\     'modal': [{'title': ''}],
\     'loading': [{'bindchange': ''}],
\     'toast': [{'duration': '1500'}],
\     'audio': [{'src': ''}],
\     'video': [{'src': ''}],
\     'image': [{'src': '', 'mode': 'scaleToFill'}],
\   }
\ },
\}


"conf for gitgutter
"To customise your sign column's background color, first tell vim-gitgutter to leave it alone:
let g:gitgutter_override_sign_column_highlight=0
" highlight clear SignColumn


"conf for vim-ruby-runner
let g:RubyRunner_key = '<Leader>r'
let g:RubyRunner_keep_focus_key = '<Leader>R'


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
nmap <Leader>ss :so ~/.vimrc<cr>
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
nmap <Leader>gpu :Gpull 
nmap <Leader>gps :Gpush 
nmap <Leader>gco :Gcommit 
nmap <Leader>ga :Gwrite<cr>
nmap <Leader>gb :Gblame<cr>
nmap <Leader>gs :Gstatus<cr>
nmap <Leader>gd :Gvdiff<cr>

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

"for tagbar
nmap <Leader>tt :TagbarToggle<cr>

"for undotree
nmap <Leader>ou :UndotreeToggle<cr>

"for move cursor between windows
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"for change window size manually in OS X
if has("gui_vimr") || has("gui_macvim")
  nnoremap ¬ :vertical resize +6<cr>
  "nnoremap ¬ <C-W>>
  nnoremap ˙ :vertical resize -6<cr>
  "nnoremap ˙ <c-w><
  nnoremap ˚ :resize +6<cr>
  "nnoremap ˚ <C-W>+
  nnoremap ∆ :resize -6<cr>
  "nnoremap ∆ <C-W>-
  nnoremap ≠ <C-W>=
endif

"use CTRL and TAB to switch between tabs.
noremap <C-Tab> :tabnext<CR>
noremap <C-S-Tab> :tabprev<CR>

"for limelight
nmap <Leader>hh :Limelight<cr>
nmap <Leader>hf :Limelight!<cr>

"for vim wordy
noremap <silent> <F8> :<C-u>NextWordy<cr>
xnoremap <silent> <F8> :<C-u>NextWordy<cr>
inoremap <silent> <F8> <C-o>:NextWordy<cr>

"for locate
let g:locate_jump_to = 'stay'

"for ctags
function! FollowTag()
  if !exists("w:tagbrowse")
    vsplit
    let w:tagbrowse=1
  endif
  execute "tag " . expand("<cword>")
endfunction

nmap <C-]> :call FollowTag()<cr>
"nmap <C-]> :execute "vertical ptag " . expand("<cword>")<CR>

"for ctrlp-funky
nnoremap <Leader>fu :CtrlPFunky<Cr>
"narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>

"for vim-go
let g:go_fmt_experimental = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"color themes conf
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"conf for Gruvbox color theme
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_contrast_light='hard'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"other conf
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"for jinja syntax
au BufRead,BufNewFile *.j2 setf jinja "for ionic
let g:syntastic_html_tidy_ignore_errors=["<ion-", "discarding unexpected </ion-", " proprietary attribute \"ng-"]
"close the netrw at vim startup
let loaded_netrwPlugin=1
"NERDTree at vim startup
"autocmd VimEnter * NERDTree

"Try speed vim syntax rendering up
augroup vimrc
  autocmd!
  autocmd BufWinEnter,Syntax * syn sync minlines=500 maxlines=500
augroup END
