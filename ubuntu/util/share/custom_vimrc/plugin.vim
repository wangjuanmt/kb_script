" Be iMproved, required
set nocompatible

" Required
filetype off

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" Let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" Plugins on GitHub repo

" https://github.com/tpope/vim-fugitive
Plugin 'tpope/vim-fugitive'

" https://github.com/airblade/vim-gitgutter
Plugin 'airblade/vim-gitgutter'

" https://github.com/altercation/vim-colors-solarized
Plugin 'altercation/vim-colors-solarized'

" https://github.com/joshdick/onedark.vim
Plugin 'joshdick/onedark.vim'

" https://github.com/sheerun/vim-polyglot
Plugin 'sheerun/vim-polyglot'

" https://github.com/itchyny/lightline.vim
Plugin 'itchyny/lightline.vim'

" https://github.com/scrooloose/nerdtree
Plugin 'scrooloose/nerdtree'

" https://github.com/jistr/vim-nerdtree-tabs
Plugin 'jistr/vim-nerdtree-tabs'

" https://github.com/Xuyuanp/nerdtree-git-plugin
Plugin 'Xuyuanp/nerdtree-git-plugin'

" https://github.com/edkolev/tmuxline.vim
Plugin 'edkolev/tmuxline.vim'

" https://github.com/ctrlpvim/ctrlp.vim
Plugin 'ctrlpvim/ctrlp.vim'

" https://github.com/terryma/vim-multiple-cursors
Plugin 'terryma/vim-multiple-cursors'

" https://github.com/pangloss/vim-javascript
Plugin 'pangloss/vim-javascript'

" https://github.com/dyng/ctrlsf.vim
Plugin 'dyng/ctrlsf.vim'

" https://github.com/mileszs/ack.vim
Plugin 'mileszs/ack.vim'

" https://github.com/gabrielelana/vim-markdown
Plugin 'gabrielelana/vim-markdown'

" https://github.com/Yggdroot/indentLine
Plugin 'Yggdroot/indentLine'

" All of your Plugins must be added before the following line
" Required
call vundle#end()
" Required
filetype plugin indent on

" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

