if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'chriskempson/base16-vim'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-sleuth'
Plug 'pearofducks/ansible-vim'
call plug#end()

if filereadable(expand('~/.vimrc_background'))
  let base16colorspace=256
  source ~/.vimrc_background
else
  colorscheme base16-tomorrow-night
endif

if has('gui_running')
  set guifont=Hack\ 11
  let g:fzf_launcher='gnome-terminal -x bash -ic %s'
endif

autocmd BufWritePre *.lua %s/\s\+$//e

" Centralized backup and swap files
silent !mkdir -p ~/.vim/backup > /dev/null 2>&1
set backupdir=~/.vim/backup//
silent !mkdir -p ~/.vim/swap > /dev/null 2>&1
set directory=~/.vim/swap//

" Enable $ when changing content
set cpoptions+=$

set number
set splitbelow
set splitright
set hlsearch
set tabstop=2
set shiftwidth=2
set expandtab
set hidden
set colorcolumn=80
set listchars=tab:»-,trail:·,nbsp:%,eol:¶,extends:>,precedes:<
set nolist
set path+=**

" airline
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline#extensions#tabline#enabled = 1

" netrw
let g:netrw_banner = 0

let mapleader = "\<Space>"

" Files
nmap <Leader>pf :GFiles<CR>
nmap <Leader>ff :Files<CR>
nmap <Leader>fed :vs ~/.vimrc<CR>
autocmd BufWritePost .vimrc source $MYVIMRC
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

" Tabs
nmap <Leader>tn :tabnext<CR>
nmap <Leader>tp :tabprevious<CR>

" Windows
nmap <Leader>wd <C-W>c<CR>

" Comments
nmap <Leader>cl :Commentary<CR>
vmap <Leader>cl :Commentary<CR>

" Git
nmap <Leader>gs :Gstatus<CR>

" Terminal
if has('nvim')
  tnoremap <Esc> <C-\><C-n>
  au TermOpen * setlocal nonumber norelativenumber
endif

" Emacs mode in Insert mode
imap <C-A> <Esc>I
imap <C-E> <Esc>A
imap <C-B> <Left>
imap <C-F> <Right>
" imap <C-P> <Up>
" imap <C-N> <Down>
imap <C-D> <Del>
inoremap <S-Tab> <C-D>
