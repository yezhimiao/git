set nocompatible
filetype off

set nocompatible              " be iMproved, required
"set runtimepath+=~/.vim/plugged
" set the runtime path to include Vundle and initialize
call plug#begin('~/.vim/plugged')
"INSTALLATION DES PLUGIN"""""""""""""""""""""
Plug 'Yggdroot/LeaderF'
Plug 'junegunn/vim-easy-align'
Plug 'skywind3000/quickmenu.vim'
Plug 'skywind3000/asyncrun.vim'
Plug 'luochen1990/rainbow'
Plug 'Valloric/YouCompleteMe' , { 'for':'cpp' }
Plug 'w0rp/ale'
Plug 'scrooloose/nerdtree'
Plug 'jmoon018/PacVim'
Plug 'vim-scripts/ShowTrailingWhitespace'
Plug 'flazz/vim-colorschemes'

"INSTALLATION DES PLUGIN"""""""""""""""""""""
call plug#end()
"let g:sierra_Sunset = 1
"let g:sierra_Twilight = 1
"let g:sierra_Midnight = 1
let g:sierra_Pitch = 1
colorscheme sierra


set number
set relativenumber
syntax on

set showmode
set showcmd
set mouse=a
set encoding=utf-8
set t_Co=256
set tabstop=4
set shiftwidth=4
set cursorline
set laststatus=2
set ruler
set showmatch
set nobackup
set noswapfile
set noerrorbells
set novisualbell
set autoindent
set softtabstop=4
set backspace=2
set autochdir
set wildmenu
set wildmode=list:longest,full
set scrolloff=10

set foldenable
set foldmethod=indent
set foldcolumn=0
setlocal foldlevel=1
set foldclose=all
nnoremap za @((foldclosed(line('.))<0?'zc':'zo')<CR>

let mapleader = ","

inoremap jk <esc>

"Quickly close or save the current window
nnoremap <leader>q : q<CR>
nnoremap <leader>w : w<CR>
map <C-A> <Esc>ggVG
map <C-X> d
map <C-c> y

set cinoptions={0,1s,t0,n-2,p2s,(03s,=,.5S,>1s,=1s,:1s
set showmatch
set nobackup
set fileformats=unix
set encoding=utf-8
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'cpp'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'java'
		exec "!javac %"
		exec "!time java %<"
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		exec "!time python2.7 %"
    elseif &filetype == 'html'
        exec "!firefox % &"
    elseif &filetype == 'go'
        exec "!go build %<"
        exec "!time go run %"
    elseif &filetype == 'mkd'
        exec "!~/.vim/markdown.pl % > %.html &"
        exec "!firefox %.html &"
	endif
endfunc
let python_highlight_all=1

autocmd BufNewFile *.py exec ":call AutoSerFileHead()"
function! AutoSetFileHead()
	if &filetype == 'python'
		call setline(1, "\#!usr/bin/env python")
		call append(1, "\# encoding: utf-8")
	endif
	normal G
	normal o
	normal o
endfunc


let g:rainbow_active=1

let g:ale_linters_explicit=1
let g:ale_completion_delay=500
let g:ale_echo_delay=20
let ale_lint_delay=500
let g:ale_echo_msg_format='[%linter%] %code: %%s'
let g:ale_lint_on_text_changed='normal'
let g:ale_lint_on_insert_leave=1
let g:airline#extensions#ale#enable=1

let g:ale_c_gcc_options='-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options='-Wall -O2 -std=c++14'
let g:ale_c_cppcheck_options=''
let g:ale_c_cppcheck_options=''

let g:ale_sign_error="\ue009\ue009"
hi! clear SpellBad
hi! clear SpellCap
hi! clear SpellRare
hi! SpellBad gui=undercurl guisp=red
hi! SpellCap gui=undercurl guisp=blue
hi! SpellRara gui=undercurl guisp=magenta

let g:ycm_semantic_triggers = {'c,cpp,python': ['re!\w{2}']}
highlight PMenu ctermfg=0 ctermbg=242 guifg=black guibg=darkgrey
highlight PMenuSel ctermfg=242 ctermbg=8 guifg=darkgrey guibg=black

let g:ycm_add_preview_tp_completeopt=0
"let g:ycm_show_diagnostics_ui=0
let g:ycm_server_log_level='info'

"let g:ycm_server_keep_logfiles=1
let g:ycm_min_num_identifier_candidate_chars=2
let g:ycm_collect_identifiers_from_comments_and_strings=1
let g:ycm_complete_in_strings=1
let g:ycm_key_invoke_completion='<c-z>'

set completeopt=menu,menuone

noremap <c-z> <NOP>
let g:ycm_semantic_triggers={
\'c,cpp,pythonl':['re!\w{2]']
	\}


autocmd BufReadPost *
	\if line("'\"") > 1 && line("'\"") <= line("$") |
	\	exe "normal! g`\"" |
	\endif

map <C-n> : NERDTreeToggle<CR>
nnoremap <leader>ds :%s/\s\+$//<CR>


if !exists('g:override_spf13_bundles') && filereadable(expand("~/.vim/bundle/vim-colors-solarized.vim"))
	let g:solarized_termcolors=256
	let g:solarized_termtrans=1
	let g:solarized_contrast="normal"
	let g:solarized_visibility="normal"
	color solarized
endif




