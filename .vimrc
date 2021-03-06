" vim-plug
call plug#begin('~/.vim/plugged')

Plug 'abudden/taghighlight-automirror'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'scrooloose/nerdtree'
Plug 'benekastah/neomake'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-grepper'
Plug 'eshion/vim-sync'
Plug 'navicore/vissort.vim'
Plug 'vim-airline/vim-airline'
Plug 'icymind/NeoSolarized'
Plug 'SirVer/ultisnips' | Plug 'tobyS/vmustache' | Plug 'tobyS/pdv'
Plug 'vim-scripts/DoxygenToolkit.vim'
Plug 'vim-scripts/spec.vim'
Plug 'majutsushi/tagbar'

" PHP plugins
Plug 'StanAngeloff/php.vim'
Plug 'evidens/vim-twig'
Plug 'arnaud-lb/vim-php-namespace'
Plug 'docteurklein/php-getter-setter.vim'
Plug 'joonty/vdebug'
Plug 'shawncplus/phpcomplete.vim'

" C
Plug 'Shougo/deoplete-clangx'

" Rust
Plug 'rust-lang/rust.vim'
if has('nvim')
    Plug 'sebastianmarkow/deoplete-rust'
endif

" Java
Plug 'artur-shaik/vim-javacomplete2'

call plug#end()

" Enable syntax higlighting
syntax enable

if has('nvim')
    set mouse=a
    set termguicolors
endif

" Setup color scheme
set background=dark
colorscheme NeoSolarized

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

nnoremap <Leader>t :CtrlPTag<CR>
nnoremap <Leader>p :CtrlP<CR>
nnoremap <silent><Leader>b :TagbarToggle<CR>
nnoremap <silent><Leader>f :NERDTreeToggle<CR>
inoremap <C-Space> <C-x><C-o>
nnoremap <Leader>* :Grepper -tool git -open -switch -cword -noprompt -grepprg git grep -nI
vnoremap <Leader>m :s/\s*\\$/\=repeat(' ', 80-col('.')).'\'

map <Leader><F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

nnoremap <leader>l :setlocal spell spelllang=en_us<CR>

" Deoplete
let g:deoplete#enable_at_startup = 1

" Deoplete Rust
if has('nvim')
    let g:deoplete#sources#rust#racer_binary = $HOME.'/.cargo/bin/racer'
    let g:deoplete#sources#rust#rust_source_path = $HOME.'/opt/rust-src/src'
endif

" Configure PHP plugins
let g:pdv_template_dir = $HOME . "/.vim/plugged/pdv/templates_snip"
let g:neomake_php_phpcs_args_standard = "PSR2"
let g:neomake_phpstan_level = "5"
let g:phpcomplete_parse_docblock_comments = 1
let g:php_namespace_sort_after_insert = 1
autocmd FileType php nnoremap <C-p> :call pdv#DocumentWithSnip()<CR>
autocmd FileType php call SetPhpCTagsSyntax()
autocmd FileType php inoremap <Leader>u <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>u :call PhpInsertUse()<CR>

" Java
autocmd FileType java setlocal omnifunc=javacomplete#Complete

" Highlits trailing white space
highlight ExtraWhitespace ctermbg=darkgreen guibg=lightgreen
nnoremap <silent><Leader>hw :match ExtraWhitespace /\s\+$/<CR>

" Highlight group correction for PHP
highlight link phpMethodsVar Identifier
highlight link phpDocTags Tag
highlight link phpDocParam Type
highlight link phpInterfaces Special

" Neomake
autocmd! BufWritePost * Neomake

" Auto-close preview window after completion done
autocmd CompleteDone * pclose

" PHP Functions
function SetPhpCTagsSyntax()
	syn cluster phpClTop add=CTagsFunction,CTagsClass,CTagsInterface,CTagsGlobalConstant,CTagsGlobalVariable,CTagsNamespace
	syn cluster phpClConst remove=phpMethodsVar
endfunction

function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
