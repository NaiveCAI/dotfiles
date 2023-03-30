set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
let g:python3_host_prog='/opt/homebrew/bin/python3'

source ~/.vimrc


" For neovim-qt
set linespace=2

" Set Editor Font
if exists(':GuiFont')
  " Use GuiFont! to ignore font errors
  GuiFont OperatorMono\ Nerd\ Font:h13
endif

if exists(':GuiTabline')
  GuiTabline 0
endif

" Disable GUI Popupmenu
if exists(':GuiPopupmenu')
  GuiPopupmenu 0
endif

" Enable GUI ScrollBar
" if exists(':GuiScrollBar')
"     GuiScrollBar 1
" endif
GuiScrollBar 0

cnoremap <D-V> <c-r>+
" Right Click Context Menu (Copy-Cut-Paste)
" nnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>
" inoremap <silent><RightMouse> <Esc>:call GuiShowContextMenu()<CR>
" xnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>gv
" snoremap <silent><RightMouse> <C-G>:call GuiShowContextMenu()<CR>gv
