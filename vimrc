"""""""""""""""""""""""""""
" .vimrc
"
" vim configuration
""""""""""""""""""""""""""

" Use pajthogen to easily modify the runtime path to include all
" plugins under the ~/.vim/bundle directory
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

" Basic functionality
let mapleader = ","
set nocompatible
set background=dark
syntax on
set encoding=utf-8
set showcmd                     " display incomplete commands
set hidden
filetype plugin indent on       " load file type plugins + indentation

if $TERM == "xterm-256color" || $TERM == "screen-256color" || $COLORTERM == "gnome-terminal"
  set t_Co=256
endif

" Windows and Buffers
set splitright
set splitbelow

" Status Line
set laststatus=2

" Arrow keys only work in Insert mode 
noremap  <up>    <nop>
vnoremap <up>    <nop>
inoremap <up>    <up>
noremap  <down>  <nop>
vnoremap <down>  <nop>
inoremap <down>  <down>
noremap  <left>  <nop>
vnoremap <left>  <nop>
inoremap <left>  <left>
noremap  <right> <nop>
vnoremap <right> <nop>
inoremap <right> <right>

noremap j gj
noremap k gk

noremap  <C-f> <PageDown>
inoremap <C-f> <PageDown>
noremap  <C-b> <PageUp>
inoremap <C-b> <PageDown>
set nostartofline

"" New Sytnax Highlighting
au BufNewFile,BufRead *.glsl setf glsl      " OpenGL Shader Language
au BufNewFile,BufRead *.pml  setf promela   " Promela (Protocol Meta Language)
au BufNewFile,BufRead *.ispc setf ispc

"" Whitespace
set tabstop=2 shiftwidth=2      " tab length
set expandtab                   " use spaces, not tabs
set backspace=indent,eol,start  " backspace through everything in insert mode

"" Searching
set hlsearch                      " highlight matches
nmap <silent> <leader>/ :nohlsearch<CR>  " Clear search 
set incsearch                     " incremental searching
set ignorecase                    " searches are case insensitive...
set smartcase                     " ... unless they contain a capital letter
set scrolloff=5                   " Search results have a 5 line context

" Random shit
set mouse=               " No mouse
set ruler                " show cursor line,column
set number               " show line number
set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep

" Cursor Lines
hi CursorLine   cterm=NONE ctermbg=black 
hi CursorColumn cterm=NONE ctermbg=black
set cursorline
"set cursorcolumn

" Useful Commands and Shortcuts
"""""""""""""""""""""""""""""""

" sudo write file
cmap w!! w !sudo tee % >/dev/null

" toggle...
nmap <leader>n :set number!<CR> " line numbers
nmap <leader>s :set spell!<CR>  " spell check
nmap <leader>p :set paste!<CR>  " paste mode 
nmap <leader>l :set list!<CR>   " show tabs and eol
nmap <leader>e :NERDTreeToggle<CR>

" Invisible characters
set listchars=tab:>-,eol:<
highlight NonText ctermfg=black guifg=#4a4a59
highlight SpecialKey ctermfg=black guifg=#4a4a59

" Buffer Navigation
nmap <C-e> :e#<CR>
nmap <C-m> :bnext<CR>
nmap <C-n> :bprev<CR>

" Eclim Settings
""""""""""""""""""""""""""""
"use default Taglist instead of Eclim, avoid problem
"let g:EclimTaglistEnabled=0
"let g:taglisttoo_disabled = 1 " maybe of the same use of the above command 

"if the current file is in a Eclipse project, open project tree automatically
let g:EclimProjectTreeAutoOpen=1 
let g:EclimProjectTreeExpandPathOnOpen=1
let g:EclimProjectTreeSharedInstance=1  "share tree instance through all tabs

" use tabnew instead of split for new action
"let g:EclimProjectTreeActions = [ {'pattern': '.*', 'name': 'Tab', 'action': 'tabnew'} ]