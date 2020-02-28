syntax enable                                             " enable syntax highlighting
syntax on

set foldlevel=0
set foldlevelstart=1
set foldmethod=indent " other option is 'syntax'
set foldnestmax=7

set colorcolumn=0  " disable color column for now
set cursorline                                            " highlight current line
set expandtab
set nobackup
set noswapfile
set nowrap                                                " no word-wrap
set nowritebackup
set ruler                                                 " show the cursor position all the time
set softtabstop=2                                         " insert mode tab and backspace use 2 spaces

colorscheme gruvbox

" ensure ftdetect et al work by including this after the Vundle stuff
filetype plugin indent on
filetype plugin on

set autoindent
set autoread
set autowrite                                               " Automatically :write before running commands
set backspace=2                                             " Fix broken backspace in some setups
set backupcopy=yes                                          " see :help crontab
set clipboard=unnamed                                       " yank and paste with the system clipboard
set directory-=.                                            " don't store swapfiles in the current directory
set encoding=utf-8
set expandtab                                               " expand tabs to spaces
set filetype=on                                             " without this vim emits a zero exit status, later, because of :ft off

set guifont="SF\ Mono:h18"
set history=50
set hlsearch                                                " highlight search
set ignorecase                                              " case-insensitive search
set incsearch                                               " do incremental searching
set laststatus=2                                            " always show statusline
set linespace=3
set nolist                                                  " don't show listchars by default
set listchars=eol:$,tab:>-,trail:▫,extends:>,precedes:<
set nocompatible                                            " don't bother with vi compatibility
set number                                                  " show line numbers
set numberwidth=6
set relativenumber
set ruler                                                   " show where you are
set scrolloff=3                                             " show context above/below cursorline
set shiftwidth=2                                            " normal mode indentation commands use 2 spaces
set showcmd                                                 " display incomplete commands
set smartcase                                               " case-sensitive search if any caps
set t_Co=256
set tabstop=8                                               " actual tabs occupy 8 characters
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
set wildmenu                                                " show a navigable menu for tab completion
set wildmode=longest,list,full

set rtp+=~/.vim/bundle/vundle.vim  " configure Vundle
set rtp+=/usr/local/opt/fzf   " use fzf (installed via homebrew)

source ~/.vimrc.bundles
source ~/.vimrc.local

Glaive codefmt plugin[mappings]
Glaive codefmt clang_format_style="google"

" autoformat
" map <c-f> :call JsonBeautify()<cr>

" run auto-formatting on save
augroup autoformat_settings
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType c,cpp,proto,javascript AutoFormatBuffer clang-format
  autocmd FileType dart AutoFormatBuffer dartfmt
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType gn AutoFormatBuffer gn
  autocmd FileType html,css,sass,scss,less AutoFormatBuffer js-beautify
  autocmd FileType json AutoFormatBuffer js-beautify
  autocmd FileType java AutoFormatBuffer google-java-format
  autocmd FileType python AutoFormatBuffer yapf
augroup END

let g:deoplete#enable_at_startup = 1

" airline settings
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline_theme='tomorrow'

" whitespace preference
autocmd Filetype go setlocal ts=4 sts=4 sw=4
autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript setlocal ts=4 sts=4 sw=4
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2

" foldsetting preference
autocmd Syntax c,cpp,vim,go,json,javascript,ruby,xml,html,xhtml,perl normal zM
" ack settings
"if executable('ag')
"  let g:ackprg = 'ag --vimgrep'
"endif

let g:ack_default_options = ' -s -H --nocolor --nogroup --column --smart-case --follow'

" will use completion if not at beginning
set wildmode=list:longest,list:full

" Exclude Javascript files in :Rtags via rails.vim due to warnings when parsing
let g:Tlist_Ctags_Cmd="ctags --exclude='*.js'"

" remap mw to <leader>w in insert mode
nnoremap mw :w<CR>

