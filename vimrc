if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sensible'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'chriskempson/base16-vim'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'vim-scripts/SyntaxRange'
call plug#end()

colorscheme base16-tomorrow-night

autocmd BufWritePre *.lua %s/\s\+$//e

set number
set splitbelow
set splitright
set hlsearch
set tabstop=2
set shiftwidth=2
set expandtab
set hidden
set colorcolumn=80
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline#extensions#tabline#enabled = 1

let mapleader = "\<Space>"

" Files
nmap <Leader>pf :GFiles<CR>
nmap <Leader>ff :Files<CR>
nmap <Leader>fed :vs ~/.vimrc<CR>
nmap <Leader>feR :source ~/.vimrc<CR>

" Search
nmap <silent> <Leader>sc :let @/=""<CR><C-L>
nmap <Leader>/ :Ag <C-R>=expand("<cword>")<CR><CR>
vmap <Leader>/ y:Ag <C-R>"<CR>

" Buffers
nmap <Leader>bd :bd<CR>
nmap <Leader>bb :Buffers<CR>
nmap <Leader>bn :bn<CR>
nmap <Leader>bp :bp<CR>
nmap <Leader><Tab> <C-^>

" Windows
nmap <Leader>wd <C-W>c<CR>

" Comments
nmap <Leader>cl :Commentary<CR>
vmap <Leader>cl :Commentary<CR>

" Git
nmap <Leader>gs :Gstatus<CR>

" Emacs mode in Insert mode
imap <C-A> <Esc>I
imap <C-E> <Esc>A
imap <C-B> <Left>
imap <C-F> <Right>
" imap <C-P> <Up>
" imap <C-N> <Down>
imap <C-D> <Del>
inoremap <S-Tab> <C-D>
