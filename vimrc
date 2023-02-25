let mapleader = " "
nnoremap <leader>ex :Explore<cr>
noremap <leader>% :source %<cr>
noremap H ^
nnoremap L $
inoremap jk <Esc>
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<cr>
nnoremap <leader>% :source %<cr>
"回车即选中当前项
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"             
" 映射切换buffer的键位
nnoremap <leader>p :bp<CR>
nnoremap <leader>n :bn<CR>
" 映射<leader>num到num buffer
inoremap ( ()<ESC>i
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap { {}<ESC>i
inoremap } <c-r>=ClosePair('}')<CR>
inoremap [ []<ESC>i
inoremap ] <c-r>=ClosePair(']')<CR>
inoremap " ""<ESC>i
inoremap ' ''<ESC>i
function! ClosePair(char)
	if getline('.')[col('.') - 1] == a:char
		return "\<Right>"
	else
		return a:char
	endif
endfunction

"colorscheme habamax  
"set pythonthreedll=python39.dll
filetype on " 侦测文件类型
filetype plugin indent on 
syntax on
syntax enable
set syntax=on " 语法高亮

set autoread " 设置当文件被改动时自动载入
set autowrite "自动保存
set completeopt=preview,menu  "代码补全 
set clipboard=unnamed  "共享剪贴板  
set nobackup "禁止生成临时文件
"set makeprg=g++\ -Wall\ \ %\ -g "make 运行
set ruler                   " 打开状态栏标尺
set cursorline              " 突出显示当前行
set magic                   " 设置魔术
"set guioptions-=T           " 隐藏工具栏
"set guioptions-=m           " 隐藏菜单栏
set foldcolumn=0
set foldmethod=indent		"利用缩进折叠代码 
set foldlevel=8
set foldenable              " 开始折叠
set noeb " 去掉输入错误的提示声音
set confirm " 在处理未保存或只读文件的时候，弹出确认
set autoindent " 自动缩进
set cindent
set tabstop=4 " Tab键的宽度
set softtabstop=4 " 统一缩进为4
set shiftwidth=4
set noexpandtab " 不要用空格代替制表符
set smarttab " 在行和段开始处使用制表符
set number " 显示行号
set history=10000 " 历史记录数
set noswapfile 
set ignorecase "搜索忽略大小写
set hlsearch "搜索逐字符高亮
set gdefault "行内替换
set enc=utf-8 "编码设置
set termencoding=utf-8 "屏幕显示的编码
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set langmenu=en
"set helplang=cn
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")} " 我的状态行显示的内容（包括文件类型和解码）
"set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%]
set laststatus=2 " 总是显示状态行
set cmdheight=2 " 命令行（在状态行下）的高度，默认为1，这里是2
"set viminfo+=! " 保存全局变量
set iskeyword+=_,$,@,%,#,- " 带有如下符号的单词不要被换行分割
set linespace=0 " 字符间插入的像素行数目
set wildmenu " 增强模式中的命令行自动完成操作
set backspace=2 " 使回格键（backspace）正常处理indent, eol, start等
"set backspace=indent,eol,start
"
set whichwrap+=<,>,h,l " 允许backspace和光标键跨越行边界
set mouse=a " 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
set selection=exclusive
set selectmode=mouse,key
set report=0 " 通过使用: commands命令，告诉我们文件的哪一行被改变过
set fillchars=vert:\ ,stl:\ ,stlnc:\  " 在被分割的窗口间显示空白，便于阅读
set showmatch " 高亮显示匹配的括号
set matchtime=1 " 匹配括号高亮的时间（单位是十分之一秒）
set scrolloff=4 " 光标移动到buffer的顶部和底部时保持3行距离
set smartindent " 为C程序提供自动缩进
"source $VIMRUNTIME/delmenu.vim
"source $VIMRUNTIME/menu.vim
"au BufRead,BufNewFile *  setfiletype txt " 高亮显示普通txt文件（需要txt.vim脚本）
set completeopt=longest,menu "打开文件类型检测, 加了这句才可以用智能补全
set nocompatible "不要使用vi的键盘模式，而是vim自己的
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"set diffexpr=MyDiff()

let g:netrw_preview           = 1
set fileencodings=utf-8,gbk,big5

" quickfix模式
autocmd FileType c,cpp map <buffer> <leader>cr :w<cr>:call CompileRun()<cr>:call Run()<cr>
"定义CompileRun函数，用来调用进行编译和运行
function! CompileRun()
	exec "w"
	"C程序
	if &filetype == 'c' 
		exec "!gcc -Wall % -g -o %<.exe" 
		"c++程序 
	elseif &filetype == 'cpp' 
		exec "!g++ -Wall % -g -o %<.exe" 
		"Java程序
elseif &filetype == 'java' 
		exec "!javac %" 
	endif 
endfunc

"定义Run函数
function! Run() 
	if &filetype == 'c' || &filetype == 'cpp' 
		exec "!%<.exe" 
	elseif &filetype == 'java' 
		exec "!java %<" 
	endif 
endfunc

"定义Debug函数，用来调试程序 
function! Debug() 
	exec "w" 
	"C程序 
	if &filetype == 'c' 
		exec "!gcc % -g -o %<.exe" 
		exec "!gdb %<.exe" 
	elseif &filetype == 'cpp' 
		exec "!g++ % -g -o %<.exe" 
		exec "!gdb %<.exe" 
		"Java程序 
	elseif &filetype == 'java' 
		exec "!javac %" 
		exec "!jdb %<" 
	endif 
endfunc
"结束定义Debug
"设置程序的运行和调试的快捷键F5和Ctrl-F5 
map <F5> :call CompileRun()<CR> 
map <F6> :call Run()<CR> 
map <C-F5> :call Debug()<CR>
map <C-1> :!cmd<CR>

"""=>在shell脚本开头自动增加解释器以及作者等版权信息<="""
"新建.py,.cc,.sh,.java文件，自动插入文件头"
autocmd BufNewFile *.py,*.cc,*.sh,*.java,*.cpp,*.c exec ":call SetTitle()"
"定义函数SetTitle，自动插入文件头"
function! SetTitle()
	if expand ("%:e") == 'sh'
		call setline(1, "!/bin/bash")
		call setline(2, "#Author:LvXudong")
		call setline(3, "#Time:".strftime("%Y 年 %b %d日 %X"))
		call setline(4, "#Name:".expand("%"))
		call setline(5, "#Version:V1.0")
		call setline(6, "#Description:This is a production script.")
	elseif expand ("%:e") == 'cpp' || expand ("%:e") == 'c' 
		call setline(1, "//Author:LvXuDong")
		call setline(2, "//Blog:lxd_ls")
		call setline(3, "//Time:".strftime("%Y 年 %b %d日 %X"))
		call setline(4, "//Name:".expand("%")) 
	else
		call setline(1, "//Author:LvXuDong")
		call setline(2, "//Blog:lxd_ls")
		call setline(3, "//Time:".strftime("%Y 年 %b %d日 %X"))
		call setline(4, "//Name:".expand("%")) 
	endif

endfunc

" The default vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2022 Mar 03
"
" This is loaded if no vimrc file was found.
" Except when Vim is run with "-u NONE" or "-C".
" Individual settings can be reverted with ":set option&".
" Other commands can be reverted as mentioned below.

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Bail out if something that ran earlier, e.g. a system wide vimrc, does not
" want Vim to use these default values.
if exists('skip_defaults_vim')
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
" Avoid side effects when it was already reset.
if &compatible
  set nocompatible
endif

" When the +eval feature is missing, the set command above will be skipped.
" Use a trick to reset compatible only when the +eval feature is missing.
silent! while 0
  set nocompatible
silent! endwhile

" Allow backspacing over everything in insert mode.

set showcmd		" display incomplete commands
set ttimeout		" time out for key codes
set ttimeoutlen=100	" wait up to 100ms after Esc for special key

" Show @@@ in the last line if it is truncated.
set display=truncate

" Do incremental searching when it's possible to timeout.
if has('reltime')
  set incsearch
endif

" Do not recognize octal numbers for Ctrl-A and Ctrl-X, most users find it
" confusing.
set nrformats-=octal

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries.
if has('win32')
  set guioptions-=t
endif

" Don't use Q for Ex mode, use it for formatting.  Except for Select mode.
" Revert with ":unmap Q".
map Q gq
sunmap Q

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
" Revert with ":iunmap <C-U>".
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine.  By enabling it you
" can position the cursor, Visually select and scroll with the mouse.
" Only xterm can grab the mouse events when using the shift key, for other
" terminals use ":", select text and press Esc.
if has('mouse') 
	if &term =~ 'xterm' 
		set mouse=a 
	else 
		set mouse=nvi
	endif
endif

" Only do this part when Vim was compiled with the +eval feature.
if 1

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  " Revert with ":filetype off".
  filetype plugin indent on

  " Put these in an autocmd group, so that you can revert them with:
  " ":augroup vimStartup | exe 'au!' | augroup END"
  augroup vimStartup
    au!

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid, when inside an event handler
    " (happens when dropping a file on gvim) and for a commit message (it's
    " likely a different one than last time).
    autocmd BufReadPost *
      \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
      \ |   exe "normal! g`\""
      \ | endif

  augroup END

  " Quite a few people accidentally type "q:" instead of ":q" and get confused
  " by the command line window.  Give a hint about how to get out.
  " If you don't like this you can put this in your vimrc:
  " ":augroup vimHints | exe 'au!' | augroup END"
  augroup vimHints
    au!
    autocmd CmdwinEnter *
	  \ echohl Todo | 
	  \ echo 'You discovered the command-line window! You can close it with ":q".' |
	  \ echohl None
  augroup END

endif

" Switch syntax highlighting on when the terminal has colors or when using the
" GUI (which always has colors).
if &t_Co > 2 || has("gui_running")
  " Revert with ":syntax off".
  syntax on

  " I like highlighting strings inside C comments.
  " Revert with ":unlet c_comment_strings".
  let c_comment_strings=1
endif

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
" Revert with: ":delcommand DiffOrig".
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

if has('langmap') && exists('+langremap')
  " Prevent that the langmap option applies to characters that result from a
  " mapping.  If set (default), this may break plugins (but it's backward
  " compatible).
  set nolangremap
endif
