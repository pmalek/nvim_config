set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin('~/.config/nvim/plugged/')

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive'

" Golang Plugins
Plug 'fatih/vim-go'

" vim-airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'

Plug 'Shougo/deoplete.nvim'
Plug 'zchee/deoplete-jedi'
Plug 'davidhalter/jedi'

Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'

Plug 'kien/ctrlp.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'Valloric/YouCompleteMe'
Plug 'airblade/vim-gitgutter'
Plug 'jiangmiao/auto-pairs'
Plug 'rhysd/vim-clang-format'
Plug 'Yggdroot/indentLine'
call plug#end()

filetype plugin indent on    " required
syntax enable

" solarized
let g:solarized_termtrans=1
let g:solarized_termcolors=256
colorscheme solarized
set background=dark

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='powerlineish'
let g:Powerline_symbols='fancy'

" Golang
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>e <Plug>(go-rename)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
" format with goimports instead of gofmt
let g:go_fmt_command = "goimports"
let g:go_list_type = "quickfix"

" general config
set incsearch
set number
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab
set hls
set timeoutlen=400
set ttimeoutlen=400
set backspace=2
set clipboard=unnamed
set list
set cursorline
set updatetime=200

" deoplete
let g:deoplete#enable_at_startup = 1

" YouCompleteMe
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0 " prevent confirmation for loading .ycm_extra_conf.py
let g:ycm_always_populate_location_list = 1
let g:ycm_autoclose_preview_window_after_completion = 1

" ultisnips
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" ctrl-l for snippet expand...
let g:UltiSnipsExpandTrigger="<c-l>"
" ... and ctrl-m to jump forward inside it between placeholders
let g:UltiSnipsJumpForwardTrigger="<c-m>"
" or ctrl-z to jump backwards
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" nerd tools
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
map <C-n> :NERDTreeToggle<CR>

" key bindings
" for moving around between splits...
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" misc
nnoremap <F6> <Esc>:silent! %s/\s\+$//<CR>

" clang-format
let g:clang_format#style_options = {
            \ "AccessModifierOffset" : -2,
            \ "AlignTrailingComments" : "true",
            \ "AlignAfterOpenBracket" : "true",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "AllowShortFunctionsOnASingleLine" : "Inline",
            \ "AllowShortIfStatementsOnASingleLine" : "true",
            \ "BreakBeforeBraces" : "Allman",
            \ "BinPackParameters" : "false",
            \ "SpaceBeforeParens" : "Never",
            \ "Standard" : "C++11",
            \ "ColumnLimit" : 100,
            \ "UseTab" : "Never" }
autocmd FileType c,cpp nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp vnoremap <buffer><Leader>cf :ClangFormat<CR>
autocmd FileType c,cpp nnoremap <buffer><F9> :<C-u>ClangFormat<CR>
autocmd FileType c,cpp vnoremap <buffer><F9> :ClangFormat<CR>

" gitgutter
let g:gitgutter_highlight_lines = 1
