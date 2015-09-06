"==================================
"    Vim基本配置
"===================================

"关闭vi的一致性模式 避免以前版本的一些Bug和局限
set nocompatible
"配置backspace键工作方式
set backspace=indent,eol,start

"高亮匹配项
set hlsearch
"增量查找
set incsearch

"代码折叠,根据语法折叠
set fdm=syntax

"光标移动到buffer的顶部和底部时保持3行距离 
set scrolloff=3

"显示行号
set number
"设置在编辑过程中右下角显示光标的行列信息
set ruler
"当一行文字很长时取消换行
"set nowrap

"在状态栏显示正在输入的命令
set showcmd

"设置历史记录条数
set history=1000

"设置取消备份 禁止临时文件生成
set nobackup
set noswapfile

"突出现实当前行列
"set cursorline
"set cursorcolumn

"设置匹配模式 类似当输入一个左括号时会匹配相应的那个右括号
set showmatch

"设置C/C++方式自动对齐
set autoindent
set cindent

"指定配色方案为256色
set t_Co=256

"设置搜索时忽略大小写
set ignorecase
"设置搜索时忽略大小写
"set noignorecase

"设置Tab宽度
set tabstop=4
"设置自动对齐空格数
set shiftwidth=4
"设置按退格键时可以一次删除4个空格
set softtabstop=4
"设置按退格键时可以一次删除4个空格
set smarttab
"将Tab键自动转换成空格 真正需要Tab键时使用[Ctrl + V + Tab]
set expandtab

"设置编码方式
set encoding=utf-8
"自动判断编码时 依次尝试以下编码
set fileencodings=utf-8,gbk,cp936,gb2312,gb18030

"针对不同的文件采用不同的缩进方式
filetype indent on
"允许插件
filetype plugin on

"==================================
"    vundle插件 管理vim的插件
"===================================
"开始使用Vundle的必须配置
set nocompatible
filetype off

"设置vundle的runtime path
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"使用Vundle来管理Vundle
Bundle 'VundleVim/Vundle.vim'
"fonts插件 状态栏的字体
Bundle 'powerline/fonts'
"ariline插件 轻量级的状态栏增强展示
Bundle 'bling/vim-airline'
"YankRing插件 管理复制,剪切,删除的内容 类似emacs的KillRing
Bundle 'vim-scripts/YankRing.vim'
"NERDTREE插件 浏览文件和目录
Bundle 'scrooloose/nerdtree'
"taglist插件 显示函数定义列表 依赖ctags 需要安装exuberant-ctags
Bundle 'vim-scripts/taglist.vim'
"cscope插件 创建cscope数据库,帮助代码浏览
Bundle 'vim-scripts/cscope.vim'
"supertab插件 使用tab补全
Bundle 'ervandew/supertab'
"solarized配色方案
Bundle 'altercation/vim-colors-solarized'
"ctrlp插件 增强查找功能 功能非常多
Bundle 'kien/ctrlp.vim'
"Tagbar插件 根据修改时间排列Symbol
Bundle 'majutsushi/tagbar'
"Tasklist插件 非常方便的一个Todo list工具
Bundle 'vim-scripts/TaskList.vim'
"YouCompleteMe插件 编译器clang支持的代码补全
Bundle 'Valloric/YouCompleteMe'
"UltiSnips插件 代码片段补全
Bundle 'SirVer/ultisnips'
"snippets插件 代码片段补全
Bundle 'honza/vim-snippets'
"easymotion插件 实现快速定位
Bundle 'easymotion/vim-easymotion'
"tabular插件 实现对齐
Bundle 'godlygeek/tabular'
"nerdcommenter插件 实现代码注释
Bundle 'scrooloose/nerdcommenter'
"gundo插件 实现undotree,可以管理撤销和重做功能
Bundle 'sjl/gundo.vim'
"ack插件 实现查找功能,类似grep
Bundle 'mileszs/ack.vim'
"a.vim插件 头文件和c文件之间切换
Bundle 'vim-scripts/a.vim'
"sessionman插件 管理session,下次打开可以还原工作
Bundle 'vim-scripts/sessionman.vim'
"vim-ident-guides插件 显示按格式对齐的竖线
Bundle 'nathanaelkane/vim-indent-guides'
"auto-pair插件 自动输入成对括号
Bundle 'jiangmiao/auto-pairs'

call vundle#end()
"Vundle配置完成后设置 开启插件
filetype plugin indent on
"开启语法高亮
syntax enable
syntax on

"==================================
"需要开启语法检测,但是开启语法要等到vundle配置之后,所以放到这里
"===================================
"solarized 配置
if isdirectory(expand("~/.vim/bundle/vim-colors-solarized/"))
    "使用256色
    let g:solarized_termcolors=256
    "设置背景色
    set background=dark
    "设置主题 
    colorscheme solarized
