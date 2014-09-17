" See: http://vimdoc.sourceforge.net/htmldoc/options.html for details

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"=> General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"设定 gvim 运行在增强模式下,不使用vi的键盘模式
set nocompatible

"设置支持多语言,解决乱码
"设置内部编码为utf-8
set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8,gbk,default,latin1

"解决consle输出乱码
language messages zh_CN.utf-8

"帮助菜单语言
set helplang=cn

" Sets how many lines of history VIM has to remember
set history=700

" Enable filetype plugins
filetype off	"required
"filetype plugin on
"filetype indent on
filetype plugin indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Set 7 lines to the cursor - when moving vertically using j/k
"光标离上下边界7行时开始滚屏
set so=7

" Turn on the Wild menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
    set wildignore+=.git\*,.hg\*,.svn\*
endif

" Height of the command bar
set cmdheight=2


" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Following line clears the search highlights when pressing Lb
nnoremap <leader>/ :nohlsearch<CR>

"Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax on 

try
    colorscheme desert
catch
endtry

set background=dark

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions+=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Use Unix as the standard file type
set ffs=unix,dos,mac


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

set tabstop=4
set shiftwidth=4
"对于不同类型的文件，进行自定义设置
au FileType html,im,javascript,css set shiftwidth=2
au FileType html,im,javascript,css set tabstop=2
au FileType java,python,php set shiftwidth=4
au FileType java,python,php set tabstop=4

"设置每行的最大字符数，超过的话，将换行
set textwidth=80

" Linebreak on 500 characters
set lbr
set tw=500

set ai    "Auto indent
set si    "Smart indent
set wrap  "Wrap lines

" for golang
set omnifunc=syntaxcomplete#Complete

""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
"vnoremap <silent> * :call VisualSelection('f')<CR>
"vnoremap <silent> # :call VisualSelection('b')<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Moving Between Windows
nnoremap <Leader>h <C-w>h
nnoremap <Leader>l <C-w>l
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ \ \ \ \line:\%-14.(%l,%c%V%)\ %P


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
map 0 ^
map 9 $

" type S, then type what you're looking for, a /, and what to replace it with
nmap S :%s/<C-R><C-W>\>//g<LEFT><LEFT>
vmap S :s/<C-R><C-W>\>//g<LEFT><LEFT>


"基本编辑器设置
set number          "显示行号
set laststatus=2    "显示状态栏 (默认值为 1, 无法显示状态栏)
set cmdheight=1     "设定命令行的行数为 1

"set showtabline=2   "显示tab标签
"set tabline+=%f     "tab标签
" Enable Code Folding
set foldenable
set foldmethod=syntax
set mouse=a         "任何情况都可以使用鼠标

"工作目录随文件变
autocmd BufEnter * cd %:p:h
"不显示工具条
set guioptions-=T

" 配置文件.vimrc更改后自动重新载入使设置生效
autocmd! bufwritepost .vimrc source ~/.vimrc 
"设置重新载入.vimrc快捷键
map <silent> <leader>ss :source ~/.vimrc<cr>
" 设置快速编辑.vimrc快捷键
map <silent> <leader>ee :e ~/.vimrc<cr> 

"函数注释
let @c="2i/2i*i

kka 30a*jjh28i*ka"

"------  Replacing ------
"type S, then type what you're looking for, a /, and what to replace it with
nmap S :%s/<C-R><C-W>\>//g<LEFT><LEFT>
vmap S :s/<C-R><C-W>\>//g<LEFT><LEFT>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Scott McCoy/svn.vim
" http://www.vim.org/scripts/script.php?script_id=743
" cd  ~/.vim
" tar zxvf svn-<version>.tgz
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"更新当前目录的代码
"map <F5> :!svn up<CR>
"提交SVN（当前目录）
"map <F7> :!svn ci -m ""<CR>
"提交SVN（当前文件）
"map <F8> :!svn ci -m "" %<CR> 


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" =>Tagbar
" http://www.vim.org/scripts/script.php?script_id=3465 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
noremap <silent> <Leader>y :TagbarToggle<CR>
let g:tagbar_ctags_bin='/usr/bin/ctags-exuberant'
let g:tagbar_width=26


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" =>Exuberant Ctags
" sudo apt-get install exuberant-ctags
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ,ct = Builds ctags in current directory
map <Leader>ct :! /usr/bin/ctags-exuberant -R *<CR>
let g:tagbar_type_go = {
            \ 'ctagstype': 'go',
            \ 'kinds' : [
            \'p:package',
            \'f:function',
            \'v:variables',
            \'t:type',
            \'c:const'
            \]
            \}


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vundle
" git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"let Vundle manage Vundle
"required!
Bundle 'gmarik/vundle'

"My Bundles here:
"
"original repos on github

"color
"Plugin 'flazz/vim-colorschemes'

" Indent
Bundle 'Yggdroot/indentLine'
    let g:indentLine_char = '┊'

" Plugin
Bundle 'The-NERD-tree'
"------  NERDTree Options  ------
"  当打开vim且没有文件时自动打开NERDTree
autocmd vimenter * if !argc(  )   | NERDTree | endif
let NERDTreeIgnore=['CVS']
let NERDTreeChDirMode=2     "setting root dir in NT also sets VIM's cd
noremap <silent> <Leader>n :NERDTreeToggle<CR>
" These prevent accidentally loading files while in the NERDTree panel
autocmd FileType nerdtree noremap <buffer> <c-left> <nop>
autocmd FileType nerdtree noremap <buffer> <c-h> <nop>
autocmd FileType nerdtree noremap <buffer> <c-right> <nop>
autocmd FileType nerdtree noremap <buffer> <c-l> <nop>
Bundle 'jiangmiao/auto-pairs'
Bundle 'pangloss/vim-javascript'
Bundle 'mattn/emmet-vim'
Plugin 'mattn/jscomplete-vim'
"Plugin 'faith/vim-go'
Bundle 'cespare/vim-golang'
    "let g:gofmt_command="goimports"
    filetype plugin indent off
    set runtimepath+=$GOROOT/misc/vim
    filetype plugin indent on
    syntax on
    au FileType go au BufWritePre <buffer> Fmt
