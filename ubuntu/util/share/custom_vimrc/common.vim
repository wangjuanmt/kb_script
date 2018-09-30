set encoding=utf-8
scriptencoding utf-8

" Default is 8
set shiftwidth=4

" Conversely, if you want to switch back to a case-sensitive search
" set noignorecase
set ignorecase

" Prevent .swp file to be created
set noswapfile

" Exclude files and directories
set wildignore+=*.swp

" Exclude files and directories using CtrlP's own g:ctrlp_custom_ignore
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn)$',
    \ }

" Include hidden files (.dotfiles) by default
let g:ctrlp_show_hidden = 1

" Ensure that the highlight group gets created and is not cleared by future colorscheme commands
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red

"let g:lightline = {
"    \ 'colorscheme': 'solarized',
"    \ 'active': {
"    \     'left': [ [ 'mode', 'paste' ],
"    \         [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
"    \ },
"    \ 'component': {
"    \   'readonly': '%{&filetype=="help"?"":&readonly?"RO":""}',
"    \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
"    \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
"    \ },
"    \ 'component_visible_condition': {
"    \   'readonly': '(&filetype!="help"&& &readonly)',
"    \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
"    \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
"    \ }
"\ }

let g:lightline = {
    \ 'colorscheme': 'solarized',
    \ 'active': {
    \     'left': [ [ 'mode', 'paste' ],
    \         [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
    \ },
    \ 'component_function': {
    \   'readonly': 'LightlineReadonly',
    \   'modified': 'LightlineModified',
    \   'fugitive': 'LightlineFugitive',
    \   'filename': 'LightlineFilename'
    \ }
\ }

function! LightlineModified()
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

function! LightlineReadonly()
    if &filetype == "help"
        return ""
    elseif &readonly
        return "RO"
    else
        return ""
    endif
endfunction

function! LightlineFugitive()
    return exists('*fugitive#head') ? fugitive#head() : ''
endfunction

" https://github.com/itchyny/lightline.vim/issues/87
function! LightlineFilename()
    return '' != expand('%') ? expand('%') : '[No Name]'
endfunction

let g:lightline.tab = {
    \ 'active': [ 'tabnum', 'mytabname', 'modified' ],
    \ 'inactive': [ 'tabnum', 'mytabname', 'modified' ]
\ }

" https://github.com/itchyny/lightline.vim/blob/master/doc/lightline.txt,
" search 'g:lightline.tab_component_function'
let g:lightline.tab_component_function = {
    \ 'mytabname': 'MyTabname'
\ }

" https://github.com/itchyny/lightline.vim/issues/101
function! MyTabname(n) abort
    let buflist = tabpagebuflist(a:n)
    let winnr = tabpagewinnr(a:n)
    let _ = expand('#'.buflist[winnr - 1])
    if gettabwinvar(a:n, winnr, '&ft') == 'vimfiler'
        return 'FV'
    else
        return strlen(_) ? _ : '[No Name]'
    endif
endfunction

if !has('gui_running')
    set t_Co=256
endif

" Enable syntax highlighting
syntax enable

" Show line numbers
set number

filetype plugin indent on

" Show existing tab with 4 spaces width
set tabstop=4

" When indenting with '>', use 4 spaces width
set shiftwidth=4

" Indent when moving to the next line while writing code
set autoindent

" Expand tabs into spaces
set expandtab

" Show a visual line under the cursor's current line
set cursorline

" Show the matching part of the pair for [] {} and ()
set showmatch

" Enable all Python syntax highlighting features
let python_highlight_all = 1

set background=dark

" Always show status line
set laststatus=2

" Always show tabline
"set showtabline=2

" Hide insert status
set noshowmode

" Enhanced tab completion
set wildmenu

" Reduce vim's refreshing delay
set updatetime=250

" Enable setting title
set title

" Configure title
set titlestring=%t%(\ %M%)%(\ (%{expand(\"%:p:h\")})%)%(\ %a%)\ -\ %{v:servername}

" Lists all loaded buffers and populates the prompt for you, waiting for you to type the number of a buffer and press <enter>
nnoremap gb :ls<CR>:b<Space>

" Open NERDTree automatically when vim starts up on opening a directory
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" Map a specific key or shortcut to toggle NERDTree
map <C-e> :NERDTreeToggle<CR>

" Open NERDTree on console vim startup. (When set to 2, open only if directory was given as startup argument).
"let g:nerdtree_tabs_open_on_console_startup=2

" On startup, focus NERDTree if opening a directory, focus file if opening a file. (When set to 2, always focus file window after startup).
"let g:nerdtree_tabs_smart_startup_focus=2

" Unfocus NERDTree when leaving a tab for descriptive tab names
"let g:nerdtree_tabs_meaningful_tab_names=1

" Close current tab if there is only one window in it and it's NERDTree,
" default is 1
let g:nerdtree_tabs_autoclose=0

" When given a directory name as a command line parameter when launching Vim, :cd into it.
let g:nerdtree_tabs_startup_cd=1

" Show hidden files in NERDTree
" https://github.com/scrooloose/nerdtree/blob/master/doc/NERD_tree.txt
let g:NERDTreeShowHidden=1

" Search highlighting
set hlsearch

" Use a highlight group named ExtraWhitespace
highlight ExtraWhitespace ctermbg=red guibg=red
" Show trailing whitespace
match ExtraWhitespace /\s\+$/
" Applies the highlight to all files
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
" Let the highlighting show up as soon as you enter/leave insert mode
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
" Resolving performance problems
if version >= 702
    autocmd BufWinLeave * call clearmatches()
endif

" Set a character to show for everything BUT whitespace
" 'extends:' and 'precedes:': Show < or > when characters are not displayed on the left or right.
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<

" https://github.com/mileszs/ack.vim#can-i-use-ag-the-silver-searcher-with-this
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

let g:tmuxline_preset = {
    \'a'    : '#S',
    \'b'    : '#W',
    \'c'    : '#H',
    \'win'  : '#I #W',
    \'cwin' : '#I #W',
    \'x'    : '%a',
    \'y'    : '#W %R',
    \'z'    : '#H'}

let g:tmuxline_separators = {
    \ 'left' : '',
    \ 'left_alt': '>',
    \ 'right' : '',
    \ 'right_alt' : '<',
    \ 'space' : ' '}

let g:tmuxline_theme = 'lightline'

" Disable Conceal Behaviour of indentLine plugin
let g:indentLine_setConceal = 0

let g:multi_cursor_quit_key='<C-c>'
nnoremap <C-c> :call multiple_cursors#quit()<CR>

" If set to 0, then pressing g:multi_cursor_quit_key in Visual mode will not quit and delete all existing cursors. This is useful if you want to press Escape and go back to Normal mode, and still be able to operate on all the cursors.
" https://github.com/terryma/vim-multiple-cursors#gmulti_cursor_exit_from_visual_mode-default-1
let g:multi_cursor_exit_from_visual_mode = 0

" If set to 0, then pressing g:multi_cursor_quit_key in Insert mode will not quit and delete all existing cursors. This is useful if you want to press Escape and go back to Normal mode, and still be able to operate on all the cursors.
" https://github.com/terryma/vim-multiple-cursors#gmulti_cursor_exit_from_insert_mode-default-1
let g:multi_cursor_exit_from_insert_mode = 0

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null % 
