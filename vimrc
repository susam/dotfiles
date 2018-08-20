" General Options
" ===============
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
set incsearch
set showcmd
set hidden
set ruler
set autochdir
set nojoinspaces
set modeline
set wildmenu
set listchars=eol:$,tab:>-,nbsp:~,trail:~

" Set font according to the desktop environment.
if has('gui_running')
    if has('gui_gtk2')
        set guifont=Monospace\ 10
    elseif has('gui_macvim')
        set guifont=Menlo:h12
    elseif has('gui_win32')
        set guifont=Consolas:h10
    endif
endif

" Open URLs using desktop browser.
if has('gui_gtk2')
    if has('gui_running')
        " Workaround for https://bugzilla.xfce.org/show_bug.cgi?id=12251
        let g:netrw_browsex_viewer="setsid xdg-open"
    else
        let g:netrw_browsex_viewer="xdg-open"
    endif
endif

" Use tree style display of files in netrw.
let g:netrw_liststyle = 3

" Remove netrw banner.
let g:netrw_banner = 0
"
" Configure tags and cscope.
set tags=./tags;
set cscoperelative
autocmd BufWinEnter * call LoadCscope()
function! LoadCscope()
    let db = findfile('cscope.out', '.;')
    if !empty(db)
        " cscope_maps.vim sets cscopeverbose which causes the following
        " error on every buffer change: E568: duplicate cscope database
        " not added. Suppress such error by resetting this option.
        set nocscopeverbose
        execute "cscope add " . db
        " Set this option again after adding cscope database.
        set cscopeverbose
    endif
endfunction


" Autocommands
" ============
autocmd BufNewFile,BufRead *.md,*.txt set filetype=markdown
autocmd BufNewFile,BufRead *.js,*.json set tabstop=2
autocmd BufNewFile,BufRead *.go,Makefile setlocal tabstop=8 noexpandtab


" Syntax Highlighting
" ===================
" Highlight TODO in any file.
autocmd BufWinEnter * syntax keyword Todo TODO

" Highlight trailing whitespace as error.
autocmd BufWinEnter * syntax match Error /\s\+$/


" Key mappings
" ============
" Replacment for :b that lists buffers.
nnoremap ;b :ls<CR>:b<Space>

" Delete current buffer while preserving the window.
nnoremap ;d :bp \| confirm bd #<CR>

" Show very long lines.
nnoremap ;l :set list colorcolumn=72,76,80 \| /^.\{81\}<CR>

" Remove trailing spaces.
nnoremap ;s :%s/\s\+$//c<CR>

" Write buffer.
nnoremap ;w :w<CR>

" Clear visual artifacts due to other commands.
nnoremap ;c :set colorcolumn& nohlsearch nolist<CR>

" Edit common files.
nnoremap ;ev :e ~/.vimrc<CR>
nnoremap ;ep :e ~/.plugins.vimrc<CR>


" Note: In the commands below, bp is used instead of b# to preserve the
" current window. b# fails with "E86: Buffer 2 does not exist" when
" alternate-file does not exist, e.g., just after an unnamed buffer is
" written to a file. This causes :Rm to fail with "E516: No buffers were
" deleted: bd #".


" Commands
" ========
" :Rm -- Remove current file.
command! Rm bp | bd! # | call delete(expand('#'))

" :Mv {file} -- Rename current file.
command! -nargs=1 Mv saveas <args> | bd! # | call delete(expand('#'))

" :Wide :Wider :Widest -- Different window sizes.
command! Wide vertical resize 78
command! Wider vertical resize 86
command! Widest vertical resize 126


" Additional Configuration
" ========================
" Load and configure plugins.
if !empty(findfile('~/.plugins.vimrc'))
    source ~/.plugins.vimrc
endif

" Load private configuration.
if !empty(findfile('~/my/bin/my.vimrc'))
    source ~/my/bin/my.vimrc
endif