" Index ctags from any project, including those outside Rails
map <Leader>ct :!ctags -R .<CR>

" Switch between the last two files
nnoremap <Leader><Leader> <c-^>

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Quicker window movement
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" configure syntastic syntax checking to check on open as well as save
let g:syntastic_check_on_open=1
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]

" dictionary for spelling
set spell
set spelllang=en_us
set spellfile=$HOME/.vim-spell-en.utf-8.add

" Autocomplete with dictionary words when spell check is on
set complete+=kspell

" diff mode settings
" au FilterWritePre * if &diff | colorscheme github | endif
" if &diff | colorscheme github | set diffopt+=iwhite | set diffopt+=vertical | endif
" au BufEnter,BufNew * if &diff | colorscheme github |  else | colorscheme gruvbox | endif

" command GdiffInTab tabedit %|Gvdiff
" command Gw set diffopt+=iwhite

if &diff
  colorscheme github
  set diffopt+=iwhite
  set diffopt+=vertical
  set guifont="SF\ Mono:h24"
  set nowrap
endif

" general key maps
let mapleader = ','

" Two semicolons for maps to escape
imap ;; <Esc>

nnoremap <Leader><space> :call whitespace#strip_trailing()<CR>

" silver searcher, ack
nnoremap <Leader>tt :TagbarOpenAutoClose<CR>
" nnoremap tc :TagbarSetFoldlevel 0<CR>
"  nnoremap to :TagbarSetFoldlevel 10<CR>

nnoremap <Leader>a :Ag<space>
nnoremap <Leader>b :CtrlPBuffer<CR>
nnoremap <Leader>d :NERDTreeToggle<CR>
nnoremap <Leader>f :NERDTreeFind<CR>
nnoremap <Leader>g :GitGutterToggle<CR>
nnoremap <Leader>gg :GdiffInTab <CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>t :CtrlP<CR>
nnoremap <Leader>T :CtrlPClearCache<CR>:CtrlP<CR>

noremap <Leader>l :Align

" keymap for quick window
nnoremap <C-B> :cnext<CR>
nnoremap <C-M> :cprevious<CR>
nnoremap <C-a>a :cclose<CR>

" keymap for buffer navigation
nnoremap <C-b><C-l> :bnext<CR>
nnoremap <C-b><C-h> :bprevious<CR>

" map go to definition
autocmd FileType go nmap <g-d> <C-]>
autocmd FileType go nmap <g-b> <C-o>

" strip any trailing white-spaces for certain types of files
autocmd FileType c,cpp,exs,java,php,yaml,go,json,yml,txt autocmd BufWritePre <buffer> %s/\s\+$//e

" go specific key maps
autocmd FileType go nmap <Leader>b <Plug>(go-build)
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
autocmd FileType go nmap <Leader>r <Plug>(go-run)
autocmd FileType go nmap <Leader>rn <Plug>(GoRename)
autocmd FileType go nmap <Leader>t <Plug>(go-test)

" cusorline behavior
autocmd BufEnter * set cursorline
autocmd BufLeave * set nocursorline

" remove trailing whitespaces before saving
autocmd BufWritePre * %s/\s\+$//e

" vim-go specific settings
let g:go_def_mode='gopls'
let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_types = 1
let g:go_info_mode='gopls'

" Ack
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>

" silversearcher
" keymap for silversearcher
" ?    a quick summary of these keys, repeat to close
" o    to open (same as Enter)
" O    to open and close the quickfix window
" go   to preview file, keeping focus on the results
" t    to open in new tab
" T    to open in new tab, keeping focus on the results
" h    to open in horizontal split
" H    to open in horizontal split, keeping focus on the results
" v    to open in vertical split
" gv   to open in vertical split, keeping focus on the results
" q    to close the quickfix window


" plugin settings
let g:ctrlp_match_window = 'order:ttb,max:20'

" neocomplete
set completeopt+=noinsert

" deoplete.nvim recommend
set completeopt+=noselect

