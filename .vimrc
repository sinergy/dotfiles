"---------------------------------------------------------------------------
" ENCODING SETTINGS
"---------------------------------------------------------------------------
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,big5,gb2312,latin1

filetype plugin indent on   " Enable filetype detection, plugins and indenting
syntax enable               " syntax highlight
set t_Co=256
set gfn=Monaco:h14
"set gfn=Menlo:h14

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","

" Every autocmd below lives in this group, so re-sourcing the vimrc doesn't duplicate them
augroup vimrc
  autocmd!
augroup END

"---------------
" General
"---------------
set laststatus=2    " always show the status line, not only in split windows
set nu              " number of lines
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set history=50      " keep 50 lines of command line history
set ruler           " show the cursor position all the time
set autoread        " auto read when file is changed from outside
set cmdheight=2     " The commandbar height
set showmatch       " Show matching brackets when text indicator is over them
set showmode
set nobackup        " no *~ backup files

set hlsearch        " Highlight search things
set incsearch       " Make search act like search in modern browsers
set ignorecase      " ignore case when searching
set smartcase       " ignore case if search pattern is all lowercase, case-sensitive otherwise

set autoindent      " auto indentation
set copyindent      " copy the previous indentation on autoindenting
set smarttab        " insert tabs on the start of a line according to context
set expandtab       " replace <TAB> with spaces
set shiftwidth=2
set tabstop=2

" look for a tags file in the current directory, then upwards
set tags+=./tags;/

"---------------
" File explorer (netrw)
"---------------
let g:netrw_banner = 0
let g:netrw_liststyle = 3   " tree view
let g:netrw_winsize = 25
" toggle the explorer
nnoremap <silent> <leader>e :Lexplore<CR>
" open the explorer at the directory of the current file
nnoremap <silent> <leader>r :Lexplore %:p:h<CR>

"--------------
" Rails
"--------------
nnoremap <leader>gg :topleft 100split Gemfile<CR>
nnoremap <leader>gr :topleft 100split config/routes.rb<CR>

"--------------
" Script runner: <F5> runs the current buffer
"--------------
let s:runners = {
      \ 'javascript': 'node',
      \ 'perl': 'perl',
      \ 'php': 'php',
      \ 'python': 'python3',
      \ 'ruby': 'ruby -w',
      \ 'sh': 'bash',
      \ 'zsh': 'zsh',
      \ }

function! s:RunBuffer() abort
  if &filetype ==# 'vim'
    source %
    echon "script reloaded!"
    return
  endif
  let l:cmd = get(s:runners, &filetype, '')
  if empty(l:cmd)
    echo "no runner for filetype '" . &filetype . "'"
  elseif !executable(split(l:cmd)[0])
    echo "you need to install " . split(l:cmd)[0] . " first!"
  else
    execute 'w !' . l:cmd
  endif
endfunction
nnoremap <F5> :call <SID>RunBuffer()<CR>

"--------------
" Key mappings
"--------------
" Fast saving
nnoremap <leader>w :w!<CR>
" open the error console
nnoremap <leader>cc :botright cope<CR>
" move to next error
nnoremap <leader>] :cn<CR>
" move to the prev error
nnoremap <leader>[ :cp<CR>

" Smart way to move btw. windows
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l

" <Enter> turns off search highlighting (but still jumps to the entry in quickfix lists)
nnoremap <expr> <CR> &buftype ==# 'quickfix' ? "\<CR>" : ":nohlsearch\<CR>"

" :cd. change working directory to that of the current file
cnoremap cd. lcd %:p:h

" next and prev tab
nnoremap <F7> gT
nnoremap <F8> gt

" return current opened file's directory
cnoremap %% <C-R>=expand('%:h').'/'<CR>

" quick open vimrc in a new tab
nnoremap <leader>v :tabe $MYVIMRC<CR>

" execute shell script without leaving vim
nnoremap <F9> :!%:p

"--------------
" Autocommands
"--------------
" remove trailing whitespace on save, keeping the cursor and the last search
" (skip Markdown, where two trailing spaces mean a line break)
function! s:TrimTrailingWhitespace() abort
  if &filetype ==# 'markdown' || &binary
    return
  endif
  let l:view = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:view)
endfunction
autocmd vimrc BufWritePre * call s:TrimTrailingWhitespace()

" When .vimrc is edited, reload it
autocmd vimrc BufWritePost .vimrc source $MYVIMRC
