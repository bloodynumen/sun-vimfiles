"如果有这行 每行后面会有^m set fileformats=unix
set encoding=utf-8
"解决乱码
set ffs=unix,dos,mac " favor unix ff, which behaves good under bot Winz & Linux 
set fencs=utf-8,ucs-bom,euc-jp,gb18030,gbk,gb2312,cp936 
set fenc=utf-8
if has('win32')
    set termencoding=chinese
    language message zh_CN.UTF-8
endif
"自动加载 修改后自动生效 不需要重启 autoload _vimrc
" Automatic updating vimrc 
autocmd! BufWritePost $MYVIMRC source % 

filetype plugin on 

filetype plugin indent on 

""""""normal syntax settings begin

"Toggle Menu and Toolbar
set guioptions-=m
set guioptions-=T
"map <silent> <F1> :if &guioptions =~# 'T' <Bar>
"        \set guioptions-=T <Bar>
"        \set guioptions-=m <bar>
"    \else <Bar>
"        \set guioptions+=T <Bar>
"        \set guioptions+=m <Bar>
"    \endif<CR>

" Enable syntax highlight
syntax enable

" 关闭 vi 兼容模式
set nocompatible

" 突出显示当前行
"set cursorline              

" Show line number
set nu

" 关闭声音
set noerrorbells
set novisualbell
set t_vb=
set tm=500
set visualbell

" show matching bracets
set showmatch

" Basic editing options
set expandtab
set shiftwidth=4
set softtabstop=4

"au FileType html,python,vim,javascript setl shiftwidth=4
"au FileType html,python,vim,javascript setl tabstop=4
"au FileType java,php setl shiftwidth=4
"au FileType java,php setl tabstop=4
"au FileType snippets setl tabstop=8
au FileType css,scss setl shiftwidth=4
au FileType css,scss setl tabstop=4
autocmd FileType python setlocal et sta sw=4 sts=4

"自动保存
au InsertLeave *.php write
au InsertLeave *.py write

set smarttab
set lbr
set tw=0

"Auto indent
set ai

" Smart indet
set smartindent

" C-style indeting
"set cindent

" Wrap lines
set wrap

"继承前一行的缩进方式，特别适用于多行注释
"set autoindent
"显示括号匹配
set showmatch
"括号匹配显示时间为1(单位是十分之一秒)
set matchtime=1

"上述设置启用了格式化高亮、行号显示，以及括号匹配、自动缩进等编辑功能，对于大多数情况都可以获得理想的编辑体验。不过此时对 .php 文件的支持还不完善，需要下载专门的 php 插件。

" Sets how many lines of history VIM har to remember
set history=400
 
" Set to auto read when a file is changed from the outside
set autoread
 
" Have the mouse enabled all the time:
set mouse=a
 
" Do not redraw, when running macros.. lazyredraw
set lz
 
" set 7 lines to the curors - when moving vertical..
set so=7
 
" The commandbar is 2 high
set cmdheight=2
 
" Change buffer - without saving
set hid
 
" Ignore case when searching
" set ignorecase
set incsearch
 
"将搜索的结果高亮显示，将十分的直观
"开启:
set hlsearch

" Set magic on
set magic
 
" No sound on errors.
set noerrorbells
set novisualbell
set t_vb=
 
" How many tenths of a second to blink
set mat=4
 
" Highlight search things
set hlsearch
 
" Turn backup off
set nobackup
set nowb
set noswapfile

" smart backspace
set backspace=start,indent,eol

" switch buffers with Tab
"map <C-Tab> :bn<CR>
"map <S-Tab> :bp<CR>

" font settings
set guifont=Bitstream\ Vera\ Sans\ Mono:h12:w7

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
"常规界面设置


if has("gui_running")
    set columns=110          " 设置宽
    set lines=35             " 设置长
endif

colorscheme symfony

"fullscreen
au GUIEnter * simalt ~x

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
"自动补全括号 引号

inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {<CR>}<Esc>O
autocmd Syntax html,vim inoremap < <lt>><Esc>i| inoremap > <c-r>=ClosePair('>')<CR>
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap ] <c-r>=ClosePair(']')<CR>
inoremap } <c-r>=CloseBracket()<CR>
inoremap " <c-r>=QuoteDelim('"')<CR>
inoremap ' <c-r>=QuoteDelim("'")<CR>

