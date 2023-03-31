-- 启用全局选项处理
local opt = vim.opt

-- 设定保存历史记录的行数 (默认值: 50 )
opt.history = 1000

-- 设置键盘启用情况
opt.mouse="a"

-- 设置系统粘贴板
opt.clipboard:append("unnamedplus")

-- 显示普通行数
opt.number = true
-- 显示相对行数
opt.relativenumber = true
-- 显示 git 状态列
opt.signcolumn = "auto"
-- 设置自动切换行数显示
vim.cmd([[
  augroup CursorLineOnlyInActiveWindow
    autocmd!
    " 离开插入模式时，显示相对行数
    autocmd InsertLeave * setlocal cursorline relativenumber
    " 进入插入模式时，显示普通行数
    autocmd InsertEnter * setlocal nocursorline norelativenumber
    " 进入缓冲区后，显示当前列、相对行数、自动显示标记栏
    autocmd BufEnter * setlocal cursorline relativenumber
    " 离开缓冲区后
    autocmd BufLeave * setlocal nocursorline norelativenumber
  augroup END
]])

-- 避免中文窗口操作系统中的乱码字符
opt.langmenu = "en"
-- 中文文档 cn
opt.helplang = "en"
-- 设置 UTF-8 编码
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"
opt.termencoding = "utf-8"

-- 启用 wildmenu 命令行菜单：Tab 键可显示匹配内容
opt.wildmenu = true
-- 点击Tab键，将显示可能匹配的文件列表，并使用最长的子串进行补全；
--   再次点击Tab键，可以在wildmenu中遍历匹配的文件列表
opt.wildmode = "list:longest,full"
-- 在匹配列表中忽略指定类型的文件
opt.wildignore = {
  "*.aux,*.out,*.toc",
  "*.o,*.obj,*.dll,*.jar,*.pyc,__pycache__,*.rbc,*.class",
  -- media
  "*.ai,*.bmp,*.gif,*.ico,*.jpg,*.jpeg,*.png,*.psd,*.webp",
  "*.avi,*.m4a,*.mp3,*.oga,*.ogg,*.wav,*.webm",
  "*.eot,*.otf,*.ttf,*.woff",
  "*.doc,*.pdf",
  -- archives
  "*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz",
  -- temp/system
  "*.*~,*~ ",
  "*.swp,.lock,.DS_Store,._*,tags.lock",
  -- version control
  ".git,.svn",
}

-- 左移键回到上一行的行尾，在行尾用右移键能够到下一行的开头
opt.whichwrap = "<,>,b,s,h,l"

-- 文件名自动补全时，忽略文件名的大小写
opt.wildignorecase = true

-- 忽略搜索模式的大小写
opt.ignorecase = true
-- 智能的判断要不要区分搜索模式大小写（只能在 ignorecase 开启时使用）
opt.smartcase = true

-- 在执行宏命令时，不进行显示重绘；在宏命令执行完成后，一次性重绘，以便提高性能
opt.lazyredraw = true

-- 高亮显示匹配的括号
opt.showmatch = true
-- 高亮显示匹配括号的时间（单位：十分之一秒）
opt.matchtime = 15

-- 光标距离buffer的顶部或底部保持 5 行距离
opt.scrolloff = 8
opt.sidescrolloff = 8

-- 在被分割的窗口间显示空白，便于阅读
-- opt.fillchars = {vert = " ", stl = " ", stlnc = " "}

-- 开启真彩色模式
opt.termguicolors = true
-- 尝试设置主题
-- vim.cmd("colorscheme desert")
-- 设置背景透明
-- vim.cmd("highlight Normal ctermbg=NONE guibg=NONE")
-- vim.cmd("highlight NonText ctermbg=NONE guibg=NONE")
-- vim.cmd("highlight SignColumn ctermbg=NONE guibg=NONE")
-- vim.cmd("highlight VertSplit ctermbg=NONE guibg=NONE")
-- vim.cmd("highlight StatusLineNC ctermbg=NONE guibg=NONE")
-- vim.cmd("highlight TabLine ctermbg=NONE guibg=NONE")
-- vim.cmd("highlight TabLineFill ctermbg=NONE guibg=NONE")

-- 启用自动读取
opt.autoread = true
-- 当文件被其他编辑器修改时，自动加载
vim.cmd("autocmd FocusGained,BufEnter * checktime")
-- 启用自动保存
opt.autowrite = true
-- 当失去焦点或者离开当前的 buffer 的时候保存
vim.cmd("autocmd FocusLost,BufLeave * silent! update")
-- 启用交互式确认，影响文件内容时，向用户进行确认
opt.confirm = true

