syntax on
colorscheme murphy
set textwidth=72
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set guioptions=i
set number
set hlsearch
set showcmd
set hidden
set ruler

" $VIMRUNTIME/filetype.vim recognizes only README.md as markdown file.
" All other *.md files are recognized as modula2 files. Recognize *.md
" files as markdown files instead.
autocmd BufNewFile,BufRead *.md set filetype=markdown

" Set font according to the computer I am working on
if has("gui_running")
    if has("gui_gtk2")
        set guifont=Inconsolata\ 14
    elseif has("gui_macvim")
        set guifont=Menlo:h13
    elseif has("gui_win32")
        set guifont=Inconsolata:h16,Consolas:h14
    endif
endif

" While coding vertical split windows in terminals, sometimes a single
" line of code wraps into multiple lines in vertical split window. If the
" code is written to not exceed 72, 80 or 120 characters per line, then
" one of the following commands would resize the vertical split window
" to sufficient number of columns to read such code.
command Wide vertical resize 78
command Wider vertical resize 86
command Widest vertical resize 126
