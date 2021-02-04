" Configuration file for vim
set modelines=0		" CVE-2007-2438

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=2		" more powerful backspacing

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup nobackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup nobackup

let skip_defaults_vim=1

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif




" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)
"set title               "display title on the top window
"set nu                  "display line number
"set hlsearch            "highlight search


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"My configuration 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""general setups"""""""


syntax on

set title               "display title on the top of window
set nu                  "display line number
set hlsearch            "highlight search
set incsearch           "Incremental search
set redrawtime=10000    "To ensure syntax highlighting always works on large files
set ignorecase          " case insensative matching
set wildmenu            " command mode auto completion
set wildmode=longest,list "Complete longest common string, then list alternatives.
set autoread
set clipboard=unnamed
set autowrite
set ruler
set cursorline
"hi cursorline cterm=underline " set cursorline style
set magic
set foldcolumn=0
set foldmethod=manual
set foldlevel=3
"set foldenable
set noeb
set confirm
set autoindent
set smartindent
set cindent
set expandtab  "To insert space characters whenever the tab key is pressed
set tabstop=4  "number of space characters that will be inserted when the tab key is pressed
set shiftwidth=4  "To change the number of space characters inserted for indentation
set smarttab
set history=1000
set nobackup
set noswapfile
set gdefault
set enc=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set langmenu=zh_CN.UTF-8
set helplang=cn
set viminfo+=!
set iskeyword+=_,$,@,%,#,-
set linespace=0
set backspace=2
set whichwrap+=<,>,h,l
set mouse=a
set selection=exclusive
set selectmode=mouse,key
set report=0
set fillchars=vert:\ ,stl:\ ,stlnc:\
set showmatch
set matchtime=1
set scrolloff=3
set completeopt=longest,menu    " Options for Insert mode completion





" <Leader> and <LocalLeder>
let mapleader="'"
let maplocalleader=";"   " used by vimtex

"combination of |filetype on|, |filetype plugin on| and |filetype indent on|
filetype plugin indent on

"highlight Comment cterm=italic   " font of comment(the font should support italic)
highlight comment cterm=NONE


""""""""""""""""""""""""""""""""
"  plugin manager  vim-plug    "
""""""""""""""""""""""""""""""""


call plug#begin('~/.vim/plugged')







Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"Tab key can be used for multiple selection in History session


" language server protocal
"Plug 'prabirshrestha/vim-lsp'
"Plug 'mattn/vim-lsp-settings'




"markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
let g:vim_markdown_math = 1
let g:vim_markdown_no_default_key_mappings = 1
" Disable conceal for code fences.
let g:vim_markdown_conceal_code_blocks = 0







Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_theme='bubblegum'
let g:airline_powerline_fonts = 1

" airline设置
" 开启tabline
let g:airline#extensions#tabline#enabled = 1
" tabline中当前buffer两端的分隔字符
let g:airline#extensions#tabline#left_sep = ' '
" tabline中未激活buffer两端的分隔字符
let g:airline#extensions#tabline#left_alt_sep = ' '
" tabline中buffer显示编号
let g:airline#extensions#tabline#buffer_nr_show = 1
"do not make statistics for whitespaces and tabs
let g:airline#extensions#whitespace#enabled = 0

" 映射切换buffer的键位
nnoremap [b :bp<CR>
nnoremap ]b :bn<CR>


"make tags 
Plug 'majutsushi/tagbar'
nmap <F3> :TagbarToggle<CR>


"make structure tree 
Plug 'scrooloose/nerdtree'
map <F2> :NERDTreeToggle<CR>


"format
Plug 'Chiel92/vim-autoformat'



"""youcompleteme[

Plug 'ycm-core/YouCompleteMe'
let g:ycm_collect_identifiers_from_tags_files = 1           " 开启 YCM基于标签引擎
let g:ycm_collect_identifiers_from_comments_and_strings = 1 " 注释与字符串中的内容也用于补全
let g:ycm_seed_identifiers_with_syntax = 1                  " 语法关键字补全
let g:ycm_confirm_extra_conf = 0                            " 关闭加载.ycm_extra_conf.py提示
let g:ycm_key_list_select_completion = ['<Down>']           "remap completion keys 
let g:ycm_key_list_previous_completion = ['<Up>']           ""
let g:ycm_key_list_stop_completion = ['<Enter>']            " close the ycm selection box by pressing enter key
let g:ycm_complete_in_comments = 1                          " 在注释输入中也能补全
let g:ycm_complete_in_strings = 1                           " 在字符串输入中也能补全
let g:ycm_show_diagnostics_ui = 0                           
"nnoremap <c-j> :YcmCompleter GoToDefinitionElseDeclaration<CR>     "跳转到定义处
let g:ycm_min_num_of_chars_for_completion=2                "after how many letters to start comletion
let g:ycm_autoclose_preview_window_after_completion = 1     
let g:ycm_disable_for_files_larger_than_kb = 5000
let g:ycm_add_preview_to_completeopt = 1 "When this option is set to 1, YCM will add the preview string to Vim's completeopt option
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_use_ultisnips_completer = 1
"""] end ycm




"""snippets[

"snippets engine
Plug 'SirVer/ultisnips'
let g:UltiSnipsEditSplit='tabdo'
" Trigger configuration. 
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
"" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"


" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'  " many languages are supported



""" ]end snippets


" dealing with surounding pairs
Plug 'tpope/vim-surround'



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" auto closing pairs
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Plug 'jiangmiao/auto-pairs'
" re-specify pairs
let g:AutoPairs = {'(':')', '[':']', '{':'}','"':'"'}




" Color scheme[
Plug 'joshdick/onedark.vim'
Plug 'rakr/vim-one'
Plug 'lifepillar/vim-solarized8'
Plug 'junegunn/seoul256.vim'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
"] end color scheme


call plug#end()











""""""""""""""""""""""""""""""""""""""""""
"  configuration for specified filetype  "
""""""""""""""""""""""""""""""""""""""""""

"[ begin fortran
augroup fortran_settings
autocmd!
    autocmd BufRead,BufNewFile *.f let fortran_fixed_source=1
    autocmd BufRead,BufNewFile *.for let fortran_fixed_source=1
    autocmd BufRead,BufNewFile *.F let fortran_fixed_source=1
    autocmd BufRead,BufNewFile *.f90 let fortran_free_source=1
augroup end

let fortran_do_enddo=1
let fortran_have_tabs=1
let fortran_more_precise=1
"] end fortran





" automatically change working directory to the path to current file. but /tmp is
" excluded. 
autocmd BufEnter * if expand("%:p:h") !~ '^/tmp' | silent! lcd %:p:h | endif



"---------------------------------------------------------------------------
" helper functions
"---------------------------------------------------------------------------
" get the highlight group of one under cursor. Run [:call SynStack] in command
" mode to invoke this function.
function! SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc



"-----------------------------------------------------



"If you want to match colors in vim and in your terminal exactly, you must enable true colors (24 bit).
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
"vim color scheme
colorscheme onehalfdark
