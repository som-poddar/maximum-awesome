set colorcolumn=+1
set cursorline                                            " highlight current line
set expandtab
set nobackup
set noswapfile
set nowrap                                                " no word-wrap
set nowritebackup
set ruler                                                 " show the cursor position all the time
" set shiftround
" set shiftwidth=2
" set tabstop=2
" set textwidth=80
" set softtabstop=4 shiftwidth=4 expandtab                " indentation level 4 spaces. Tabs are not used
" set cursorcolumn                                        " enable vertical line
set cursorline                                            " enable horizontal line
set softtabstop=2                                         " insert mode tab and backspace use 2 spaces

colorscheme simplifysimplify-dark
filetype plugin indent on " ensure ftdetect et al work by including this after the Vundle stuff
set autoindent
set autoread
set autowrite                                                " Automatically :write before running commands
set backspace=2                                              " Fix broken backspace in some setups
set backupcopy=yes                                           " see :help crontab
set clipboard=unnamed                                        " yank and paste with the system clipboard
set directory-=.                                             " don't store swapfiles in the current directory
set encoding=utf-8
set expandtab                                                " expand tabs to spaces
set filetype=on " without this vim emits a zero exit status, later, because of :ft off
set guifont=Inconsolata:h14
set history=50
set hlsearch                                                 " highlight search
set ignorecase                                               " case-insensitive search
set incsearch                                                " do incremental searching
set laststatus=2                                             " always show statusline
set list                                                     " show trailing whitespace
set listchars=tab:\ \ ,trail:▫
" set nolist
" set listchars=trail:▫
" set list listchars=tab:»·,trail:·,nbsp:·
" set listchars=tab:▸\ ,trail:·,nbsp:·
set nocompatible                                             " don't bother with vi compatibility
set number                                                   " show line numbers
set numberwidth=7
set relativenumber
set ruler                                                    " show where you are
set scrolloff=3                                              " show context above/below cursorline
set shiftwidth=2                                             " normal mode indentation commands use 2 spaces
set showcmd       " display incomplete commands
set smartcase                                                " case-sensitive search if any caps
set t_Co=256
set tabstop=8                                                " actual tabs occupy 8 characters
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
set wildmenu                                                 " show a navigable menu for tab completion
set wildmode=longest,list,full
syntax enable           " enable syntax highlighting
syntax on

set rtp+=~/.vim/bundle/Vundle.vim  " configure Vundle
set rtp+=~/.vim/plugged/neocomplete.vim/

call vundle#begin() " install plugins via Vundle
  Plugin 'airblade/vim-gitgutter'
  Plugin 'ajh17/VimCompletesMe'
  Plugin 'ctrlpvim/ctrlp.vim'
  Plugin 'fatih/vim-go'
  Plugin 'ggreer/the_silver_searcher'
  Plugin 'majutsushi/tagbar'
  Plugin 'mileszs/ack.vim'
  Plugin 'scrooloose/nerdtree'
  Plugin 'shougo/neocomplete'
  Plugin 'vim-airline/vim-airline'
  Plugin 'vim-airline/vim-airline-themes'
call vundle#end()

" airline settings
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='solarized'

" ack settings
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif


" will use completion if not at beginning
set wildmode=list:longest,list:full

" Exclude Javascript files in :Rtags via rails.vim due to warnings when parsing
let g:Tlist_Ctags_Cmd="ctags --exclude='*.js'"

" Index ctags from any project, including those outside Rails
map <Leader>ct :!ctags -R .<CR>

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" vim-rspec mappings
nnoremap <Leader>t :call RunCurrentSpecFile()<CR>
nnoremap <Leader>s :call RunNearestSpec()<CR>
nnoremap <Leader>l :call RunLastSpec()<CR>

" Run commands that require an interactive shell
nnoremap <Leader>r :RunInInteractiveShell<space>

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" configure syntastic syntax checking to check on open as well as save
let g:syntastic_check_on_open=1
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]

" Set spellfile to location that is guaranteed to exist, can be symlinked to
" Dropbox or kept in Git and managed outside of thoughtbot/dotfiles using rcm.
set spellfile=$HOME/.vim-spell-en.utf-8.add

" Autocomplete with dictionary words when spell check is on
set complete+=kspell

" Always use vertical diffs
set diffopt+=vertical

" Local config
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif

" general key maps
let mapleader = ','
imap ;; <Esc>                                         " Two semicolons for maps to escape
imap <C-l> <Esc>                                      " Ctrl + l maps to escape

nnoremap <leader><space> :call whitespace#strip_trailing()<CR>

" silver searcher, ack
nnoremap <leader>] :TagbarToggle<CR>
nnoremap <leader>a :Ag<space>
nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap <leader>d :NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeFind<CR>
nnoremap <leader>g :GitGutterToggle<CR>
nnoremap <leader>t :CtrlP<CR>
nnoremap <leader>T :CtrlPClearCache<CR>:CtrlP<CR>
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <leader>l :Align
noremap <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
map <leader>a :cclose<CR>

" map go to definition
autocmd FileType go nmap <g-d> <C-]>
autocmd FileType go nmap <g-b> <C-o>

" in case you forgot to sudo
" cnoremap w!! %!sudo tee > /dev/null %

" go specific key maps
autocmd FileType go nmap <leader>b <Plug>(go-build)
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
autocmd FileType go nmap <leader>r <Plug>(go-run)
autocmd FileType go nmap <leader>rn <Plug>(GoRename)
autocmd FileType go nmap <leader>t <Plug>(go-test)

autocmd BufEnter * set cursorline
autocmd BufLeave * set nocursorline

" highlight CursorLine   cterm=NONE ctermbg=black ctermfg=NONE guibg=black guifg=NONE
" highlight CursorColumn cterm=NONE ctermbg=black ctermfg=NONE guibg=black guifg=NONE

" vim-go specific settings
let g:go_fmt_command = "goimports"
let g:go_fmt_autosave = 1
let g:go_fmt_fail_silently = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_types = 1

" silver searcher, ack
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>

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
let g:neocomplete#enable_at_startup = 1
let g:NERDSpaceDelims=1
let g:gitgutter_enabled = 1


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
