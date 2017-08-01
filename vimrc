syntax on
colorscheme murphy
set textwidth=72
set tabstop=4
set shiftwidth=0
set expandtab
set autoindent
set guioptions=i
set number
set hlsearch
set showcmd
set hidden
set ruler
set autochdir
set nojoinspaces
set modeline

" $VIMRUNTIME/filetype.vim recognizes only README.md as markdown file.
" All other *.md files are recognized as modula2 files. Recognize *.md
" files as markdown files instead.
autocmd BufNewFile,BufRead *.md,*.txt set filetype=markdown
autocmd BufNewFile,BufRead *.go,Makefile setlocal tabstop=8 noexpandtab

" Set font according to the computer I am working on
if has("gui_running")
    if has("gui_gtk2")
        set guifont=Monospace\ 10
    elseif has("gui_macvim")
        set guifont=Menlo:h12
    elseif has("gui_win32")
        set guifont=Consolas:h10
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

" Highlight TODO in any file.
autocmd BufWinEnter * syntax keyword Todo TODO

" Highlight trailing whitespace as error.
autocmd BufWinEnter * syntax match Error /\s\+$/

" Open URLs using desktop browser.
if has("gui_gtk2")
    if has("gui_running")
        " Workaround for https://bugzilla.xfce.org/show_bug.cgi?id=12251
        let g:netrw_browsex_viewer="setsid xdg-open"
    else
        let g:netrw_browsex_viewer="xdg-open"
    endif
endif

" Development settings
set tags=./tags;
set cscoperelative
autocmd BufWinEnter * call LoadCscope()
function LoadCscope()
    let db = findfile("cscope.out", ".;") 
    if !empty(db)
        execute "cscope add " . db
    endif
endfunction