fun! ClosePair(char)
 if getline('.')[col('.') - 1] == a:char
 return "\<Right>"
 else
 return a:char
 endif
endf

fun! CloseBracket()
 if match(getline(line('.') + 1), '\s*}') < 0
 return "\<CR>}"
 else
 return "\<Esc>j0f}a"
 endif
endf

fun! QuoteDelim(char)
 let line = getline('.')
 let col = col('.')
 if line[col - 2] == "\\"
 "Inserting a quoted quotation mark into the string
 return a:char
 elseif line[col - 1] == a:char
 "Escaping out of the string
 return "\<Right>"
 else
 "Starting a string
 return a:char.a:char."\<Esc>i"
 endif
endf

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
"Vundle
"filetype off
"set rtp+=$VIM./vimfiles/bundle/vundle/
"call vundle#rc('$VIM/vimfiles/bundle/')
"
"" Let Vundle manage Vundle
"Bundle 'gmarik/vundle'
"Bundle 'bufexplorer.zip'
"Bundle 'closetag.vim'
"Bundle 'scrooloose/nerdtree'
"Bundle 'DoxygenToolkit.vim'
"Bundle 'JavaScript-Indent'
"Bundle 'indentpython.vim'
"Bundle 'Lokaltog/vim-powerline.git'
"Bundle 'L9'
"Bundle 'neocomplcache'
"Bundle 'snipMate'
"Bundle 'unite.vim'

filetype plugin indent on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
"pathogen
call pathogen#infect()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
"python
map <F2> :!python.exe %

"python 自动补全插件


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
"JavaScript
"配置缩进插件

let g:SimpleJsIndenter_BriefMode = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
"Powerline 



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" CTags的设定 


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" Tag list (ctags)


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" AutoComplPop



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" neocomplcache
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
let g:neocomplcache_enable_auto_select = 1
" snipMate
let g:neocomplcache_snippets_dir='$VIM/bundle/snipMate/snippets'
" When you input 'ho-a',neocomplcache will select candidate 'a'. 使用unite实现 因最新版的已不支持此特性
"let g:neocomplcache_start_unite_quick_match = 1
" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

"imap <expr> -  pumvisible() ? 
"    \ "\<Plug>(neocomplcache_start_unite_quick_match)" : '-'

" SuperTab like snippets behavior.
"imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<TAB>"
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" BufExplorer
map <C-F4> :BufExplorer<cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" L9
let g:acp_ignorecaseOption = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" NERD Tree 

let NERDChristmasTree=1
let NERDTreeAutoCenter=1
let NERDTreeBookmarksFile=$VIM.'\Data\NerdBookmarks.txt'
let NERDTreeMouseMode=2
let NERDTreeShowBookmarks=1
let NERDTreeShowFiles=1
let NERDTreeShowHidden=1
let NERDTreeShowLineNumbers=1
let NERDTreeWinPos='left'
let NERDTreeWinSize=28
nnoremap tree :NERDTreeToggle
"默认打开 NERD Tree
autocmd VimEnter * NERDTree
"默认新标签页打开 NERD Tree
"autocmd BufRead * 25vsp ./


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
"indent JavaScript indenter (HTML indent is included) 



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
"closetag settings
""使用CTRL-_

let g:closetag_html_style=1 

au Filetype html,xml,xsl source $VIM/vimfiles/bundle/closetag/closetag.vim 


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
"doxygen toolkit 

let g:DoxygenToolkit_briefTag_pre = "@brief "
let g:DoxygenToolkit_paramTag_pre="@param "
let g:DoxygenToolkit_returnTag="@returns "
let g:DoxygenToolkit_licenseTag="GPL 2.0"
let g:DoxygenToolkit_authorName="sunhuai(v_sunhuai@baidu.com)"

map <C-F1> :DoxLic<cr>
map <C-F2> :DoxAuthor<cr>
map <C-F3> :Dox<cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
"SVN settings 

"添加当前文件
map <F4>    :!svn add %<cr>
"更新当前目录的代码
map <F5>    :!svn up <cr>
"提交SVN(当前文件)
map <F6>    :!svn ci -m "" %
"提交SVN(当前目录)
map <F7>    :!svn ci -m "" <cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
"map settings 
map <F9> "*p
