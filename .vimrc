" Pathogen
filetype off
call pathogen#infect()
call pathogen#helptags() " generate helptags for everything in runtimepath
filetype plugin on

" Enable syntax higlighting
syntax enable

" Other editor settings
se nu " line numbers
set backspace=2 " make backspace work like most other apps
set cul " Turn on highlighting of current line
set exrc " per directory .vimrc
set secure " disbale unsafe in local .vimrc

" Set tabs - use tabs 4 columns wide
" set expandtab
set softtabstop=4
set shiftwidth=4
set tabstop=4
set smartindent

" For easytags speed
set regexpengine=1

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
" Map jj to exit insert mode
imap jj <Esc>
" Map \C-] to open reference in new tab
nnoremap <silent><Leader><C-]> <C-w><C-]><C-w>T

nnoremap <Leader>. :CtrlPTag<CR>
nnoremap <silent><Leader>b :TagbarToggle<CR>
nnoremap <silent><Leader>f :NERDTreeToggle<CR>

inoremap <C-Space> <C-x><C-o>
" Map F3 to init vimgrep for current word in PHP files
nmap <F3> :noautocmd vimgrep /<C-R><C-W>/j **/*.php

map <Leader><F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>


" Autocommands
autocmd FileType php set omnifunc=phpcomplete#CompletePHP " for PHP

" for PHP Documenter plugin
let g:pdv_template_dir = $HOME . "/.vim/bundle/pdv.vim/templates_snip"
autocmd FileType php nnoremap <C-p> :call pdv#DocumentWithSnip()<CR>
autocmd FileType php call SetPhpCTagsSyntax()

" Highlits trailing white space
highlight ExtraWhitespace ctermbg=darkgreen guibg=lightgreen
nnoremap <silent><Leader>hw :match ExtraWhitespace /\s\+$/<CR>

" Highlight group correction for PHP
highlight link phpMethodsVar Identifier
highlight link phpDocTags Tag
highlight link phpDocParam Type
highlight link phpInterfaces Special

" Syntatic - set phpcs to PSR-2, turnoff design rule for phpmd
let g:syntastic_php_phpcs_args="--report=csv --standard=PSR2"

function SetPhpCTagsSyntax()
	syn cluster phpClTop add=CTagsFunction,CTagsClass,CTagsInterface,CTagsGlobalConstant,CTagsGlobalVariable,CTagsNamespace
	syn cluster phpClConst remove=phpMethodsVar
endfunction
