" Load plugins.
set runtimepath^=~/.vim/bundle/cscope_maps
set runtimepath^=~/.vim/bundle/tagbar
set runtimepath^=~/.vim/bundle/slimv

" Prevent Slimv from executing: filetype plugin on
let g:paredit_disable_ftindent=1

" Tagbar configuration to support Go source code.
let g:tagbar_type_go = {'ctagstype': 'go', 'ctagsbin': 'gotags',
    \ 'ctagsargs' : '-sort -silent', 'sro' : '.',
    \ 'kind2scope' : {'t' : 'ctype', 'n' : 'ntype'},
    \ 'scope2kind' : {'ctype' : 't', 'ntype' : 'n'},
    \ 'kinds': ['p:package', 'i:imports:1', 'c:constants', 'v:variables',
              \ 't:types', 'n:interfaces', 'w:fields', 'e:embedded',
              \ 'm:methods', 'r:constructor', 'f:functions' ]}

" Open Tagbar automatically for supported files.
" autocmd BufEnter * call tagbar#autoopen(0)

" Open and jump to Tagbar window such that it closes on tag selection.
nnoremap ,t :TagbarOpenAutoClose<CR>
