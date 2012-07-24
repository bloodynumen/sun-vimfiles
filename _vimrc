"解决乱码
set fileencodings=utf-8,gb2312,gbk,gb18030
set termencoding=utf-8
"如果有这行 每行后面会有^m set fileformats=unix
set encoding=prc

"自动加载 修改后自动生效 不需要重启 autoload _vimrc
" Automatic updating vimrc 
autocmd! BufWritePost $MYVIMRC source % 

filetype plugin on 

filetype plugin indent on 

""""""normal syntax settings begin

"Toggle Menu and Toolbar
set guioptions-=m
set guioptions-=T
map <silent> <F1> :if &guioptions =~# 'T' <Bar>
        \set guioptions-=T <Bar>
        \set guioptions-=m <bar>
    \else <Bar>
        \set guioptions+=T <Bar>
        \set guioptions+=m <Bar>
    \endif<CR>

" Enable syntax highlight
syntax enable

" 关闭 vi 兼容模式
set nocompatible

" 突出显示当前行
"set cursorline              

" Show line number
set nu

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
 
"将搜索的家国高亮显示，将十分的直观
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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
"常规界面设置


if has("gui_running")
    set columns=110          " 设置宽
    set lines=35             " 设置长
endif

colorscheme ansi_blows

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
"python
map <F2> :!python.exe %

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
"JavaScript
"配置缩进插件
let g:SimpleJsIndenter_BriefMode = 1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" CTags的设定 

"生成一个tags文件
"nmap <F8> <Esc>:!ctags -R *<CR>
" 按照名称排序 
let Tlist_Sort_Type = "name" 
" 在右侧显示窗口 
let Tlist_Use_Right_Window = 1 
" 压缩方式 Remove extra information and blank lines from the taglist window. 
let Tlist_Compact_Format = 1 
" 如果只有一个buffer，kill窗口也kill掉buffer 
let Tlist_Exit_OnlyWindow = 1 
"auto open Tlist when vim open 
let Tlist_Auto_Open = 0 
" 不要显示折叠树 
let Tlist_Enable_Fold_Column = 1
" taglist 窗口宽度 
let Tlist_WinWidth = 22 
" no inc the width of the windows 
let Tlist_Inc_Winwidth = 1 
" Close tag folds for inactive buffers. 
let Tlist_File_Fold_Auto_Close = 1 
"To process files even when the taglist window is not open. 
let Tlist_Process_File_Always = 1 
"display the tags defined only in the current buffer 
let Tlist_Show_One_File = 1 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" Tag list (ctags)

let Tlist_Ctags_Cmd = 'ctags'
"不同时显示多个文件的tag，只显示当前文件的
let Tlist_Show_One_File = 1          
"如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Exit_OnlyWindow = 1
"在右侧窗口中显示taglist窗口 
let Tlist_Use_Right_Window = 1         
"显示taglist菜单 
let Tlist_Show_Menu = 1
"启动vim自动打开taglist
"let Tlist_Auto_Open = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 


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
let NERDTreeWinSize=31
nnoremap f :NERDTreeToggle
"默认打开 NERD Tree
"autocmd VimEnter * NERDTree

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
"SVN settings 

"更新当前目录的代码
map <F5>    :!svn up <cr>
"提交SVN(当前文件)
map <F6>    :!svn ci -m "" %<cr>
"提交SVN(当前目录)
map <F7>    :!svn ci -m "" <cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
