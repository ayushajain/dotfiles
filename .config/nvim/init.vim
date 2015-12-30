" Vim-Plug Config {{{
call plug#begin('~/.config/nvim/plugins')

Plug 'scrooloose/nerdtree'
Plug 'altercation/vim-colors-solarized'
Plug 'bogado/file-line'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'sheerun/vim-polyglot'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'
Plug 'Shougo/deoplete.nvim'
Plug 'briandoll/change-inside-surroundings.vim'
Plug 'tpope/vim-repeat'
Plug 'easymotion/vim-easymotion'
Plug 'tomtom/tcomment_vim'
Plug 'Chiel92/vim-autoformat'
Plug 'ervandew/supertab'
Plug 'kassio/neoterm'
Plug 'tpope/vim-sleuth'
Plug 'simnalamburt/vim-mundo'
Plug 'airblade/vim-gitgutter'
Plug 'vim-scripts/ZoomWin'

" Zen mode Plugins
Plug 'amix/vim-zenroom2'
Plug 'junegunn/goyo.vim'

call plug#end()

" }}}


" General Config {{{
set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim
set hidden
set foldmethod=marker
set undofile " Enable persistent undo so that undo history persists across vim sessions
set undodir=~/.config/nvim/.undohist
set background=dark
colorscheme solarized
syntax enable   "turn on syntax highlighting
filetype plugin indent on
let mapleader = "\<Space>"
" }}}


" Snippets & Autocompletion {{{
"let g:UltiSnipsExpandTrigger="<c-m>"

let g:deoplete#enable_at_startup = 1
set completeopt+=noinsert

let g:SuperTabDefaultCompletionType = "<c-n>"
" }}}


" Turn Off swap Files {{{
set noswapfile
set nobackup
set nowb
" }}}


" Indentation {{{
set autoindent
set smartindent
set smarttab
set shiftwidth=4
set softtabstop=2
set tabstop=4
set expandtab
set list listchars=tab:\ \ ,trail:·   " Display tabs and trailing spaces visually
set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points
" }}}


" Scrolling {{{
set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1
" }}}


" Search {{{
set incsearch       " Find the next match as we type the search
set hlsearch        " Highlight searches by default
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital
" }}}


" Custom Settings {{{
inoremap jj <ESC>
map j <ESC>
map <Leader>w :w<CR>
map <Leader>qa :xa<CR>
map <Leader>xa :qa!<CR>
map <Leader>qq :x<CR>
map <Leader>xc :q!<CR>
map <Leader>nn :NERDTreeToggle<CR>
map <Leader>nb :NERDTreeFromBookmark
map <Leader>nf :NERDTreeFind<CR>
map <Leader>fmt :Autoformat<CR>
noremap <Leader>u :GundoToggle<CR>
nnoremap zA :call ToggleAllFolds()<CR>
nnoremap <silent> <leader>z :Goyo<cr>
vnoremap <C-r> "0y<Esc>:%s/<C-r>0//g<left><left>

" Git kebinds
map <Leader>gg :GitGutterToggle<CR>
map <Leader>gb :Gblame<CR>
map <Leader>gs :Gstatus<CR>
map <Leader>gh :GitGutterLineHighlightsToggle<CR>

" use escape to turn off highlight
nnoremap <ESC> :noh<return><ESC>

nmap <silent> <Leader>sv :source ~/.config/nvim/init.vim<CR>
nmap <silent> <Leader>ev :tabedit ~/.config/nvim/init.vim<CR>

let g:Folds_Open = 0

function! ToggleAllFolds()
  if g:Folds_Open == 0
    let g:Folds_Open = 1
    execute "normal zR"
  else
    let g:Folds_Open = 0
    execute "normal zM"
  endif
endfunction

function! NERDTreeIsAlreadyToggled()
  if g:NERDTreeOpened == 0
    NERDTree
    let g:NERDTreeOpened = 1
  else
    execute "NERDTreeTabsToggle"
  endif
endfunction

"Leader + command to copy/paste/cut/delete
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P
"Moves cursor to end of pasted text
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

"Select pasted text
noremap gV `[v`]
" }}}


" Status Line {{{
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'LightLineFugitive',
      \   'readonly': 'LightLineReadonly',
      \   'modified': 'LightLineModified'
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

function! LightLineModified()
  if &filetype == "help"
    return ""
  elseif &modified
    return "+"
  elseif &modifiable
    return ""
  else
    return ""
  endif
endfunction

function! LightLineReadonly()
  if &filetype == "help"
    return ""
  elseif &readonly
    return ""
  else
    return ""
  endif
endfunction

function! LightLineFugitive()
  if exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? ' '._ : ''
  endif
  return ''
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ ('' != expand('%') ? expand('%') : '[NoName]')
endfunction

" Use status bar even with single buffer
set laststatus=2
" }}}


" Neoterm {{{
let g:neoterm_position = 'horizontal'
let g:neoterm_automap_keys = '<Leader>rt'
let g:neoterm_size = 10

"toggles neoterm visibilty
nnoremap <silent> <Leader>rr :call IsNeoTermOpen()<cr>
" kills the current job (send a <c-c>)
nnoremap <silent> <Leader>rc :call neoterm#kill()<cr>


let g:neoterm_is_open = 0

function! IsNeoTermOpen()
  echo g:neoterm_is_open
  if g:neoterm_is_open == 0
    execute "Topen"
    let g:neoterm_is_open = 1
  else
    call neoterm#close()
    let g:neoterm_is_open = 0
  endif
endfunction

set statusline+=%#NeotermTestRunning#%{neoterm#test#status('running')}%*
set statusline+=%#NeotermTestSuccess#%{neoterm#test#status('success')}%*
set statusline+=%#NeotermTestFailed#%{neoterm#test#status('failed')}%*

" Git commands
command! -nargs=+ Tg :T git <args>
" }}}


" Easymotion {{{
map <Leader>e <Plug>(easymotion-prefix)

map sn <Plug>(easymotion-sn)
omap sn <Plug>(easymotion-tn)

let g:EasyMotion_skipfoldedline = 0
" Use uppercase target labels and type as a lower case
let g:EasyMotion_use_upper = 1
" type `l` and match `l`&`L`
let g:EasyMotion_smartcase = 1
" Smartsign (type `3` and match `3`&`#`)
let g:EasyMotion_use_smartsign_us = 1
" }}}


" Environment setup {{{

nmap <Leader>set :call EnvironmentSetup()<CR>
let g:NERDTreeOpened = 0

function! EnvironmentSetup()
  if g:NERDTreeOpened == 0
    call IsNeoTermOpen()
    NERDTree
    let g:NERDTreeOpened = 1
  else
    call IsNeoTermOpen()
    execute "NERDTreeTabsToggle"
  endif
endfunction

nmap <Leader>bg :call ToggleBackground()<CR>
let g:IsDark = 1

function! ToggleBackground()
  if g:IsDark == 1
    set background=light
    let g:IsDark = 0
  else
    set background=dark
    let g:IsDark = 1
  endif
endfunction
" }}}


" Formatters {{{

"}}}
