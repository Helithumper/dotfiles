execute pathogen#infect()


filetype plugin indent on
set background=dark
syntax on
color dracula

" tabs & spaces
set tabstop=2           " number of visual spaces per TAB
set softtabstop=2       " number of spaces in tab when editing
set expandtab       	  " tabs are spaces

" ui
set number
set showcmd             " show command in bottom bar
set cursorline          " highlight current line
set wildmenu            " visual autocomplete for command menu
set showmatch           " highlight matching [{()}]

" searching
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" ctrlP
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0


" NERDTree
map <C-n> :NERDTreeToggle<CR>
