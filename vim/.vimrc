let hostname=substitute(system('hostname'), '\n', '', '')

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'Shougo/neocomplete.vim'
Plugin 'vim-scripts/BufOnly.vim'
Plugin 'mileszs/ack.vim'
Plugin 'rking/ag.vim'
Plugin 'w0rp/ale'
Plugin 'jiangmiao/auto-pairs'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'kien/ctrlp.vim'
Plugin 'dyng/ctrlsf.vim'
Plugin 'rizzatti/dash.vim'
Plugin 'mattn/emmet-vim'
Plugin 'junegunn/goyo.vim'
Plugin 'morhetz/gruvbox'
Plugin 'sjl/gundo.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'junegunn/limelight.vim'
Plugin 'mtth/locate.vim'
Plugin 'vim-scripts/matchit.zip'
Plugin 'Valloric/MatchTagAlways'
Plugin 'scrooloose/nerdtree'
Plugin 'evanmiller/nginx-vim-syntax'
Plugin 'vim-scripts/ruby-matchit'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'ervandew/supertab'
Plugin 'godlygeek/tabular'
Plugin 'majutsushi/tagbar'
Plugin 'SirVer/ultisnips'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-commentary'
Plugin 'blueyed/vim-diminactive'
Plugin 'easymotion/vim-easymotion'
Plugin 'xolox/vim-easytags'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'machakann/vim-highlightedyank'
Plugin 'pangloss/vim-javascript'
Plugin 'elzr/vim-json'
Plugin 'NaiveCAI/vim-kalisi'
Plugin 'xolox/vim-misc'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-repeat'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-surround'
Plugin 'posva/vim-vue'
Plugin 'wakatime/vim-wakatime'
Plugin 'reedes/vim-wordy'
Plugin 'pbrisbin/vim-mkdir'
Plugin 'suan/vim-instant-markdown'
Plugin 'thoughtbot/vim-rspec'
Plugin 'yonchu/accelerated-smooth-scroll'

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
set linespace=2
set nobackup
set nocompatible
"This could be an inconvenience in some cases where you are storing something else in the clipboard as it will override it.
"set clipboard=unnamed
set background=dark

set autoindent
set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab

set mouse=a                 "可以在buffer的任何地方使用鼠标
set cursorline              "为光标所在行加下划线
set cursorcolumn            "highlight current column
set selection=exclusive
set selectmode=mouse,key

"set relativenumber
set nu
set autoread                "文件在Vim之外修改过，自动重新读入
set autowrite               "切换buffer前保存内容
set ignorecase smartcase    "检索时不忽略大小写
set hls                     "检索时高亮显示匹配项

set foldcolumn=1
set foldlevel=3
set foldmethod=indent       "代码折叠
autocmd BufRead,BufNewFile *.css,*.scss,*.less setlocal foldmethod=marker foldmarker={,}

set matchtime=1             "匹配括号高亮时间（十分之一秒）
set lazyredraw              "buffer screen updates instead of updating all the time
set ttyfast

set helplang=cn             "帮助系统设置为中文
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

set completeopt=menu,preview
set wildmode=longest,list:longest

set iskeyword=@,48-57,_,-,!,?,192-255

"Try to fix jk map error: Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

filetype indent on
filetype plugin on

"Specific configurations
if has("gui_macvim")
  set transparency=5
  set lines=50 columns=220
  if hostname == "TracyEkohe"
    set guifont=Source\ Code\ Pro:h12
    set lines=55 columns=230
  elseif hostname == 'NaiveCAI'
    set guifont=Source\ Code\ Pro:h10
    set lines=50 columns=220
  endif
  let g:airline_powerline_fonts=1
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
  colorscheme gruvbox              "macvim_theme_theme
  "let g:airline_theme='sierra'    "macvim_airline_theme
  set termguicolors
  highlight Comment gui=italic
elseif has("gui_running")
  set lines=40 columns=160
  set guifont=yahei\ consolas\ hybrid\ 9
elseif has("gui_win32")
  set guifont=YaHei\ Consolas\ Hybrid:h10
else
  colorscheme gruvbox
  set fillchars+=vert:\|
