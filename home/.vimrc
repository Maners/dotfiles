" vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin()
if has('nvim')
  Plug 'nvim-treesitter/nvim-treesitter', {'do':  ':TSUpdate'}
  Plug 'MunifTanjim/nui.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'folke/trouble.nvim'
  Plug 'nvim-telescope/telescope.nvim'
endif
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-grepper'
Plug 'eshion/vim-sync'
Plug 'vim-airline/vim-airline'
Plug 'sainnhe/everforest'
Plug 'ruanyl/vim-gh-line'
"Plug 'SirVer/ultisnips'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" PHP Plugins
"Plug 'phpactor/phpactor', {'for': 'php', 'tag': '*', 'do': 'composer install --no-dev -o'} " LSP, refactoring etc
"Plug 'tobyS/vmustache' | Plug 'tobyS/pdv', {'for': 'php'} " Easy PHPDoc insertion

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

nnoremap <silent><Leader>nt :NERDTreeToggle<CR>
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

" pdv config
let g:pdv_template_dir = $HOME ."/.local/share/nvim/plugged/pdv/templates_snip"
autocmd FileType php nnoremap <C-p> :call pdv#DocumentWithSnip()<CR>

" <<< CoC Bindings Start

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

nmap <leader>rn <Plug>(coc-rename)
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Applying code actions to the selected code block
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying code actions at the cursor position
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
nmap <leader>as  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap keys for applying refactor code actions
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" Run the Code Lens action on the current line
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> to scroll float windows/popups
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges
" Requires 'textDocument/selectionRange' support of language server
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Mappings for CoCList
" Show all diagnostics
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<cr>
" Do default action for previous item
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<cr>
" Resume latest coc list
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<cr>

nnoremap <silent><nowait> <space>f  :<C-u>CocList files<cr>

" >>> Coc Bindings End

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