endif

"taglist 配置
"只显示当前文件的tag
let Tlist_Show_One_File=1
"在右侧窗口中显示taglist窗口
let Tlist_Use_Right_Window=1
"如果taglist是最后一个窗口，则退出vim
let Tlist_Exit_OnlyWindow=1 
"自动更新taglist
let Tlist_Auto_Update=1
"taglist按照名字排序
let Tlist_Sort_Type="name"

"supertab 配置
"默认是从下往上选择,设置成从上往下更舒服
let g:SuperTabDefaultCompletionType = "<c-n>"
"可以使用回车选中
let g:SuperTabCrMapping=1

"ctrlP 配置
"列出结果 在底部显示, 排序top to bottom, 显示最少1个,最多30个,结果数30
let g:ctrlp_match_window = 'bottom,order:ttb,min:1,max:30,results:30'

"tasklist 配置
"指定任务列表窗口在下方
let g:tlWindowPosition = 1

"YouCompleteMe 配置
"设置默认配置文件
let g:ycm_global_ycm_extra_conf="~/.vim/.ycm_extra_conf.py"
"设置错误符号为">e"
let g:ycm_error_symbol = '>e'
"设置警告符号为">w"
let g:ycm_warning_symbol = '>w'

"airline 配置
"始终显示状态栏
set laststatus=2
"使用powerline风格 但是没能正确配置
"let g:airline_powerline_fonts=1

"vim-indent-guides 配置 
let g:indent_guides_start_level=2
"设置对齐线的宽度
let g:indent_guides_guide_size = 1


"==================================
"    快捷键
"===================================
"设置快捷键前缀
let mapleader=","
"在插入模式下使用jk代替ESC,因为它太远了
inoremap jk <Esc>

"星际译王 翻译
nmap <leader>. : !sdcv -n <C-R>=expand("<cword>")<CR><CR>

"taglist窗口打开或关闭
nnoremap <leader>tl : TlistToggle <CR>

"tagbar窗口打开或关闭
nnoremap <leader>tb : TagbarToggle <CR>

"tasklist窗口打开或关闭
map <leader>td <Plug>TaskList

"NERDTree窗口打开或关闭
nnoremap <leader>n : NERDTreeToggle <CR>

"sessionman 快捷键
set sessionoptions=blank,buffers,curdir,folds,tabpages,winsize
if isdirectory(expand("~/.vim/bundle/sessionman.vim/"))
    nmap <leader>sl :SessionList<CR>
    nmap <leader>ss :SessionSave<CR>
    nmap <leader>sc :SessionClose<CR>
endif

"   ycm快捷键
"跳转到定义
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>jl :YcmDiags<CR>

"ultisnips快捷键  解决tab键冲突
let g:ycm_key_list_select_completion = ['<C-TAB>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-S-TAB>', '<Up>'] 
let g:SuperTabDefaultCompletionType = '<C-TAB>'

"tabular快捷键 只有在可视化模式下有用
vmap <leader>/ :Tabular / 

"easymonitor快捷键
"多字符查找绑定到/
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

"a.vim快捷键 .h和.c切换
nmap <leader>a :A <CR>

"   cscope快捷键
"++++++++++++++++++++++++++++++++++
nnoremap <leader>fa :call cscope#findInteractive(expand('<cword>'))<CR>
nnoremap <leader>l :call ToggleLocationList()<CR>
" s: Find this C symbol
nnoremap  <leader>fs :call cscope#find('s', expand('<cword>'))<CR>
" g: Find this definition
nnoremap  <leader>fg :call cscope#find('g', expand('<cword>'))<CR>
" d: Find functions called by this function
nnoremap  <leader>fd :call cscope#find('d', expand('<cword>'))<CR>
" c: Find functions calling this function
nnoremap  <leader>fc :call cscope#find('c', expand('<cword>'))<CR>
" t: Find this text string
nnoremap  <leader>ft :call cscope#find('t', expand('<cword>'))<CR>
" e: Find this egrep pattern
nnoremap  <leader>fe :call cscope#find('e', expand('<cword>'))<CR>
" f: Find this file
nnoremap  <leader>ff :call cscope#find('f', expand('<cword>'))<CR>
" i: Find files #including this file
nnoremap  <leader>fi :call cscope#find('i', expand('<cword>'))<CR>

"gundo 快捷键
nnoremap <Leader>u :GundoToggle<CR>

"++++++++++++++++++++++++++++++++++

"==================================
"    备用选项
"===================================
"set title
"set ttyfast
"set modeline
"set modelines=3
"set shortmess=all
"set no starttofline
"set wildmenu
"retab
"set bsdir=buffer
"set noautochdir
"set clipboard=unnamed
"查看快捷键定义
":verbose map