-- 不需要备份文件
opt.backup = false
-- 编辑的时候不需要备份文件
opt.writebackup = false
-- 不创建临时交换文件
opt.swapfile = false
-- 开启持久性撤销功能
--  意味着即使关闭了缓冲区/Vim，重新进入时仍能执行撤销操作
-- 启用持久化 undo
opt.undofile = true
-- 设置 undo 文件的保存路径
opt.undodir = "/tmp/lvim/undo"
-- 更快完成
opt.updatetime = 300

-- 设置折叠
opt.foldenable = true
-- 设置折叠函数
opt.foldmethod = "indent"
-- opt.foldmethod = "expr"
-- 设置折叠表达式
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
-- 设置打开文件时默认的折叠级别
opt.foldlevelstart = 0
-- 指定折叠级别的最大深度
opt.foldlevel = 99
-- 设置代码折叠的最小行数
opt.foldminlines = 3
-- 在左边增加一列显示折叠栏
opt.foldcolumn = "3"

-- 设置数字列长度为 4
opt.numberwidth = 4

-- 使用空格而非制表符
opt.expandtab = true
-- 将 tab 设置为 2 个空格
opt.tabstop = 2
-- 每一级缩进 2 个空格
opt.shiftwidth = 2
-- 自动缩进：每一行都和前一行有相同的缩进量，同时这种缩进形式能正确的识别出括号
opt.smartindent = true
-- C 语言的缩进（比上述两种更严格，推荐 C 语言开发者使用）
opt.cindent = true

-- 光标超过 80 行时，进行断行
opt.textwidth = 80
-- 设置不在单词中断行
opt.linebreak = true

-- 向右切分分屏
opt.splitright = true
-- 向下切分分屏
opt.splitbelow = true

-- 指定在缓冲区之间切换时的行为：直接切换过去，而不是新建一个
opt.switchbuf = "useopen,usetab,newtab"

-- 缩进对齐线
opt.colorcolumn = "99999"

-- 显示特殊字符（比如：Tab、空格、行尾空格、换行符等等）
opt.list = true
opt.listchars = "tab:→ ,eol:↵,trail:·,extends:↷,precedes:↶"

-- 命令行高度
opt.cmdheight = 2
-- 命令行菜单栏选择
opt.completeopt = { "menuone", "noselect" }

-- 弹出窗口的高度
opt.pumheight = 10

-- 普通模式下，按键响应的等待时间（默认 1000）
opt.timeoutlen = 200
-- opt.ttimeoutlen = 100
-- 插入模式下，按键响应的等待时间（默认 50）
-- 屏幕重绘时间（默认 1000）
-- opt.redrawtime = 1500

-- 打开文件时，返回到最后的编辑位置并且居中显示
vim.cmd([[autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | execute 'silent! ' . line("'\"") . 'foldopen!' | execute 'normal! ' . line("'\"") . 'Gzz' | endif]])

-- 保存时删除末尾空白
vim.cmd([[
  autocmd BufWritePre * :%s/\s\+$//e
]])

-- 设置光标
opt.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"

-- 当使用命令行时，总是报告文件有几行被修改过
opt.report = 0

-- 配置 C++ 风格
vim.cmd([[
  autocmd FileType c,cpp set commentstring=//\ %s
]])

-- 配置 Python 风格
vim.cmd([[
  autocmd FileType python set commentstring=#\ %s
  autocmd FileType python syn keyword pythonDecorator True None False self
]])



-- LauraVim 配置
-- 不显示模式（lvim 中不再需要）
opt.showmode = false
-- 显示标签栏
opt.showtabline = 2
-- 将标题设置为 titlestring 的值
opt.title = true
opt.titlestring = "%<%F%=%l/%L - nvim"
-- 设置 undo 文件的保存路径
opt.undodir = vim.fn.stdpath "cache" .. "/undo"


-- general
-- 主题
-- lvim.colorscheme = "lunar"
lvim.colorscheme = "tokyonight"
-- 透明背景
lvim.transparent_window = true
lvim.log.level = "info"
lvim.format_on_save = {
  enabled = true,
  pattern = "*.lua",
  timeout = 1000,
}

-- 自动安装相关语法的高亮显示
lvim.builtin.treesitter.auto_install = true