end

"Change vertical split line style
set fillchars+=vert:\|
hi VertSplit guibg=bg guifg=fg


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"conf for plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"conf for NERDTree
let g:NERDTreeWinSize=50
let g:NERDTreeHijackNetrw=0


"conf for ctrlp
let g:ctrlp_map='<c-p>'
let g:ctrlp_custom_ignore={
      \ 'dir':  '\v[\/](\.git|\.hg|\.svn|_site|node_modules)$',
      \ 'file': '\v\.(log|jpg|jpeg|png)$',
      \ }
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
let g:ctrlp_open_multiple_files='3vjr'


"conf for ctrlsf
let g:ctrlsf_winsize='35%'
let g:ctrlsf_mapping={
      \ "next": "n",
      \ "prev": "N",
      \ "openb": "",
      \}
let g:ctrlsf_ignore_dir = ['bower_components', 'npm_modules', 'tmp', 'log', 'tags']
let g:ctrlsf_context = '-B 6 -A 6'


"conf for ag
let g:ag_working_path_mode="r"


"conf for bufExplorer
let g:bufExplorerSortBy='mru'
let g:bufExplorerFindActive=1
let g:bufExplorerSplitRight=1     "Split right.
let g:bufExplorerVertSize=30      "New split windows size set by Vim.


"conf for easytags
set tags=./tags;
let g:easytags_async=1
let g:easytags_dynamic_files=1    "Also look for project-specific tags files.
let g:easytags_auto_highlight=0
let g:ycm_collect_identifiers_from_tags_files=0


