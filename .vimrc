syntax on
colorscheme murphy
set textwidth=72
set tabstop=4
set shiftwidth=0
set expandtab
set autoindent
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
set guioptions=ic

autocmd BufNewFile,BufRead *.md,*.txt set filetype=markdown
autocmd BufNewFile,BufRead *.html,*.css,*.js,*.json,*.yml,*.yaml setlocal tabstop=2
autocmd BufNewFile,BufRead *.go,Makefile* setlocal tabstop=8 noexpandtab
autocmd BufWinEnter * syntax keyword Todo TODO
autocmd BufWinEnter * syntax match Error /\s\+$/

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

" Set window to full screen on macOS.
if has('gui_running') && has('gui_macvim')
    set fullscreen
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

" Workaround for https://github.com/vim/vim/issues/4738
nmap gx yiW:!open <cWORD><CR><CR>

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

" Extended commands.
nnoremap ;b :ls<CR>:b<Space>
nnoremap ;d :bp \| confirm bd #<CR>
nnoremap ;l :set list colorcolumn=72,76,80 \| /^.\{81\}<CR>
nnoremap ;s :%s/\s\+$//c<CR>
nnoremap ;c :set colorcolumn& nohlsearch nolist<CR>
nnoremap ;ev :e ~/.vimrc<CR>
nnoremap ;ep :e ~/.plugins.vimrc<CR>

command! Rm bp | bd! # | call delete(expand('#'))
command! -nargs=1 Mv saveas <args> | bd! # | call delete(expand('#'))
command! Wide vertical resize 78
command! Wider vertical resize 86
command! Widest vertical resize 126

" Load additional configurations.
if !empty(findfile('~/.plugins.vimrc'))
    source ~/.plugins.vimrc
endif
if !empty(findfile('~/my/bin/my.vimrc'))
    source ~/my/bin/my.vimrc
endif
