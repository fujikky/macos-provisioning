".vimrc
" Minimal setup for editing commit messages and config files.

set nocompatible

" Encoding
set encoding=utf-8
set fileencodings=utf-8,cp932,euc-jp,iso-2022-jp
set fileformats=unix,dos,mac
set ambiwidth=double

" Backup and swap files
if empty(glob('~/.vimbackup'))
  silent !mkdir -p ~/.vimbackup
endif
set backupdir=$HOME/.vimbackup
set directory=$HOME/.vimbackup

" Display
syntax on
set number
set list
set listchars=eol:$,tab:>\ ,extends:<
set showmatch
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set laststatus=2

" Editing
set autoindent
set smartindent
set smarttab
set tabstop=4
set shiftwidth=4
set backspace=indent,eol,start
set hidden
set whichwrap=b,s,h,l,<,>,[,]

" Search
set incsearch
set smartcase
set nowrapscan

filetype plugin indent on

" Move between windows with Tab
map <tab> <C-w><C-w>

" Create the parent directory on write if it is missing
augroup vimrc-auto-mkdir
  autocmd!
  autocmd BufWritePre * call s:auto_mkdir(expand('<afile>:p:h'))
  function! s:auto_mkdir(dir)
    if !isdirectory(a:dir)
      call mkdir(a:dir, 'p')
    endif
  endfunction
augroup END
