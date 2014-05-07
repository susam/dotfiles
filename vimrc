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

" $VIMRUNTIME/filetype.vim recognizes only README.md as markdown file.
" All other *.md files are recognized as modula2 files. Recognize *.md
" files as markdown files instead.
autocmd BufNewFile,BufRead *.md set filetype=markdown

if has("gui_running")
    if has("gui_gtk2")
        set guifont=Inconsolata\ 16,DejaVu\ Sans\ Mono\ 14
    elseif has("gui_win32")
        set guifont=Inconsolata:h18:cANSI,Consolas:h16:cANSI
    endif
endif
