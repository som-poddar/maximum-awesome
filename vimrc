set foldlevel=0
set foldlevelstart=0
set foldmethod=indent " other option is 'syntax'
set foldnestmax=3

set colorcolumn=80
set cursorline                                            " highlight current line
set expandtab
set nobackup
set noswapfile
set nowrap                                                " no word-wrap
set nowritebackup
set ruler                                                 " show the cursor position all the time
set softtabstop=2                                         " insert mode tab and backspace use 2 spaces

colorscheme gruvbox

filetype plugin indent on " ensure ftdetect et al work by including this after the Vundle stuff

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
set guifont="Fira\ Code:h14"
set history=50
set hlsearch                                                " highlight search
set ignorecase                                              " case-insensitive search
set incsearch                                               " do incremental searching
set laststatus=2                                            " always show statusline
set linespace=3
set list                                                    " show trailing whitespace
set listchars=tab:\ \ ,trail:▫
set nocompatible                                            " don't bother with vi compatibility
set number                                                   " show line numbers
set numberwidth=6
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

" source external files
source ~/.gvimrc
source ~/workspace/tools/maximum-awesome/vimrc.bundles

" glaive for code formatting
call glaive#Install()

" run auto-formatting on save
augroup autoformat_settings
  autocmd FileType c,cpp,proto,javascript AutoFormatBuffer clang-format
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType html,css,json AutoFormatBuffer js-beautify
  autocmd FileType java AutoFormatBuffer clang-format
augroup END

" deoplete settings
" let g:deoplete#enable_at_startup = 1

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
nnoremap <Leader><Leader> <c-^>

" vim-rspec mappings
nnoremap <Leader>l :call RunLastSpec()<CR>
nnoremap <Leader>s :call RunNearestSpec()<CR>
nnoremap <Leader>t :call RunCurrentSpecFile()<CR>

" Run commands that require an interactive shell
nnoremap <Leader>r :RunInInteractiveShell<space>

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

" Set spellfile to location that is guaranteed to exist, can be symlinked to
" Dropbox or kept in Git and managed outside of thoughtbot/dotfiles using rcm.
set spellfile=$HOME/.vim-spell-en.utf-8.add

" Autocomplete with dictionary words when spell check is on
set complete+=kspell

" Always use vertical diffs
set diffopt+=vertical

" general key maps
let mapleader = ','
imap ;; <Esc>                                         " Two semicolons for maps to escape
imap <C-l> <Esc>                                      " Ctrl + l maps to escape

nnoremap <Leader><space> :call whitespace#strip_trailing()<CR>

" silver searcher, ack
nnoremap <Leader>] :TagbarToggle<CR>
nnoremap <Leader>a :Ag<space>
nnoremap <Leader>b :CtrlPBuffer<CR>
nnoremap <Leader>d :NERDTreeToggle<CR>
nnoremap <Leader>f :NERDTreeFind<CR>
nnoremap <Leader>g :GitGutterToggle<CR>
nnoremap <Leader>t :CtrlP<CR>
nnoremap <Leader>T :CtrlPClearCache<CR>:CtrlP<CR>

noremap <Leader>l :Align

" keymap for quick window
nnoremap <C-N> :cnext<CR>
nnoremap <C-M> :cprevious<CR>
nnoremap <C-a>a :cclose<CR>

" keymap for buffer navigation
nnoremap <C-]> :bnext<CR>
nnoremap <C-[> :bprevious<CR>

" map go to definition
autocmd FileType go nmap <g-d> <C-]>
autocmd FileType go nmap <g-b> <C-o>

" strip any trailing whitespaces for certain types of files
autocmd FileType c,cpp,exs,java,php,yaml autocmd BufWritePre <buffer> %s/\s\+$//e

" go specific key maps
autocmd FileType go nmap <Leader>b <Plug>(go-build)
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
autocmd FileType go nmap <Leader>r <Plug>(go-run)
autocmd FileType go nmap <Leader>rn <Plug>(GoRename)
autocmd FileType go nmap <Leader>t <Plug>(go-test)

" cusorline behavior
autocmd BufEnter * set cursorline
autocmd BufLeave * set nocursorline
" highlight CursorLine   cterm=NONE ctermbg=black ctermfg=NONE guibg=black guifg=NONE
" highlight CursorColumn cterm=NONE ctermbg=black ctermfg=NONE guibg=black guifg=NONE

" remove trailing whitespaces before saving
autocmd BufWritePre * %s/\s\+$//e

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
let g:neocomplete#auto_completion_start_length=1
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 1

let g:NERDSpaceDelims=1
let g:NERDTreeShowHidden=1
let g:gitgutter_enabled = 1

" tagbar settings
let g:TagbarSetFoldlevel=0

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