Bundle 'dgryski/vim-godef'
Plugin 'nsf/gocode',{'rtp':'vim/'}
Bundle 'Valloric/YouCompleteMe'
    nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
    nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
    nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
"Bundle 'Shougo/neocomplcache'
" Disable AutoComplPop.
"let g:acp_enableAtStartup = 0
"" Use neocomplete.
"let g:neocomplete#enable_at_startup = 1
"" Use smartcase.
"let g:neocomplete#enable_smart_case = 1
"" Set minimum syntax keyword length.
"let g:neocomplete#sources#syntax#min_keyword_length = 3
"let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
"
"" Define dictionary.
"let g:neocomplete#sources#dictionary#dictionaries = {
"            \ 'default' : '',
"            \ 'vimshell' : $HOME.'/.vimshell_hist',
"            \ 'scheme' : $HOME.'/.gosh_completions'
"            \ }
"
"
"" Define keyword.
"if !exists('g:neocomplete#keyword_patterns')
"    let g:neocomplete#keyword_patterns = {}
"endif
"let g:neocomplete#keyword_patterns['default'] = '\h\w*'

"Bundle 'joonty/vdebug'
"<F5>: start/run (to next breakpoint/end of script)
"<F2>: step over
"<F3>: step into
"<F4>: step out
"<F6>: stop debugging
"To stop debugging, press <F6>. Press it again to close the debugger interface.
"<F7>: detach script from debugger
"<F9>: run to cursor
"<F10>: set line breakpoint
"<F11>: show context variables (e.g. after 
""eval")
"<F12>: evaluate variable under cursor
":Breakpoint <type> <args>: set a breakpoint of any type (see :help VdebugBreakpoints)
":VdebugEval <code>: evaluate some code and display the result
"<Leader>e: evaluate the expression under visual highlight and display the result


"Syntax
Bundle 'scrooloose/Syntastic'
	let g:syntastic_check_on_open = 1
	let g:syntastic_error_symbol = '✗'
	let g:syntastic_warning_symbol = '⚠'
	let g:syntastic_auto_loc_list = 1
	let g:syntastic_loc_list_height = 5
	let g:syntastic_enable_highlighting = 0
" 如果要对javascript进行语法检查，可以安装JSHint插件
" sudo apt-get install nodejs
" sudo npm install jshint
" # 如果是 12.10，我发现 nodejs 可执行文件的命名不符合常规，要做个链接
" sudo ln -s /usr/bin/nodejs /usr/bind/node


"
" :Brief help
" :BundleList           -list configured bundles
" :BundleInstall(!)     - install(update) bundles
" :BundleSearch(!) foo  - search(or refresh cache first) for foo
" :BundleClean(!)       - confirm(or auto-approve) removal of unused bundles
" vundle主要就是上面这个四个命令，例如BundleInstall是全部重新安装，BundleInstall!则是更新
" 一般安装插件的流程为，先BundleSearch一个插件，然后在列表中选中，按i安装
" 安装完之后，在vimrc中，添加Bundle 'xxx'  使得bundle能够加载这个插件，同时如果
" 需要配置这个插件，也是在vimrc中设置即可
" 如果search到的安装不了,就换过来先在vimrc里添加Bundle 'xxx'
" 在去vim里执行BundleInstall来安装
" 卸载的话
" 1. 注释掉Bundle/Plugin ×××（要删除的插件相关语句）
" 2. :BundleClean
" Done!
" see :h vundle for more details or wiki for FAQ
" ps: comments after Bundle command are not allowed..


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! HasPaste()
    if &paste
        return 'PASTE MODE '
    en
    return ''
endfunction

map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'go'
        exec "!time go run %"
    elseif &filetype == 'python'
        exec "!time python2.7 %"
    elseif &filetype == 'html'
        exec "!firefox % &"
    elseif &filetype == 'sh'
        :!time bash %
    endif
endfunc

"添加版权声明
"添加或更新头
autocmd BufNewFile,BufRead *.php exec ":call TitleDet()"

func AddTitle()
    call append(0,"<?php")
    call append(1,"/****************************************************")
    call append(2," * Description: ")
    call append(3," * Author:   黄锦东")
    call append(4," * Email:    deDoyle@163.com")
    call append(5," * Created:       ".strftime("%Y-%m-%d %H:%M"))
    call append(6," * Last modified: ".strftime("%Y-%m-%d %H:%M"))
    call append(7," * Filename: ".expand("%:t"))
    call append(8," ***************************************************/")
endf

"更新最近修改时间和文件名
func UpdateTitle()
    normal m'
    execute '/* *Last modified: /s@:.*$@\=strftime(":\t%Y-%m-%d %H:%M")@'
    normal ''
    normal mk
    execute '/* *Filename:/s@:.*$@\=":\t\t".expand("%:t")@'
    execute "noh"
    normal 'k
endf

"判断前9行代码里面，是否有Last modified这个单词，
"如果没有的话，代表没有添加过作者信息，需要新添加；
"如果有的话，那么只需要更新即可
func TitleDet()
    let n=7
    "默认为添加
    let line = getline(n)
    if line =~ '^\s\*\s*\S*Last\smodified:\S*.*$'
        call UpdateTitle()
        return
    endif
    call AddTitle()
endf
