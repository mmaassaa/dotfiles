set nocompatible
scriptencoding utf-8

"--------------------------------
" system
"--------------------------------
set nf=alpha
set nowritebackup
set nobackup
"set directory=~/.vim/tmp/swp
"set backupdir=~/.vim/tmp/backup
set clipboard+=unnamed
set timeout timeoutlen=3000 ttimeoutlen=100
set hidden
set history=50
set formatoptions+=mm
set virtualedit=block
set whichwrap=b,s,[,],<,>,~
set backspace=indent,eol,start
set ambiwidth=double
set wildmenu
set autochdir
"set nofoldenable
"set foldmethod=syntax
"set foldopen=all
"set foldlevel=11
"set foldnestmax=10
"set foldcolumn=1

"--------------------------------
" search
"--------------------------------
set ignorecase
set smartcase
set wrapscan
set incsearch
set hlsearch
nmap <esc><esc> :nohlsearch<cr><esc>

"--------------------------------
" display
"--------------------------------
set number
set showmatch matchtime=1
set showtabline=2
nnoremap <c-s-tab> :tabprevious<cr>
nnoremap <c-tab>   :tabnext<cr>
inoremap <c-s-tab> <esc>:tabprevious<cr>i
inoremap <c-tab>   <esc>:tabnext<cr>i
set expandtab
augroup vimrc
autocmd filetype perl setlocal shiftwidth=4 tabstop=2 softtabstop=2
autocmd filetype html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd filetype css  setlocal shiftwidth=4 tabstop=2 softtabstop=2
augroup end
set autoindent
set smartindent
set cindent
set cinoptions+=:0
set title
set laststatus=2
set showcmd
set display=lastline
set list
set lcs=tab:>.,trail:_,extends:\
syntax on

"--------------------------------
" statusline
"--------------------------------
set statusline=%<
set statusline=%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}
set statusline+=%m
set statusline+=%r
set statusline+=%h
set statusline+=%w
set statusline+=%y
set statusline+=\ 
set statusline+=%F
set statusline+=%=
set statusline+=(%l/%L,%v)
set statusline+=[ASCII=\%03.3b]

"--------------------------------
" keymap
"--------------------------------
noremap <down> gj
noremap <up> gk
noremap j gj
noremap k gk
noremap <del> "_d
noremap x "_x
noremap X "_X
nnoremap <del><del> "_dd
nnoremap <S-del> "_D
nnoremap <CR> o<ESC>
inoremap <down> <c-o>gj
inoremap <up> <c-o>gk
inoremap <c-down> <c-o><c-e>
inoremap <c-up> <c-o><c-y>
inoremap <c-left> <c-o>b
inoremap <c-right> <c-o>w

"--------------------------------
" etc
"--------------------------------
if !has('gui_running')
        if has('mouse')
                set mouse=
        endif
endif

if &term =~ "screen"
        let &t_SI .= "\eP\e[<r\e\\"
        let &t_EI .= "\eP\e[<s\e[<0t\e\\"
        let &t_te .= "\eP\e[<0t\e[<s\e\\"
        set timeoutlen=100
elseif &term =~ "xterm" || &term =~ "xterm-256color"
        let &t_SI .= "\e[<r"
        let &t_EI .= "\e[<s\e[<0t"
        let &t_te .= "\e[<0t\e[<s"
        set timeoutlen=100
endif