"conf for gem-ctags search all gems
"autocmd FileType ruby let &l:tags=pathogen#legacyjoin(pathogen#uniq(
"      \ pathogen#split(&tags) +
"      \ map(split($GEM_PATH,':'),'v:val."/gems/*/tags"')))


"conf for golang
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)


"conf for airline
let g:airline#extensions#bufferline#enabled=1
let g:airline#extensions#tabline#enabled=0
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#ale#enabled=1
"let g:airline#extensions#syntastic#enabled=1
"let g:airline#extensions#tabline#left_sep=' '
"let g:airline#extensions#tabline#left_alt_sep='|'


"conf for syntastic
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" let g:syntastic_always_populate_loc_list=1
" let g:syntastic_auto_loc_list=1
" let g:syntastic_loc_list_height=5
" let g:syntastic_check_on_open=1
" let g:syntastic_check_on_wq=1
" let g:syntastic_mode_map = { "mode": "passive" }

" let g:syntastic_ruby_checkers = ['mri']
" let g:syntastic_ruby_mri_exec='~/.rvm/rubies/ruby-2.3.0/bin/ruby'
"using rubocop for syntax check instead
"let g:syntastic_ruby_checkers=['rubocop']
"let g:syntastic_ruby_rubocop_exec='~/.rvm/gems/ruby-2.3.0/gems/rubocop-0.48.1/bin/rubocop'

" let g:syntastic_javascript_checkers=['eslint']
"using JSHint instead
"let g:syntastic_javascript_checkers=['jsxhint']
"let g:syntastic_javascript_jsxhint_exec='jsx-jshint-wrapper'

" let g:syntastic_html_tidy_quiet_messages={ "level": "warnings" }
"let g:syntastic_html_tidy_ignore_errors=[ '<input> proprietary attribute "role"', '<input> proprietary attribute "min"' ]
" let g:syntastic_error_symbol="✘"
" let g:syntastic_warning_symbol="▷"


"conf for ale - Asynchronous Lint Engine
let g:ale_linters = {
      \   'ruby': ['ruby'],
      \}


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


"conf for vim-jsx
"By default, JSX syntax highlighting and indenting will be enabled only for files with the .jsx extension. If you would like JSX in .js files.
"let g:jsx_ext_required=0


"conf for indentLine
"Vim
let g:indentLine_color_term=239
"GVim
let g:indentLine_color_gui='#86827f'
let g:indentLine_char='¦'
"none X terminal
let g:indentLine_color_tty_light=7 "(default: 4)
let g:indentLine_color_dark=1 "(default: 2)


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


"conf for YouCompleteMe
"let g:ycm_auto_trigger=1
"let g:ycm_key_list_select_completion=['<C-n>', '<Down>']
"let g:ycm_key_list_previous_completion=['<C-p>', '<Up>']
"let g:ycm_key_list_select_completion=['<tab>', '<Down>']
"let g:ycm_key_list_previous_completion=['<s-tab>', '<Up>']


"conf for neocomplete
"Note: This option must be set in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'


"conf for Ultisnips
let g:UltiSnipsExpandTrigger="<TAB>"
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


"conf for vim-multiple-cursors
"Fix insert mode conflict with neocomplete plugin
function! Multiple_cursors_before()
    exe 'NeoCompleteLock'
    echo 'Disabled autocomplete'
endfunction

function! Multiple_cursors_after()
    exe 'NeoCompleteUnlock'
    echo 'Enabled autocomplete'
endfunction


"conf for gundo
let g:gundo_width=40
let g:gundo_preview_height=40
let g:gundo_right=1


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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"conf for other key maps
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap jk <ESC>
vnoremap , <ESC>
imap <Tab> <C-X>
nmap mm :NERDTreeToggle<cr>
nmap mf :NERDTreeFind<cr>
nmap <Leader>d :bd<cr>
nmap <Leader>z :nohl<cr>
nmap <Leader>ss :so ~/.vimrc<cr>
nmap <Leader>t :Tab /
nmap <Leader>ssp :set paste<cr>
nmap <Leader>nsp :set nopaste<cr>
nmap <Leader>sss :set syntax=
nmap <F10> :BufOnly<cr>

"for macvim's sb screen bug
nmap <Leader>fk <C-W><S-H> <C-W><S-L> <C-W><S-H>

"for CtrlSF
nmap <Leader>f :CtrlSF 
nmap <F3> <Plug>CtrlSFCwordExec
nmap <F4> :!rspec %<CR>
nmap <F5> :GundoToggle<CR>

"for fugitive
nmap <Leader>gpu :Gpull 
nmap <Leader>gps :Gpush 
nmap <Leader>gco :Gcommit 
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

"TODO: Get current file type as variable, then add it to commandline.
nnoremap <Leader>ds :Dash <C-R><C-A> 

"use CTRL and TAB to switch between tabs.
noremap <C-Tab> :tabnext<CR>
noremap <C-S-Tab> :tabprev<CR>

"for limelight
nmap <Leader>hh :Limelight<cr>
nmap <Leader>hf :Limelight!<cr>

"for macvim clipboard
vmap "+y :w !pbcopy<cr><cr> 
nmap "+p :r !pbpaste<cr><cr>

"for vim wordy
noremap <silent> <F8> :<C-u>NextWordy<cr>
xnoremap <silent> <F8> :<C-u>NextWordy<cr>
inoremap <silent> <F8> <C-o>:NextWordy<cr>


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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"color themes conf
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"conf for Badwolf color theme
"Make the tab line the same color as the background. These values can be set. [0, 1, 2, 3]
let g:badwolf_tabline=2
let g:badwolf_darkgutter=1
"Turn off HTML link underlining
let g:badwolf_html_link_underline=0
"Turn on CSS properties highlighting
let g:badwolf_css_props_highlight=1

"conf for Gruvbox color theme
"let g:gruvbox_contrast_dark='hard'
"let g:gruvbox_contrast_light='hard'

"conf for sierra color theme
let g:sierra_Campfire = 1

"conf for Jellybeans
let g:jellybeans_use_term_italics=1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"other conf
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"for rabl syntax
au BufRead,BufNewFile *.rabl setf ruby
"for es6 syntax
au BufRead,BufNewFile *.es6 setf javascript
"for slim syntax
au BufRead,BufNewFile *.slim setf haml
"for ionic
let g:syntastic_html_tidy_ignore_errors=["<ion-", "discarding unexpected </ion-", " proprietary attribute \"ng-"]
"close the netrw at vim startup
let loaded_netrwPlugin=1
"NERDTree at vim startup
"autocmd VimEnter * NERDTree
