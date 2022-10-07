" set
autocmd TermEnter term://*toggleterm#*
      \ tnoremap <silent><c-c> <Cmd>exe v:count1 . "ToggleTerm"<CR>

" By applying the mappings this way you can pass a count to your
" mapping to open a specific window.
" For example: 2<C-t> will open terminal 2
nnoremap <silent><c-c> <Cmd>exe v:count1 . "ToggleTerm"<CR>
inoremap <silent><c-c> <Esc><Cmd>exe v:count1 . "ToggleTerm"<CR>
let g:rainbow_active = 1
colorscheme nord
set mouse=a
