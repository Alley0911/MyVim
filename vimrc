set nocompatible
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
" 以上几个是插件正常安装所需要的

let mapleader=" " " 前缀
syntax on " 语法高亮
set number 
set cursorline " 一条线
set wrap " 当一行内容太长时，自动换行
set wildmenu " 普通模式输入命令可以有提示
set backspace=indent,eol,start " 使退格键在行首时退格到上一行行尾
set hlsearch " 高亮搜索结果
noremap <LEADER><CR> :nohlsearch<CR> " 按下空格回车将会取消搜索的高亮显示

" 普通模式和编辑模式的光标样式不同
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" 打开文档使光标回到上次编辑的位置
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

map S :w<CR> " 普通模式下按大写S将保存文件
map Q :q<CR> " 普通模式下按大写Q将退出，先按S

map J 5j
map K 5k


map sh :set nosplitright<CR>:vsplit<CR> " 垂直分屏并将光标放在左边
map sl :set splitright<CR>:vsplit<CR> " 垂直分屏并将光标放在右边
map sk :set nosplitbelow<CR>:split<CR> " 水平分屏并将光标放在上边
map sj :set splitbelow<CR>:split<CR> " 水平分屏并将光标放在下边

map <leader>h <C-w>h " 按空格加h将光标移到左边的分屏
map <leader>l <C-w>l " 移到右边的分屏
map <leader>j <C-w>j " 移到下面的分屏
map <leader>k <C-w>k " 移到上面的分屏

call plug#begin('~/.vim/plugged')

Plug 'Valloric/YouCompleteMe'
call plug#end()


let g:SnazzyTransparent = 1 " 变透明
""""""""""""YCM""""""""""""""""""""
"let g:ycm_global_ycm_extra_conf =
"'~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
""let g:ycm_collect_identifiers_from_tags_files = 1
set completeopt=longest,menu	"让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
autocmd InsertLeave * if pumvisible() == 0|pclose|endif	"离开插入模式后自动关闭预览窗口
inoremap <expr> <space>       pumvisible() ? "\<C-y>" : "\<space>"	
"按空格键即选中当前项
"let g:ycm_cache_omnifunc=0	" 禁止缓存匹配项,每次都重新生成匹配项
"let g:ycm_seed_identifiers_with_syntax = 1
"let g:ycm_confirm_extra_conf = 0
""在注释输入中也能补全
let g:ycm_complete_in_comments = 1
"在字符串输入中也能补全
"let g:ycm_complete_in_strings = 1
""注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0
