set nocompatible

call pathogen#infect()
call pathogen#helptags()

" ================ General Config ====================

syntax on
set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim
set ic			            	"Case insensitive
set hidden

" ================ Search Settings  =================

set incsearch                   "Find the next match as we type the search
set hlsearch                    "Hilight searches by default
set viminfo='100,f1             "Save up to 100 marks, enable capital marks

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" ================ Persistent Undo ==================

silent !mkdir ~/.vim/backups > /dev/null 2>&1
set undodir=~/.vim/backups
set undofile

" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

filetype plugin on
filetype indent on

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points

" ================ Folds ============================

set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

" ================ Completion =======================

set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=*.class,*.git,*.jar
set wildignore+=*.mp3,*.swf,*.swz,*.flv,*.gz
set wildignore+=*.tpl,*.gif,*.pkg,*.md2,*.swc
set wildignore+=*.afm,*.ico,*.md2

" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1


" ================ Plugins ==========================

let mapleader = ","

" Command-T
noremap <leader>o <Esc>:CommandT<CR>
noremap <leader>O <Esc>:CommandTFlush<CR>
noremap <leader>m <Esc>:CommandTBuffer<CR>
let g:CommandTMaxFiles=20000

" Supertab
set completeopt=menu,menuone,longest
set pumheight=15
let g:SuperTabDefaultCompletionType = "context"

" Tagbar
let g:ackhighlight="1"
let g:tagbar_usearrows = 1
nnoremap <leader>l :TagbarToggle<CR>
nnoremap <leader>c :lcd %:p:h<CR>:pwd<CR>
let g:ackprg="ack-grep -H --nocolor --nogroup --column"
set tags=./tags,tags;

" Window move/resize
nmap <silent> 8 <C-w>5+
nmap <silent> 2 <C-w>5-
nmap <silent> 4 <C-w>10<
nmap <silent> 6 <C-w>10>
nmap <silent> 7 <C-w>_
nmap <silent> 9 <C-w><Bar>
nmap <silent> 0 <C-w>=

" Ack
noremap <leader>a <Esc>:Ack<CR>
autocmd FileType java,php autocmd BufWritePre <buffer> :%s/\s\+$//e

" Syntastic 
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_check_on_open=1
let g:syntastic_mode_map = { 'mode': 'passive',
                           \ 'passive_filetypes': ['javascript'] }

" Swap
set directory=~/.swap
