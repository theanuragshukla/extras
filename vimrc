call plug#begin('~/.vim/plugged')
Plug 'mattn/emmet-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
call plug#end()
let g:user_emmet_leader_key=','

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set splitbelow
set splitright

nnoremap zz :update<cr>
nnoremap za :wa<cr>
nnoremap nn :tabn<cr>
nnoremap pp :tabp<cr>
nnoremap xa :wqa!<cr>

nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') && v:this_session == '' | NERDTree | endif

filetype indent on
set filetype=html
set smartindent
set encoding=utf-8
set nu
set ts=4 sw=4
autocmd BufNewFile,BufRead *.hbs set filetype=html
autocmd TextChanged,TextChangedI <buffer> silent write
