" Pathogen
execute pathogen#infect()

" Remap escape
inoremap jk <ESC>

" Remap leader key
let mapleader = "\<Space>"

" Show line number
set nu

" Show command queue
set showcmd

" Set initial window size
" set lines=55 columns=180

filetype plugin indent on

" Show syntax
syntax on

" Color scheme
colorscheme darcula

" Character encoding
set encoding=utf-8

" Font and size
set guifont=Source\ Code\ Pro:h14

" set tabs to have 2 spaces
set ts=2

" indent when moving to the next line while writing code
set autoindent

" expand tabs into spaces
set expandtab

" when using the >> or << commands, shift lines by 4 spaces
set shiftwidth=2

" show a visual line under the cursor's current line
set cursorline

" show the matching part of the pair for [] {} and ()
set showmatch

" Highlight search
set hlsearch

" enable all Python syntax highlighting features
let python_highlight_all = 1

" SmoothScroll for ctrl + U/D
function SmoothScroll(up)
    if a:up
        let scrollaction=""
    else
        let scrollaction=""
    endif
    exec "normal " . scrollaction
    redraw
    let counter=1
    while counter<&scroll
        let counter+=1
        sleep 10m
        redraw
        exec "normal " . scrollaction
    endwhile
endfunction

nnoremap <C-U> :call SmoothScroll(1)<Enter>
nnoremap <C-D> :call SmoothScroll(0)<Enter>
inoremap <C-U> <Esc>:call SmoothScroll(1)<Enter>i
inoremap <C-D> <Esc>:call SmoothScroll(0)<Enter>i

" Highlight all instances of word under cursor, when idle.
" Useful when studying strange source code.
" Type z/ to toggle highlighting on/off.
nnoremap z/ :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>
function! AutoHighlightToggle()
  let @/ = ''
  if exists('#auto_highlight')
    au! auto_highlight
    augroup! auto_highlight
    setl updatetime=4000
    echo 'Highlight current word: off'
    return 0
  else
    augroup auto_highlight
      au!
      au CursorHold * let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
    augroup end
    setl updatetime=500
    echo 'Highlight current word: ON'
    return 1
  endif
endfunction

"Start with highlighting on
call AutoHighlightToggle()

" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>

" NERDTree settings
let g:nerdtree_tabs_open_on_console_startup=1
nmap <leader>nt :NERDTree py<cr>
let NERDTreeIgnore = ['\.pyc$']

" Highlight variable under cursor
" :autocmd CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))
