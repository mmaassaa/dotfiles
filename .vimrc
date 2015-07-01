let mapleader = ";"
set nocompatible
set fileformats=unix,dos,mac
set vb t_vb=
set backspace=indent,eol,start
set nobackup
set writebackup
set history=100
set ignorecase
set smartcase
set wrapscan
set noincsearch
set title
set nonumber
set showcmd
set laststatus=2
set showmatch
set matchtime=2
syntax on
set hlsearch
highlight Comment ctermfg=Grey
set wildmenu
set textwidth=0
set wrap
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
match ZenkakuSpace /　/
set statusline=%n\:%y%F\ \|%{(&fenc!=''?&fenc:&enc).'\|'.&ff.'\|'}%m%r%=<%l/%L:%p%%>
highlight StatusLine   term=NONE cterm=NONE ctermfg=black ctermbg=white
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set noautoindent
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,ucs-bom,euc-jp,cp932,iso-2022-jp
set fileencodings+=,ucs-2le,ucs-2
set hidden
set shortmess+=I
set formatoptions-=ro
set showtabline=2
set textwidth=0
noremap j gj
noremap k gk
nnoremap <del> "_d
nnoremap x "_x
nnoremap X "_X
nnoremap <del><del> "_dd
nnoremap <S-del> "_D
nnoremap <unique> <Leader>t :tabnew<Space>
nnoremap <unique> <silent> <Leader>w :tabclose<CR>

"" Vundle configure
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'gmarik/vundle'
" Plugins
Plugin 'Lokaltog/vim-easymotion'
Plugin 'tpope/vim-fugitive'
Plugin 'rstacruz/sparkup'
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'vim-scripts/AutoComplPop'
Plugin 'vim-scripts/L9'
Plugin 'vim-scripts/FuzzyFinder'
call vundle#end()            " required
filetype plugin indent on    " required

"" Plugin keymap
" easymotion
let g:EasyMotion_leader_key = 's'
" FuzzyFinder
nnoremap <unique> <silent> <Leader>fb :FufBuffer!<CR>
nnoremap <unique> <silent> <Leader>ff :FufFile!<CR>
nnoremap <unique> <silent> <Leader>fm :FufMruFile!<CR>
"nnoremap <unique> <silent> <Leader>fc :FufRenewCache<CR>
let g:fuf_patternSeparator = ' '
let g:fuf_modesDisable = ['mrucmd']
let g:fuf_mrufile_exclude = '\v\.DS_Store|\.git|\.swp|\.svn'
let g:fuf_mrufile_maxItem = 100
let g:fuf_enumeratingLimit = 20
let g:fuf_file_exclude = '\v\.DS_Store|\.git|\.swp|\.svn'
