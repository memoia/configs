" colorscheme default looks bad when term={xterm,screen}
if &term =~ "screen" || &term =~ "xterm"
  colorscheme evening-imm
else
  colorscheme default
endif

set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=indent,eol,start	" more powerful backspacing

set autoindent		" always set autoindenting on
set textwidth=0		" Don't wrap words by default
set nobackup		" Don't keep a backup file
set viminfo='20,\"50	" read/write a .viminfo file, don't store more than
			" 50 lines of registers
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time

set tabstop=4		" Default tabstop value	(usually 8)
set softtabstop=4	" also try 2
set shiftwidth=4
set expandtab		" set noexpandtab to use actual tab chars

" Suffixes that get lower priority when doing tab completion for filenames.
" These are files we are not likely to want to edit or read.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

" We know xterm-debian is a color terminal
if &term =~ "xterm-debian" || &term =~ "xterm-xfree86"
  set t_Co=16
  set t_Sf=[3%dm
  set t_Sb=[4%dm
endif

" Make p in Visual mode replace the selected text with the "" register.
vnoremap p <Esc>:let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>

if has("syntax") && &t_Co > 2
  syntax on
endif

if has("autocmd")
 filetype plugin on
endif

set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching

"Run the current file as a shell program by typing
" escape colon comma x
cmap ,x :w<CR>:!./%<CR>

" For files where the filetype is incorrectly detected, use :set ft=whatever
" i.e., :set ft=php

cabbrev drupal syn on<CR>:set ft=php

highlight ExtraWhitespace ctermbg=red guibg=red
highlight InitialTabs ctermbg=yellow guibg=yellow

au ColorScheme *
        \ highlight ExtraWhitespace guibg=red |
        \ highlight InitialTabs guibg=yellow

au BufEnter *
        \ match ExtraWhitespace /\s\+$/ |
        \ 2match InitialTabs /^\t/

au InsertEnter *
        \ match ExtraWhitespace /\s\+\%#\@<!$/ |
        \ 2match InitialTabs /^\t/

au InsertLeave *
        \ match ExtraWhiteSpace /\s\+$/ |
        \ 2match InitialTabs /^\t/
