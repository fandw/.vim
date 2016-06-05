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

filetype plugin indent on

" Show syntax
syntax on

" Color scheme
colorscheme darcula

" Character encoding
set encoding=utf-8

" Font and size
if has('macunix')
    set guifont=Source\ Code\ Pro:h14
elseif has('win32')
    set guifont=Source_Code_Pro:h12:cANSI
    " source $VIMRUNTIME/mswin.vim
    let g:loaded_youcompleteme = 1
    set guioptions-=m  "remove menu bar
    set guioptions-=T  "remove toolbar
else
    set guifont=Source\ Code\ Pro\ Medium\ 12
endif

" set tabs to have 2 spaces
set ts=4
set sw=4

" indent when moving to the next line while writing code
set autoindent

" Fix backspace not working
set backspace=indent,eol,start

" expand tabs into spaces
set expandtab

" when using the >> or << commands, shift lines by 4 spaces
set shiftwidth=4

" show a visual line under the cursor's current line
set cursorline

" show the matching part of the pair for [] {} and ()
set showmatch

" Highlight search
set hlsearch

" Auto reload files
set autoread

" Draw an 80 column line
set colorcolumn=81
" set textwidth=80
" highlight OverLength ctermbg=red ctermfg=white guibg=#592929
" match OverLength /\%81v.\+/

" enable all Python syntax highlighting features
let python_highlight_all = 1
let python_version_2 = 1

" YMC settings
highlight Pmenu ctermfg=15 ctermbg=0 guifg=#ffffff guibg=#000000
" Move up and down in autocomplete with <c-j> and <c-k>
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")
let g:ycm_auto_trigger = 0
let g:ycm_autoclose_preview_window_after_insertion = 1

" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>

" NERDTree settings
nmap <leader>nt :NERDTree<Space>
nmap <leader>bk :Bookmark<Space>
nmap <leader>hp :help<Space>nerd_tree.txt<cr>
nmap <leader>tg :NERDTreeToggle<cr>
let NERDTreeIgnore = ['\.pyc$']

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" Ctrlp
let g:ctrlp_map = '<c-p>'"
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:10,results:20'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_max_depth = 40
let g:ctrlp_max_files = 0
let g:ctrlp_by_filename = 1
let g:ctrlp_switch_buffer = 'Et'
" Jedi-vim
let g:jedi#auto_initialization = 0
" Syntastics
let g:syntastic_quiet_messages = { "type": "style" }

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

" Macros recorded
" @c block comment lines
" @v paste from os clipboard
" @u block uncomment lines
