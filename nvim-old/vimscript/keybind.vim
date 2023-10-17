
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-i': 'split',
  \ 'ctrl-v': 'vsplit' }

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
"nnoremap <C-f> :FZF<CR>
nnoremap <C-s> :Ag<CR>
nnoremap <C-f> :Files<CR>
nnoremap zz :update<cr>
nnoremap za :wa<cr>
nnoremap nn :tabn<cr>
nnoremap pp :tabp<cr>
nnoremap xa :wqa!<cr>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>

command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument
autocmd BufWritePre *.js,*.jsx,*.ts,*.tsx,*.css,*.scss,*.json,*.graphql,*.md,*.markdown,*.yaml,*.yml,*.html CocCommand prettier.formatFile


autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') && v:this_session == '' | NERDTree | endif
autocmd BufNewFile,BufRead *.hbs set filetype=html
autocmd TextChanged,TextChangedI <buffer> silent write!

