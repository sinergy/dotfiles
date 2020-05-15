" Start the Vim-Plug section
call plug#begin('~/.vim/plugged')
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'git@github.com:vim-airline/vim-airline.git'
call plug#end()

"filetype plugin indent on
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

syntax on                             " syntax highlight
set hlsearch                          " search highlighting
set incsearch                         " incremental search
syntax enable
set t_Co=256
try
  colorscheme seoul256
catch
endtry
set gfn=Monaco:h14
"set gfn=Menlo:h14

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" let Tlist_Ctags_Cmd='/usr/local/Cellar/ctags/5.8/bin/ctags'
" let g:Tlist_Ctags_Cmd='/usr/local/Cellar/ctags/5.8/bin/ctags'
"---------------
" powerline
"---------------
let g:Powerline_symbols='unicode'
set laststatus=2 " not only appears in split windows
"---------------
" ctags.vim
"---------------
let Tlist_Ctags_Cmd='/usr/local/Cellar/ctags/5.8/bin/ctags'
let Tlist_WinWidth=40
let Tlist_GainFocus_On_ToggleOpen=1
map <F4> :TlistToggle<cr>
set tags+=./tags;/
set tags+=gems.tags
autocmd FileType ruby let &l:tags = pathogen#legacyjoin(pathogen#uniq(pathogen#split(&tags) + map(split($GEM_PATH,':'),'v:val."/gems/*/tags"')))

"---------------
" fugitive.vim
"---------------
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gl :Glog<CR>
nnoremap <silent> <leader>gp :Git push<CR>
"--------------
" CtrlP.vim
"--------------
nnoremap <C-W><C-U> :CtrlPMRU<CR>
nnoremap <C-W>u :CtrlPMRU<CR>
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'
let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1
let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1
"--------------
" NERDTree.vim
"--------------
nnoremap <silent> <F2> :NERDTreeMirrorToggle<CR>
let NERDTreeShowBookmarks=0
let NERDTreeChDirMode=2
let NERDTreeMouseMode=2
let g:nerdtree_tabs_focus_on_files=1
let g:nerdtree_tabs_open_on_gui_startup=0
" open directory of current opened file
map <leader>r :NERDTreeFind<cr>
" make nerdtree look nice
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1
let g:NERDTreeWinSize=30
"--------------
" Rails.vim
"--------------
map <leader>gg :topleft 100 :split Gemfile<CR>
map <leader>gr :topleft 100 :split config/routes.rb<CR>
"--------------
" ScriptRunner.vim
"--------------
" ActionScript
autocmd BufRead,BufNewFile *.as map <F5> :silent !$FLEX_HOME/bin/mxmlc % \| iconv -f big5 -t utf-8<CR>:redraw!<CR>:echon "Done!"<CR>
autocmd BufRead,BufNewFile *.mxml map <F5> :silent !$FLEX_HOME/bin/mxmlc % \| iconv -f big5 -t utf-8<CR>:redraw!<CR>:echon "Done!"<CR>

" VimScript
autocmd BufRead,BufNewFile *.vim map <F5> :source %<CR>:echon "script reloaded!"<CR>

" CoffeeScript
if executable("coffee")
  autocmd BufRead,BufNewFile *.coffee map <F5> :CoffeeRun<CR>
else
  autocmd BufRead,BufNewFile *.coffee map <F5> :echo "you need to install CoffeeScript first!"<CR>
endif

" Javascript
if executable("js")
  autocmd BufRead,BufNewFile *.js map <F5> :% w !js %<CR>
else
  autocmd BufRead,BufNewFile *.js map <F5> :echo "you need to install SpiderMonkey first!"<CR>
endif

" PHP
if executable("php")
  autocmd BufRead,BufNewFile *.php map <F5> :% w !php<CR>
else
  autocmd BufRead,BufNewFile *.php map <F5> :echo "you need to install PHP first!"<CR>
endif

" Python
if executable("python")
  autocmd BufRead,BufNewFile *.py map <F5> :% w !python<CR>
else
  autocmd BufRead,BufNewFile *.py map <F5> :echo "you need to install Python first!"<CR>
endif

" Ruby
if executable("ruby")
  autocmd BufRead,BufNewFile *.rb map <F5> :% w !ruby -w<CR>
else
  autocmd BufRead,BufNewFile *.rb map <F5> :echo "you need to install Ruby first!"<CR>
endif

" Scala
if executable("scala")
  autocmd BufRead,BufNewFile *.scala map <F5> :% w !scala %<CR>
else
  autocmd BufRead,BufNewFile *.scala map <F5> :echo "you need to install Scala first!"<CR>
end

" Perl
if executable("perl")
  autocmd BufRead,BufNewFile *.pl map <F5> :% w !perl %<CR>
else
  autocmd BufRead,BufNewFile *.pl map <F5> :echo "you need to install Perl first!"<CR>
end
"--------------

let g:tagbar_ctags_bin='/usr/local/bin/ctags'
let g:tagbar_width=26
noremap <silent> <leader>t :TagbarToggle<cr>
noremap <silent> <leader>tl :Tlist<cr>

"number of lines
set nu

" Fast saving
nmap <leader>w :w!<cr>
"replace the current word in all opened buffers
map <leader>r :call Replace()<CR>
" open the error console
map <leader>cc :botright cope<CR>
" move to next error
map <leader>] :cn<CR>
" move to the prev error
map <leader>[ :cp<CR>

" NERDTreeToggle
nmap <leader>e :NERDTreeToggle<CR>

" When .vimrc is edited, reload it
autocmd! bufwritepost .vimrc source ~/.vimrc

set nocompatible	" not compatible with the old-fashion vi mode
set bs=2		" allow backspacing over everything in insert mode
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set autoread		" auto read when file is changed from outside
set cmdheight=2 "The commandbar height

set hlsearch "Highlight search things
" hit enter to cancel searched highlight
" noremap <CR> :nohlsearch<CR>
set incsearch "Make search act like search in modern browsers
set nolazyredraw "Don't redraw while executing macros
set magic "Set magic on, for regular expressions
set showmatch "Show matching bracets when text indicator is over them
set showmode
set autoindent		" auto indentation
set incsearch		" incremental search
set nobackup		" no *~ backup files
set copyindent		" copy the previous indentation on autoindenting
set ignorecase		" ignore case when searching
set smartcase		" ignore case if search pattern is all lowercase,case-sensitive otherwise
set smarttab		" insert tabs on the start of a line according to context
set expandtab   " replace <TAB> with spaces
set shiftwidth=2
set tabstop=2

" Smart way to move btw. windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" ,/ turn off search highlighting
nmap <enter> :nohl<CR>

" :cd. change working directory to that of the current file
cmap cd. lcd %:p:h

"---------------------------------------------------------------------------
" ENCODING SETTINGS
"---------------------------------------------------------------------------
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,big5,gb2312,latin1

"-----------------
" custom key
"-----------------
" remove tailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" next and prev tab
noremap <F7> gT
noremap <F8> gt

" return current opened file's dirctory
cnoremap %% <C-R>=expand('%:h').'/'<CR>

" quick open vimrc in a new tab
nmap <leader>v :tabe $MYVIMRC<CR>

" zen coding customize extending key map
inoremap <C-e> <C-y>

" execute shell script without leaving vim
nnoremap <F9> :!%:p
