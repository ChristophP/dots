set nocompatible  " Disable vi-compatibility
set nomodeline " good practice to disable because of security issues
set t_Co=256

" Disable safe write
set backupcopy=yes

" Vundle config start
" --------------------
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Git wrapper
Plug 'tpope/vim-fugitive'

" NERDTree
Plug 'scrooloose/nerdtree'

" Batch Commenting
Plug 'scrooloose/nerdcommenter'

" CtrlP
Plug 'ctrlpvim/ctrlp.vim'

" Use Airline to display file/buffer info
Plug 'vim-airline/vim-airline'

" Elm integration
Plug 'ElmCast/elm-vim'
" elm options
let g:elm_format_autosave = 0
let g:ycm_semantic_triggers = {
    \ 'elm' : ['.'],
    \}

" Textsearch across files
Plug 'mileszs/ack.vim'

" JS indendation and syntax support
Plug 'pangloss/vim-javascript'

" insert closing braces, quotes etc.
Plug 'jiangmiao/auto-pairs'

" syntax highlighting for JSX
Plug 'mxw/vim-jsx'
let g:jsx_ext_required = 0 " turn on not just for .jsx also for .js files

" prettier for code formatting
Plug 'prettier/vim-prettier'
let g:prettier#autoformat = 0
let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#trailing_comma = 'es5'
" autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql PrettierAsync

" close html tags
Plug 'alvan/vim-closetag'

let g:closetag_filenames = "*.html,*.ejs,*.php,*.js"

" ejs highlighting
Plug 'briancollins/vim-jst'

" Plugin for coffeescript
Plug 'kchmck/vim-coffee-script'

" Haskell highlighting
Plug 'neovimhaskell/haskell-vim'
let g:haskell_classic_highlighting = 1
let g:haskell_indent_disable = 1

Plug 'meck/vim-brittany'
let g:brittany_config_file = "~/.config/brittany/config.yaml"

" terraform integration
Plug 'hashivim/vim-terraform'
let g:terraform_fmt_on_save=1

" Jenkins/Groovy support
Plug 'thanethomson/vim-jenkinsfile'

" Multi cursor
Plug 'terryma/vim-multiple-cursors'

" Coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()
" All of your Plugins must be added before the following line

" Start for Coc mappings
" ----------------------

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" End Coc mappings
" ----------------------

syntax enable
colorscheme xoria256

" These options only work in a gui environment
set guifont=menlo\ for\ powerline:h16
set guioptions-=T " Removes top toolbar
set guioptions-=r " Removes right hand scroll bar
set go-=L " Removes left hand scroll bar
set linespace=15

set showmode                    " always show what mode we're currently editing in
set nowrap                      " don't wrap lines
set tabstop=2                   " a tab is four spaces
set smarttab
set tags=tags
set softtabstop=2               " when hitting <BS>, pretend like a tab is removed, even if spaces
set expandtab                   " expand tabs by default (overloadable per file type later)
set shiftwidth=2                " number of spaces to use for autoindenting
set shiftround                  " use multiple of shiftwidth when indenting with '<' and '>'
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set autoindent                  " always set autoindenting on
set copyindent                  " copy the previous indentation on autoindenting
set number                      " always show line numbers
set ignorecase                  " ignore case when searching
set smartcase                   " ignore case if search pattern is all lowercase,
set timeout timeoutlen=500 ttimeoutlen=100
set visualbell           " don't beep
set noerrorbells         " don't beep
set autowrite  "Save on buffer switch
set mouse=a
set autoread " reload buffer when file changes externally
set colorcolumn=81 "show line limit for 80 characters

"highlight current line but only in active window
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = "\<space>"
let g:mapleader = "\<space>"

" Fast saves
nmap <leader>w :w!<cr>

" copying/pasting to/from system clipboard
noremap <Leader>y "+y
noremap <Leader>p "+p

" Down is really the next line
nnoremap j gj
nnoremap k gk

"Easy escaping to normal mode
imap jj <esc>

"Auto change directory to match current file ,cd
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

"easier window navigation
nmap <C-h> <C-w>h
" nmap <C-j> <C-w>j
"nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" jump down 10 lines quickly
nmap <C-j> :+10<CR>
nmap <C-k> :-10<CR>

"Resize vsplit
nmap 25 :vertical resize 40<cr>
nmap 50 <c-w>=
nmap 75 :vertical resize 120<cr>

nmap <C-b> :NERDTreeToggle<cr>

"Load the current buffer in Chrome
nmap <leader>c :!open -a Google\ Chrome<cr>

"LEShow (partial) command in the status line
set showcmd
" Create split below

nmap :sp :rightbelow sp<cr>

" Quickly go forward or backward to buffer
nmap :bp :BufSurfBack<cr>
nmap :bn :BufSurfForward<cr>

highlight Search cterm=underline

" Swap files out of the project root
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//

" Run PHPUnit tests
map <Leader>t :!phpunit %<cr>

" Easy motion stuff
let g:EasyMotion_leader_key = '<Leader>'

" Powerline (Fancy thingy at bottom stuff)
let g:Powerline_symbols = 'fancy'
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs
" set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)

set incsearch " highlight as you type not only on enter
autocmd cursorhold * set nohlsearch " ???
autocmd cursormoved * set hlsearch " highlight search matched
" remove the highlight when pressing escape
" nnoremap <esc> :noh<esc> " remapping escape breaks some stuff
nnoremap <CR> :noh<CR><CR>


" Remove search results
command! H let @/=""

" If you prefer the Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving
" insert mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" --------- auto groups ----------------
" source .vimrc when it has changed
augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

" CtrlP Stuff

" Familiar commands for file/symbol browsing
map <D-p> :CtrlP<cr>
map <C-e> :CtrlPMRU<cr>

" start from the current working directory
let g:ctrlp_max_height=25
let g:ctrlp_clear_cache_on_exit=0
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40
let g:ctrlp_working_path_mode = 'a'

" I don't want to pull up these folders/files when calling CtrlP
set wildignore+=*/vendor/**
set wildignore+=*/node_modules/**

" Open splits
nmap vs :vsplit<cr>
nmap sp :split<cr>
" Position splits below and right
set splitright
set splitbelow

" Create/edit file in the current directory
nmap :ed :edit %:p:h/

" Trim trailing whitespace
function! TrimWhiteSpace()
    %s/\s\+$//e
endfunction

nnoremap <silent> <Leader>rts :call TrimWhiteSpace()<CR>

autocmd FileWritePre    * :call TrimWhiteSpace()
autocmd FileAppendPre   * :call TrimWhiteSpace()
autocmd FilterWritePre  * :call TrimWhiteSpace()
autocmd BufWritePre     * :call TrimWhiteSpace()