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

" Set tabs - use tabs 2 columns wide
" set expandtab
set softtabstop=2
set shiftwidth=2
set tabstop=2
set smartindent

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
imap jj <Esc> " Map jj to exit insert mode
nnoremap <silent><Leader><C-]> <C-w><C-]><C-w>T " Map \C-] to open reference in new tab

" Sets C-Space to invoke autocomplete
inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
\ "\<lt>C-n>" :
\ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
\ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
\ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
imap <C-@> <C-Space>
nmap <F3> :vimgrep /<C-R><C-W>/j **/*.php

" Buffer handling
set switchbuf+=usetab,newtab " use tabs when switching buffers

" SuperRetab
command! -nargs=1 -range SuperRetab <line1>,<line2>s/\v%(^ *)@<= {<args>}/\t/g

" Autocommands 
autocmd FileType php set omnifunc=phpcomplete#CompletePHP " for PHP

" for PHP Documenter plugin
let g:pdv_template_dir = $HOME . "/.vim/bundle/pdv/templates_snip"
autocmd FileType php nnoremap <C-p> :call pdv#DocumentWithSnip()<CR>
