set colorcolumn=+1
set cursorline " highlight current line
set expandtab
set list listchars=tab:»·,trail:·,nbsp:·
set nobackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set nowrap              " no word-wrap
set nowritebackup
set number
set ruler         " show the cursor position all the time
set shiftround
set shiftwidth=2
set tabstop=2
set textwidth=80
Softtabs, 2 spaces
" set cursorcolumn                                             " enable vertical line
set cursorline                                               " enable horizontal line
set listchars=tab:▸\ ,trail:▫
set softtabstop=2                                            " insert mode tab and backspace use 2 spaces

colorscheme zenburn
filetype plugin indent on " ensure ftdetect et al work by including this after the Vundle stuff
set autoindent
set autoread
set autowrite     " Automatically :write before running commands
set backspace=2                                              " Fix broken backspace in some setups
set backupcopy=yes                                           " see :help crontab
set clipboard=unnamed                                        " yank and paste with the system clipboard
set directory-=.                                             " don't store swapfiles in the current directory
set encoding=utf-8
set expandtab                                                " expand tabs to spaces
set filetype=on " without this vim emits a zero exit status, later, because of :ft off
set guifont="Source Code Pro":h12
set history=50
set hlsearch            " highlight search
set ignorecase                                               " case-insensitive search
set incsearch     " do incremental searching
set laststatus=2                                             " always show statusline
set list                                                     " show trailing whitespace
set nocompatible        " don't bother with vi compatibility
set number                                                   " show line numbers
set numberwidth=5
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
  Plugin 'ctrlpvim/ctrlp.vim'
  Plugin 'fatih/vim-go'
  Plugin 'ggreer/the_silver_searcher'
  Plugin 'scrooloose/nerdtree'
call vundle#end()

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

" keyboard shortcuts
let mapleader = ','
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <leader>l :Align
nnoremap <leader>a :Ag<space>
nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap <leader>d :NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeFind<CR>
nnoremap <leader>t :CtrlP<CR>
nnoremap <leader>T :CtrlPClearCache<CR>:CtrlP<CR>
nnoremap <leader>] :TagbarToggle<CR>
nnoremap <leader><space> :call whitespace#strip_trailing()<CR>
nnoremap <leader>g :GitGutterToggle<CR>
noremap <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" in case you forgot to sudo
" cnoremap w!! %!sudo tee > /dev/null %
" go specific settings
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
autocmd BufEnter * set cursorline
autocmd BufLeave * set nocursorline

" highlight CursorLine   cterm=NONE ctermbg=black ctermfg=NONE guibg=black guifg=NONE
" highlight CursorColumn cterm=NONE ctermbg=black ctermfg=NONE guibg=black guifg=NONE

# vim-go settings
let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_types = 1
" go specific settings
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>rn <Plug>(GoRename)

" plugin settings
let g:ctrlp_match_window = 'order:ttb,max:20'
let g:neocomplete#enable_at_startup = 1
let g:NERDSpaceDelims=1
let g:gitgutter_enabled = 1
