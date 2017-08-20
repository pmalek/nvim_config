set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin('~/.config/nvim/plugged/')

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

" requires pip3 install --user neovim
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'zchee/deoplete-go', {'do' : 'make'}

Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'

Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }
Plug 'Valloric/ListToggle'

" ctrlp
Plug 'ctrlpvim/ctrlp.vim'
Plug 'FelikZ/ctrlp-py-matcher'

" fzf fuzzy search
Plug 'junegunn/fzf', { 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'altercation/vim-colors-solarized'
Plug 'airblade/vim-gitgutter'
Plug 'jiangmiao/auto-pairs'
Plug 'rhysd/vim-clang-format'
Plug 'majutsushi/tagbar'
Plug 'mileszs/ack.vim'
Plug 'pmalek/toogle-maximize.vim'
Plug 'mhinz/vim-startify'
Plug 'vim-scripts/a.vim'
Plug 'b4winckler/vim-angry'
Plug 'Chiel92/vim-autoformat'
Plug 'morhetz/gruvbox'
Plug 'neomake/neomake'
call plug#end()

filetype plugin indent on    " required
syntax enable

" solarized
"let g:solarized_termtrans=1
"let g:solarized_termcolors=256
"colorscheme solarized
"set termguicolors
set background=dark
let g:gruvbox_contrast_dark="hard"
let g:gruvbox_invert_selection=0
let g:gruvbox_vert_split='dark0_hard'
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set t_8f=[38;2;%lu;%lu;%lum
set t_8b=[48;2;%lu;%lu;%lum
colorscheme gruvbox
let mapleader = ","

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
au FileType go nmap <Leader>dd <Plug>(go-def)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <Leader>i <Plug>(go-info)
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_auto_sameids = 1
let g:go_auto_type_info = 1
let g:go_updatetime = 300
" format with goimports instead of gofmt
let g:go_fmt_command = "goimports"
"let g:go_list_type = "quickfix"
autocmd FileType go :call deoplete#disable() " currently we use deoplete only for Python

" Syntastic
let g:syntastic_go_checkers = ["go", "goimports", "golint", "govet"]
"let g:syntastic_aggregate_errors = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_enable_signs = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_enable_highlighting = 1
let g:syntastic_python_pylint_args = '-d C0103'
let g:syntastic_mode_map = {
    \ "mode": "active",
    \ "passive_filetypes": ["python"] }
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" general config
set incsearch
set number
set hls
" https://stackoverflow.com/questions/4559896/how-to-tab-backwards-remove-a-tab-or-tab-spaces-in-vim
set tabstop=2 softtabstop=-1 shiftwidth=0 expandtab
set timeoutlen=400
set ttimeoutlen=400
set backspace=2
set clipboard=unnamed
set list
set listchars=tab:»\ ,trail:\~
autocmd FileType go set nolist
set cursorline
set updatetime=200
set wildignore=*.swp,*.bak,*.pyc,*.class,*.pdf,*.o,*.so,*.a,*.jar,*.mp3,*.mp4,*.m4a,*.pptx,*.vdi,*.img
" improve redraw performance
" http://eduncan911.com/software/fix-slow-scrolling-in-vim-and-neovim.html
set lazyredraw

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
let g:NERDTreeQuitOnOpen= 1
map <C-n> :NERDTreeToggle<CR>

" key bindings
" for moving around between splits...
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" misc
" get rid of trailing whitespaces
nnoremap <F6> <Esc>:silent! %s/\s\+$//<CR>
" map ; to :
nnoremap ; :
nnoremap _ :tabp<CR>
nnoremap + :tabn<CR>
inoremap kj <Esc>
cnoremap kj <Esc>

" reload init.vim
nnoremap <Leader>rv :source ~/.config/nvim/init.vim<CR>

autocmd FileType python nnoremap <Leader>a :YcmCompleter GoTo<CR>
autocmd FileType python nnoremap <Leader>s *:YcmCompleter GoToReferences<CR>

autocmd FileType cpp :call deoplete#disable() " it fights with YouCompleteMe's popups

autocmd FileType cpp nnoremap <Leader>a :YcmCompleter GoTo<CR>
autocmd FileType cpp nnoremap <Leader>s :YcmCompleter GoToDeclaration<CR>
autocmd FileType cpp nnoremap <Leader>d :YcmCompleter GoToDefinition<CR>
autocmd FileType cpp nnoremap <Leader>t :YcmCompleter GetType<CR>

" clang-format
let g:clang_format#style_options = {
            \ "PointerAlignment" : "Left",
            \ "BinPackArguments" : "false",
            \ "BinPackParameters" : "false",
            \ "AccessModifierOffset" : -2,
            \ "AlignTrailingComments" : "true",
            \ "AlignAfterOpenBracket" : "Align",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "AllowShortFunctionsOnASingleLine" : "Inline",
            \ "AllowShortIfStatementsOnASingleLine" : "true",
            \ "BreakBeforeBraces" : "Allman",
            \ "SpaceBeforeParens" : "Never",
            \ "Standard" : "C++11",
            \ "ColumnLimit" : 110,
            \ "BreakConstructorInitializersBeforeComma" : "true",
            \ "ConstructorInitializerAllOnOneLineOrOnePerLine" : "true",
            \ "Cpp11BracedListStyle" : "true",
            \ "SpacesInAngles" : "false",
            \ "SpacesBeforeTrailingComments" : 1,
            \ "UseTab" : "Never" }
autocmd FileType c,cpp nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp vnoremap <buffer><Leader>cf :ClangFormat<CR>
autocmd FileType c,cpp nnoremap <buffer><F9> :<C-u>ClangFormat<CR>
autocmd FileType c,cpp vnoremap <buffer><F9> :ClangFormat<CR>

" gitgutter
let g:gitgutter_highlight_lines = 1
let g:gitgutter_enabled = 0 " Enable with <Leader>g if needed
nmap <Leader>g :GitGutterToggle<CR>

" tagbar
let g:tagbar_width = 60
let g:tagbar_sort = 0
let g:tagbar_indent = 2
let g:tagbar_show_linenumbers = -1
nmap <F8> :TagbarToggle<CR>
" prevent cursorline and cursorcolumn from showing up which slows down at hogs down CPU
autocmd FileType tagbar setlocal nocursorline nocursorcolumn

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
cnoreabbrev Ack Ack!
cnoreabbrev ack Ack!
noremap <Leader>f <Esc>bvey:Ack! <C-R>"<CR>

nmap <silent> <S-m> :call ToggleMaximizeCurrentWindow()<CR>

" ctrlp
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
let g:ctrlp_lazy_update = 50
let g:ctrlp_regexp = 1
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(swp|exe|so|dll|zip|gz|gzip|a|tar|png|jpg|jpeg|jar|pyc|class)$',
  \ }

" Python
autocmd FileType python :call deoplete#enable() " currently we use deoplete only for Python
autocmd FileType python nnoremap <Leader>a :YcmCompleter GoTo<CR>
autocmd FileType python nnoremap <Leader>s *:YcmCompleter GoToReferences<CR>
au! BufWritePre *.py :Autoformat
au! BufWritePost *.py :Neomake
let g:neomake_python_enabled_makers = ["pylint"]
let g:neomake_open_list = 2
" alacritty doesn't support unicode :( ... yet
let g:neomake_error_sign = { 'text': 'E>', 'texthl': 'ErrorMsg' }
let g:neomake_warning_sign = { 'text': 'W>', 'texthl': 'NeomakeWarningSign' }
let g:neomake_message_sign = { 'text': 'I>', 'texthl': 'NeomakeMessageSign'}
