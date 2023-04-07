" vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin()

if has('nvim')
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
endif
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-grepper'
Plug 'eshion/vim-sync'
Plug 'vim-airline/vim-airline'
Plug 'sainnhe/everforest'
Plug 'ruanyl/vim-gh-line'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" PHP Plugins
Plug 'phpactor/phpactor', {'for': 'php', 'tag': '*', 'do': 'composer install --no-dev -o'} " LSP, refactoring etc

call plug#end()

" Enable syntax higlighting
syntax enable

" Setup color scheme
if has('termguicolors')
    set termguicolors
endif
set background=dark
let g:everforest_better_performance = 1
let g:everforest_background = 'soft'
colorscheme everforest

if has('gui_running')
    set guifont=Inconsolata\ Medium\ 12
endif

" Other editor settings
se nu " line numbers
set backspace=2 " make backspace work like most other apps
set cul " Turn on highlighting of current line
set exrc " per directory .vimrc
set secure " disbale unsafe in local .vimrc

" Set tabs - use tabs 4 columns wide
set softtabstop=4
set shiftwidth=4
set tabstop=4
set smartindent
set expandtab

" Deal with Windows newline
match Ignore /\r$/

" Support continuation of multilne comments on newline
set formatoptions+=or

" Support ctags file in .git
set tags+=.git/tags

" Set leader key to ,
let mapleader=","

" Airline setup
set laststatus=2
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1

" Split window handling - highlight current line in active window
augroup BgHighlight
	autocmd!
	autocmd WinEnter * set cul
	autocmd WinLeave * set nocul
augroup END

" Keyborad bindings
imap jj <Esc>

nnoremap <silent><Leader>f :NERDTreeToggle<CR>
inoremap <C-Space> <C-x><C-o>
nnoremap <Leader>* :Grepper -tool git -open -switch -cword -noprompt -grepprg git grep -nI
vnoremap <Leader>m :s/\s*\\$/\=repeat(' ', 80-col('.')).'\'

vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

nnoremap <leader>l :setlocal spell spelllang=en_us<CR>

augroup PhpactorMappings
    au!
    au FileType php nmap <buffer> <Leader>e :PhpactorClassExpand<CR>
    au FileType php nmap <buffer> <Leader>ua :PhpactorImportMissingClasses<CR>
    au FileType php nmap <buffer> <Leader>mm :PhpactorContextMenu<CR>
    au FileType php nmap <buffer> <Leader>nn :PhpactorNavigate<CR>
    au FileType php nmap <buffer> <Leader>tt :PhpactorTransform<CR>
    au FileType php nmap <buffer> <Leader>ci :PhpactorClassInflect<CR>
    au FileType php nmap <buffer> <Leader>mf :PhpactorMoveFile<CR>
    au FileType php nmap <buffer> <Leader>cf :PhpactorCopyFile<CR>
augroup END

" Highlits trailing white space
highlight ExtraWhitespace ctermbg=darkgreen guibg=lightgreen
nnoremap <silent><Leader>hw :match ExtraWhitespace /\s\+$/<CR>
