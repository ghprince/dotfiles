" bye bye old good vi
set nocompatible

" vim-plug
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
Plug 'gcmt/taboo.vim'
Plug 'chriskempson/base16-vim'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-sleuth'
Plug 'pearofducks/ansible-vim'
Plug 'Asheq/close-buffers.vim'
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
" set splitbelow
" set splitright
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
let g:airline#extensions#tabline#show_buffers = 0

" taboo
let g:taboo_tab_format = " %f%m(%P) "
let g:taboo_renamed_tab_format = " [%l]%m(%P) "

" netrw
let g:netrw_banner = 0

let mapleader = "\<Space>"

" Files
nnoremap <Leader>pf :GFiles<CR>
nnoremap <Leader>ff :Files<CR>
nnoremap <Leader>fed :vs ~/.vimrc<CR>
"autocmd BufWritePost .vimrc source $MYVIMRC
nnoremap <Leader>feR :source ~/.vimrc<CR>
nnoremap <Leader>cd :cd %:p:h<CR>:pwd<CR>

" Search
nnoremap <silent> <Leader>sc :let @/=""<CR><C-L>
nnoremap <Leader>/ :Ag <C-R>=expand("<cword>")<CR><CR>
vnoremap <Leader>/ y:Ag <C-R>"<CR>

" Buffers
nnoremap <Leader>bd :bd<CR>
nnoremap <Leader>bb :Buffers<CR>
nnoremap <Leader>bn :bn<CR>
nnoremap <Leader>bp :bp<CR>
nnoremap <Leader>bq :CloseBuffersMenu<CR>
nnoremap <Leader><Tab> <C-^>

" Tabs
nnoremap <Leader>tn :tabnext<CR>
nnoremap <Leader>tp :tabprevious<CR>

" Windows
nnoremap <Leader>wd <C-W>c<CR>
nnoremap <Left> :vertical resize -1<CR>
nnoremap <Right> :vertical resize +1<CR>
nnoremap <Up> :resize -1<CR>
nnoremap <Down> :resize +1<CR>

" Comments
nnoremap <Leader>cl :Commentary<CR>
vnoremap <Leader>cl :Commentary<CR>

" Git
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gg :GitGutter<CR>

" Terminal
if has('nvim')
  tnoremap <Esc> <C-\><C-n>
  tnoremap <C-v><Esc> <Esc>
  au TermOpen * setlocal nonumber norelativenumber
endif

" Emacs mode in Insert mode
inoremap <C-A> <Esc>I
inoremap <C-E> <Esc>A
inoremap <C-B> <Left>
inoremap <C-F> <Right>
" inoremap <C-P> <Up>
" inoremap <C-N> <Down>
inoremap <C-D> <Del>
inoremap <S-Tab> <C-D>