" Path to python interpreter for neovim
let g:python3_host_prog  = '/usr/local/bin/python3'

" Skip the check of neovim module
let g:python3_host_skip_check = 1

" Run deoplete.nvim automatically
let g:deoplete#enable_at_startup = 1

" deoplete-go settings
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']


" let g:acp_enableAtStartup = 0 " Disable AutoComplPop.
" I"|let g:neocomplete#auto_completion_start_length=1
" let g:neocomplete#enable_at_startup = 1
" let g:neocomplete#enable_smart_case = 1
" // let g:neocomplete#sources#syntax#min_keyword_length = 1
" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" <C-h>, <BS>: close popup and delete backword char.
" inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()

let g:NERDSpaceDelims=1
let g:NERDTreeShowHidden=1
let g:gitgutter_enabled = 1

" tagbar settings
let g:TagbarSetFoldlevel=1

" neocomplete
" use goimports for formatting
let g:go_fmt_command = "goimports"

" turn highlighting on
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:syntastic_go_checkers = ['go', 'golint', 'errcheck']
let g:syntastic_cloudformation_checkers = ['cfn_lint']

" Open go doc in vertical window, horizontal, or tab
au Filetype go nnoremap <leader>v :vsp <CR>:exe "GoDef" <CR>
au Filetype go nnoremap <leader>s :sp <CR>:exe "GoDef"<CR>
au Filetype go nnoremap <leader>t :tab split <CR>:exe "GoDef"<CR>
" gotags support
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

" Add support for markdown files in tagbar.
let g:tagbar_type_markdown = {
    \ 'ctagstype': 'markdown',
    \ 'ctagsbin' : '/Users/spoddar/Library/Python/2.7/lib/python/site-packages/markdown2ctags.py',
    \ 'ctagsargs' : '-f - --sort=yes --sro=»',
    \ 'kinds' : [
        \ 's:sections',
        \ 'i:images'
    \ ],
    \ 'sro' : '»',
    \ 'kind2scope' : {
        \ 's' : 'section',
    \ },
    \ 'sort': 0,
\ }

" Goyo

let g:goyo_width = 80 " Leave a few extra chars more than textwidth
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

function! s:goyo_enter()   " On goyo enter:
  set noshowcmd            " Don't show last command
  set noshowmode           " Don't show current mode
  set scrolloff=999        " Centre current line
  Limelight                " Enable paragraph focus mode
  if has('gui_running')
    set fullscreen         " Enter fullscreen (don't use Mac native fullscreen for this)
    colo seoul8_light      " Light colours
    set linespace=7        " Extra leading is better for prose
  elseif exists('$TMUX')   " Hide tmux bar
    silent !tmux set status off
  endif
  let &l:statusline = '%M' " Show modified state on the bottom of the screen
                           " This automatically disables on Goyo leave
  hi StatusLine
        \ ctermfg=137
        \ guifg=#be9873
        \ cterm=NONE
        \ gui=NONE
endfunction

function! s:goyo_leave() " On goyo exit:
  set showcmd            " Show last command
  set showmode           " Show current mode
  set scrolloff=1        " Always show one line of context around the cursor
  Limelight!             " Disable paragraph focus mode
  if has('gui_running')
    set nofullscreen     " Exit fullscreen
    colo seoul8          " Dark colours
    set linespace=3      " Standard leading
  elseif exists('$TMUX') " Enable tmux bar
    silent !tmux set status on
  endif
endfunction

" Activate respective function on goyo enter and leave
" autocmd! vimrc User GoyoEnter nested call <sid>goyo_enter()
" autocmd! vimrc User GoyoLeave nested call <sid>goyo_leave()

" Limelight
let g:limelight_paragraph_span = 1  " Don't dim one par around the current one
let g:limelight_priority       = -1 " Don't overrule hlsearch

" config for plantuml
let g:plantuml_executable_script='java -jar ~/.vim/bundle/vim-slumlord/plantuml.jar'
