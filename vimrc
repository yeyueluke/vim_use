syntax on
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-scripts/taglist.vim'
Plugin 'git://github.com/scrooloose/nerdtree.git'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
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
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
set tabstop=4
set expandtab
set autoindent
" set softtabstop=4
set shiftwidth=4
set showmatch
set number
set hlsearch
set incsearch

" cscope setting
if has("cscope")
	set csto=0
	set cst
	set nocsverb
" add any database in current directory
	if filereadable("cscope.out")
		cs add cscope.out
    " else add database pointed to by environment
    elseif $CSCOPE_DB != ""
		cs add $CSCOPE_DB
	endif
	set csverb
endif

" Tlist setting
map <F4> :TlistToggle<CR>
"   auto close Tlist if there is only one window
let Tlist_Exit_OnlyWindow = 1

" NERDTree setting
map <F2> :NERDTreeToggle<CR>
"   auto close NERDTree if there is only one window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>

" let g:neocomplcache_enable_at_startup = 1
" let g:neocomplcache_min_keyword_length = 3
" let g:neocomplcache_enable_smart_case = 1
let g:ycm_error_symbol = '✗'  "set error or warning signs
let g:ycm_warning_symbol = '⚠'
highlight YcmErrorSign ctermfg=red
highlight YcmErrorSection ctermfg=white
highlight YcmWarningSign ctermbg=yellow
highlight YcmWarningSection ctermbg=white
"highlight YcmErrorLine
"highlight YcmWarningLine

" Show trailing whitepace and spaces before a tab:
:highlight ExtraWhitespace ctermbg=red guibg=red
:autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/
" auto remove leading and trailing whitespace when save
:autocmd BufWritePre * :%s/\s\+$//e
" using :retab to change tab to space*4
