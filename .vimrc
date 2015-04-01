" system
set nocompatible
scriptencoding utf-8
set nowritebackup
set nobackup
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
set ignorecase
set smartcase
set wrapscan
set incsearch
nmap <esc><esc> :nohlsearch<cr><esc>
set noerrorbells
set novisualbell
set visualbell t_vb=
set shellslash
set number
set showmatch matchtime=1
set showtabline=2
set expandtab
:set encoding=utf-8
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
" keymap
noremap <down> gj
noremap <up> gk
noremap j gj
noremap k gk
noremap <del> "_d
noremap x "_x
noremap X "_X
noremap <f8> :source %<cr>
noremap <c-n> :bn!<CR>
noremap <c-p> :bp!<CR>
nnoremap <del><del> "_dd
nnoremap <S-del> "_D
nnoremap s i_<ESC>r
nnoremap <Leader>s a_<ESC>r
inoremap <down> <c-o>gj
inoremap <up> <c-o>gk
inoremap <c-down> <c-o><c-e>
inoremap <c-up> <c-o><c-y>
inoremap <c-left> <c-o>b
inoremap <c-right> <c-o>w
inoremap <c-b> <c-o><left>
inoremap <c-f> <c-o><right>
" plugin
if !1 | finish | endif
if has('vim_starting')
        set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc.vim', {
                        \ 'build' : {
                        \     'windows' : 'tools\\update-dll-mingw',
                        \     'cygwin' : 'make -f make_cygwin.mak',
                        \     'mac' : 'make -f make_mac.mak',
                        \     'linux' : 'make',
                        \     'unix' : 'gmake',
                        \    },
                        \}
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/vimfiler.vim'
nnoremap <f4> :VimFilerExplorer<cr>
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'lokaltog/vim-easymotion'
NeoBundle 'rhysd/clever-f.vim'
let clever_f_use_migemo = 1
NeoBundle "tyru/caw.vim.git"
nmap gc <Plug>(caw:i:toggle)
vmap gc <Plug>(caw:i:toggle)
NeoBundle 'mattn/emmet-vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'h1mesuke/vim-alignta'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
call neobundle#end()
filetype plugin indent on
NeoBundleCheck
let g:EasyMotion_keys='abcdefghijklmnopqrstuvwxyz'
let g:EasyMotion_leader_key=";"
nnoremap    [unite]   <nop>
nmap    <space>u [unite]
nnoremap <silent> [unite]b :<c-u>Unite buffer<cr>
nnoremap <silent> [unite]f :<c-u>Unite -buffer-name=files -default-action=tabopen file file/new directory/new<cr>
nnoremap <silent> [unite]r :<c-u>Unite -buffer-name=register register<cr>
nnoremap <silent> [unite]m :<c-u>Unite  -buffer-name=file_mru -default-action=tabopen file_mru<cr>
noremap :<cr> :<c-u>Unite command mapping<cr>
nnoremap <silent> [unite]o : <c-u>Unite -no-quit outline<CR>
let g:acp_enableAtStartup = 0
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
let g:neocomplcache_dictionary_filetype_lists = {
                        \ 'default' : '',
                        \ 'vimshell' : $HOME.'/.vimshell_hist',
                        \ 'scheme' : $HOME.'/.gosh_completions'
                        \ }
if !exists('g:neocomplcache_keyword_patterns')
        let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
        return neocomplcache#smart_close_popup() . "\<CR>"
endfunction
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
set completeopt+=longest
let g:neocomplcache_enable_auto_select = 1
let g:neocomplcache_disable_auto_complete = 1
inoremap <expr><C-n>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"
inoremap <expr><C-p>  pumvisible() ? "\<Up>" : "\<C-x>\<C-u>"
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
if !exists('g:neocomplcache_force_omni_patterns')
        let g:neocomplcache_force_omni_patterns = {}
endif
let g:neocomplcache_force_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_force_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_force_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
let g:neocomplcache_force_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
                        \ "\<Plug>(neosnippet_expand_or_jump)"
                        \: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
                        \ "\<Plug>(neosnippet_expand_or_jump)"
                        \: "\<TAB>"
