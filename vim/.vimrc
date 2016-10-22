set nocompatible

" ------------------------------------------------------------------------------------------------------------
" plugins
" ------------------------------------------------------------------------------------------------------------

call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'mbbill/undotree'
Plug 'mhinz/vim-startify'
Plug 'valloric/youcompleteme', { 'do': './install.py --clang-completer' }
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ervandew/supertab'
Plug 'johnsyweb/vim-makeshift'
Plug 'a.vim'
Plug 'jeaye/color_coded', { 'do': 'cmake . && make -j4 && make install && make clean && make clean_clang' }
Plug 'jiangmiao/auto-pairs'
Plug 'tomtom/tcomment_vim'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'matze/vim-move'
Plug 'eskin/tabline.vim'
Plug 'eskin/cake16'
call plug#end()

" Disable some standard plugins
let g:loaded_2html_plugin = 1
let g:loaded_getscriptPlugin = 1
let g:loaded_gzip = 1
let g:loaded_logipat = 1
let g:loaded_rrhelper = 1
let g:loaded_spellfile_plugin = 1
let g:loaded_tarPlugin = 1
let g:loaded_vimballPlugin = 1
let g:loaded_zipPlugin = 1


" ------------------------------------------------------------------------------------------------------------
" plugin specific settings
" ------------------------------------------------------------------------------------------------------------

" Disable color_coded in diff mode
let g:color_coded_enabled = 1
if &diff
    let g:color_coded_enabled = 0
endif

if has("gui_running")
  macmenu Edit.Paste key=<nop>
  noremap <D-v> "*P
  cnoremap <D-v> <C-r><C-o>*
  inoremap <D-v> <C-g>u<C-r><C-o>*
endif

let g:airline_powerline_fonts = 1
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_left_alt_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_skip_empty_sections = 1

let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
let g:ycm_python_binary_path = 'python3'
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_enable_diagnostic_signs = 0

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<Right>"
let g:UltiSnipsJumpBackwardTrigger = "<Left>"

let g:gitgutter_map_keys = 0
let g:polyglot_disabled = ['c++11', 'c/c++']
let g:plug_window = 'topleft new | res'
" let g:color_coded_enabled = 0

let g:move_key_modifier = 'C' " matze/vim-move


" ------------------------------------------------------------------------------------------------------------
" general settings
" ------------------------------------------------------------------------------------------------------------

filetype plugin indent on               " Load plugins according to detected filetype
syntax enable                           " Enable syntax highlighting
set encoding    =utf-8                  " The encoding diaplayed
set fileencoding=utf-8                  " The encoding  written

set autoindent                          " Indent according to previous line
set smartindent                         " Отступ при начале нового блока
set backspace   =indent,eol,start       " Make backspace work as you would expect
set smarttab
set expandtab                           " Use spaces instead of tabs
set softtabstop =4                      " Tab key indents by 4 spaces
set shiftwidth  =4                      " >> indents by 4 spaces
set shiftround                          " >> indents to next multiple of 'shiftwidth'

set hidden                              " Switch between buffers without having to save first
set laststatus  =2                      " Always show statusline
set display     =lastline               " Show as much as possible of the last line
set wildmenu                            " Tab menu on command line

set nrformats  -=octal                  " Disable octal number format

set showcmd                             " Show already typed keys when more are expected
set formatoptions-=t                    " Disable auto-wrapping

set incsearch                           " Highlight while searching with / or ?
set ignorecase                          " case insensivity search
set hlsearch                            " Keep matches highlighted
set complete   -=i                      " disable scanning included files
set complete   -=t                      " disable searching tags
set wrapscan                            " Searches wrap around end-of-file

" set clipboard   =unnamed                " Use system clipboard

set ttyfast                             " Faster redrawing
set lazyredraw                          " Only redraw when necessary
set synmaxcol   =200                    " Only highlight the first 200 columns

set splitbelow                          " Open new windows below the current window
set splitright                          " Open new windows right of the current window
"set winwidth    =999                   " Запрещаем вертикальное разделение

set number                              " Show line numbers
" set foldcolumn  =1

augroup cursorline                      " Highlight current line only on active window
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline cursorcolumn
  au WinLeave * setlocal nocursorline nocursorcolumn
augroup END

set report      =0                      " Always report changed lines
set history     =1000                   " Store lots of :cmdline history

set noerrorbells                        " Disable beep
set novisualbell                        " Disable beep
set t_vb=                               " Disable beep
set visualbell                          " Disable beep

set scrolloff   =5                      " Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll  =1

set autoread                            " Reload files changed outside vim
autocmd BufWritePre * :%s/\s\+$//e      " Trim trailing whitespace on save

set gcr         =a:blinkon0             " Disable cursor blink

set list                                " Show non-printable characters
if has('multi_byte') && &encoding ==# 'utf-8'
  let &listchars = 'tab:▸ ,extends:❯,precedes:❮,nbsp:±'
else
  let &listchars = 'tab:> ,extends:>,precedes:<,nbsp:.'
endif

set completeopt-=preview                " disable preview window popping up

" Put all temporary files under the same directory
set nobackup
set directory   =$HOME/.vim/files/swap/
set updatecount =100
set undofile
set undodir     =$HOME/.vim/files/undo/
set viminfo     ='100,n$HOME/.vim/files/info/viminfo


" ------------------------------------------------------------------------------------------------------------
" color scheme settings
" ------------------------------------------------------------------------------------------------------------

" set t_Co=256                            " make use of 256 terminal colors
" set background=light
" set background=dark

colorscheme cake16
let g:airline_theme = 'tomorrow'


set guifont     =Roboto\ Mono\ for\ Powerline:h15
let macvim_skip_colorscheme=1


" ------------------------------------------------------------------------------------------------------------
" key bindings
" ------------------------------------------------------------------------------------------------------------

noremap Q <Nop>
noremap q <Nop>                         " Disable macros, temporary

" comments
nmap <leader>c gcc
vmap <leader>c gc

nnoremap <leader>j :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>t :YcmCompleter GetType<CR>
"let g:SuperTabCrMapping = 0

nnoremap <c-n> :NERDTreeToggle<CR>
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>u :UndotreeToggle<CR>

" Quickly add empty lines. 5[<space> inserts 5 blank lines above the current line
nnoremap [<space>  :<c-u>put! =repeat(nr2char(10), v:count1)<cr>'[
nnoremap ]<space>  :<c-u>put =repeat(nr2char(10), v:count1)<cr>

map <leader><leader> :let @/=""<CR>

cnoremap <c-n>  <down>                  " Saner command-line history
cnoremap <c-p>  <up>                    " Saner command-line history

" xnoremap p "_dP

