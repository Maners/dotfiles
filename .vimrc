" vim-plug
call plug#begin('~/.vim/plugged')

Plug 'abudden/taghighlight-automirror'
Plug 'Valloric/YouCompleteMe', {'do': './install.py --system-boost --clang-completer'}
Plug 'rdnetto/YCM-Generator', {'branch': 'stable'}
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'benekastah/neomake'
Plug 'tpope/vim-fugitive'

Plug 'SirVer/ultisnips' | Plug 'tobyS/vmustache' | Plug 'tobyS/pdv'

Plug 'shawncplus/phpcomplete.vim'
Plug 'StanAngeloff/php.vim'
Plug 'evidens/vim-twig'
Plug 'arnaud-lb/vim-php-namespace'
Plug 'docteurklein/php-getter-setter.vim'

Plug 'eshion/vim-sync'


Plug '~/.vim/custom/molokai.colorscheme'
Plug 'mhinz/vim-grepper'

call plug#end()

" Enable syntax higlighting
syntax enable

if has('gui_running')
    set guifont=Inconsolata\ Medium\ 11
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

" Support continuation of multilne comments on newline
set formatoptions+=or

" Support ctags file in .git
set tags+=.git/tags

" Set leader key to ,
let mapleader=","

" Setup color scheme
set t_Co=256
colors molokai

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
nnoremap <Leader>* :Grepper -tool ag -cword -noprompt -grepprg ag --vimgrep -G '^.+\.*'

map <Leader><F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>


" Autocommands
autocmd FileType php set omnifunc=phpcomplete#CompletePHP " for PHP

" YouCompleteMe
let g:ycm_confirm_extra_conf = 0
let g:ycm_global_ycm_extra_conf = $HOME . "/.vim/ycm_extra_conf.py"
let g:ycm_extra_conf_vim_data = ['&filetype']
let g:ycm_seed_identifiers_with_syntax = 1

" for PHP Documenter plugin
let g:pdv_template_dir = $HOME . "/.vim/plugged/pdv/templates_snip"
autocmd FileType php nnoremap <C-p> :call pdv#DocumentWithSnip()<CR>
autocmd FileType php call SetPhpCTagsSyntax()
autocmd FileType php inoremap <Leader>u <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>u :call PhpInsertUse()<CR>

" Highlits trailing white space
highlight ExtraWhitespace ctermbg=darkgreen guibg=lightgreen
nnoremap <silent><Leader>hw :match ExtraWhitespace /\s\+$/<CR>

" Highlight group correction for PHP
highlight link phpMethodsVar Identifier
highlight link phpDocTags Tag
highlight link phpDocParam Type
highlight link phpInterfaces Special

" Neomake
let g:neomake_php_phpcs_args_standard="PSR2"
autocmd! BufWritePost * Neomake

function SetPhpCTagsSyntax()
	syn cluster phpClTop add=CTagsFunction,CTagsClass,CTagsInterface,CTagsGlobalConstant,CTagsGlobalVariable,CTagsNamespace
	syn cluster phpClConst remove=phpMethodsVar
endfunction

function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
