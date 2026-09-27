" Display line numbers on the sidebar
set number

" Display current line and column on the bottom bar
set ruler

" Set tabs to be 2 spaces wide
set tabstop=2
set shiftwidth=2

" Automatically indent code when going to the next line
set autoindent
set smartindent

" Expand tab characters to be spaces.
set expandtab

" Highlight search results
set hlsearch

" Start search without having to submit
set incsearch

" Allow mouse for pasting etc
set mouse=a

" Keep 7 lines visible at the top and bottom of the screen when scrolling
set so=7

" Use n and N to center the next search result on the screen
nmap n nzz
nmap N Nzz

" Show whitespace
set list
set listchars=tab:→\ ,trail:·

" Flash on the screen instead of making the bell sound
set noerrorbells
set visualbell

filetype plugin indent on
syntax on

" Don't expand tabs for Makefiles
autocmd FileType make setlocal noexpandtab softtabstop=0

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid, when inside an event handler
" (happens when dropping a file on gvim), for a commit or rebase message
" (likely a different one than last time), and when using xxd(1) to filter
" and edit binary files (it transforms input files back and forth, causing
" them to have dual nature, so to speak) or when running the new tutor
autocmd BufReadPost *
  \ let line = line("'\"")
  \ | if line >= 1 && line <= line("$") && &filetype !~# 'commit'
  \      && index(['xxd', 'gitrebase', 'tutor'], &filetype) == -1
  \      && !&diff
  \ |   execute "normal! g`\""
  \ | endif

" Quite a few people accidentally type "q:" instead of ":q" and get confused
" by the command line window.  Give a hint about how to get out.
autocmd CmdwinEnter *
\ echohl Todo |
\ echo gettext('You discovered the command-line window! You can close it with ":q".') |
\ echohl None

" ---------------------------------------------------------------------------
" Match these numbers to your course's code standard.
set tabstop=2               " a tab character displays as 2 columns
set shiftwidth=2            " >> and auto-indent move by 2 columns
set softtabstop=2           " the Tab key inserts 2 columns
set expandtab               " insert spaces, never tab characters
set autoindent              " new lines keep the previous line's indent

" Makefiles REQUIRE real tab characters. Without this line, expandtab above
" would silently break every Makefile you edit.
autocmd FileType make setlocal noexpandtab

" ---------------------------------------------------------------------------
" Searching  ( /word  then  n  for next,  N  for previous )
" ---------------------------------------------------------------------------
set incsearch               " jump to matches while you type
set hlsearch                " highlight all matches
set ignorecase              " case-insensitive search...
set smartcase               " ...unless you type a capital letter

" ---------------------------------------------------------------------------
" Convenience
" ---------------------------------------------------------------------------
" Reopen a file at the line where you last left it.
autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif

