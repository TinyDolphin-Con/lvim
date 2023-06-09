-- keymappings <https://www.lunarvim.org/docs/configuration/keybindings>

-- 启用键盘映射
local keymap = vim.keymap.set

-- 设置 leader 键
vim.g.mapleader = " "

----------------------------
----- 正常模式 normal ------
----------------------------
-- 快速保存
keymap("n", "W", ":w<CR>", { noremap = true, silent = true })
-- 快速退出
keymap("n", "Q", ":q<CR>", { noremap = true, silent = true })
-- 快速保存并退出
keymap("n", "qw", ":wq<CR>", { noremap = true, silent = true })
-- 快速保存并退出所有窗口
keymap("n", "qa", ":wqa<CR>", { noremap = true, silent = true })
-- 快速保存（修改时保存）并退出所有窗口
keymap("n", "qx", ":xa<CR>", { noremap = true, silent = true })
-- 选中全文（普通模式、可视模式和选择模式）
keymap({ "n", "x" }, "VV", "<Esc>gg0vG$<CR>", { noremap = true, silent = true })
-- 取消搜索高亮
keymap({ "n", "x" }, "<leader><CR>", ":nohlsearch<CR>", { noremap = true, silent = true })

-- 上下移动并居中（每次重绘略卡,建议去掉）
-- keymap("n", "j", "gjzz", { noremap = true, silent = true })
-- keymap("n", "k", "gkzz", { noremap = true, silent = true })
-- 向下翻转半页并居中（:set scrolloff=999）
-- keymap("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true })
-- keymap("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true })
-- 向下翻转整页并居中（:set scrolloff=999）
-- keymap("n", "<C-f>", "<C-f>zz", { noremap = true, silent = true })
-- keymap("n", "<C-b>", "<C-b>zz", { noremap = true, silent = true })
-- 搜索并居中
keymap({ "n", "x" }, "n", "nzz", { noremap = true, silent = true })
keymap({ "n", "x" }, "N", "Nzz", { noremap = true, silent = true })
-- keymap({ "n", "x" }, "*", "*zz", { noremap = true, silent = true })
-- keymap({ "n", "x" }, "#", "#zz", { noremap = true, silent = true })
keymap({ "n", "x" }, "<C-i>", "<C-i>zz", { noremap = true, silent = true })
keymap({ "n", "x" }, "<C-o>", "<C-o>zz", { noremap = true, silent = true })

-- 字符替换（建议：使用虚拟替换模式，会按屏幕实际显示宽度来替换字符）
keymap("n", "r", "gr", { noremap = true, silent = true })
keymap("n", "R", "gR", { noremap = true, silent = true })

-- 切换粘贴模式
keymap("n", "<leader>P", ":setlocal paste!<CR>", { noremap = true, silent = true, desc = "Switch paste" })

-- 切分分屏：右左上下
keymap("n", "sl", ":set splitright<CR>:vsplit<CR>", { noremap = true, silent = true, desc = "Split right" })
keymap("n", "sh", ":set nosplitright<CR>:vsplit<CR>", { noremap = true, silent = true, desc = "Split left" })
keymap("n", "sk", ":set nosplitbelow<CR>:split<CR>", { noremap = true, silent = true, desc = "Split top" })
keymap("n", "sj", ":set splitbelow<CR>:split<CR>", { noremap = true, silent = true, desc = "Split below" })
-- 调整分屏大小
keymap("n", "sL", "<C-w>>", { noremap = true, silent = true, desc = "Resize right" })
keymap("n", "sH", "<C-w><", { noremap = true, silent = true, desc = "Resize left" })
keymap("n", "sK", "<C-w>-", { noremap = true, silent = true, desc = "Resize top" })
keymap("n", "sJ", "<C-w>+", { noremap = true, silent = true, desc = "Resize below" })
keymap("n", "s=", "<C-w>=", { noremap = true, silent = true, desc = "Resize below" })

-- 移动一行文字
keymap("n", "<C-S-Up>", "mz:m-2<CR>`z", { noremap = true, silent = true })
keymap("v", "<C-S-Up>", ":m'<-2<CR>`>my`<mzgv`yo`z", { noremap = true, silent = true })
keymap("n", "<C-S-Down>", "mz:m+<CR>`z", { noremap = true, silent = true })
keymap("v", "<C-S-Down>", ":m'>+<CR>`<my`>mzgv`yo`z", { noremap = true, silent = true })

-- 移动到行首行尾
keymap({ "n", "x" }, "H", "^", { noremap = true, silent = true })
keymap({ "n", "x" }, "L", "$", { noremap = true, silent = true })

-- 替换:
keymap({ "n", "x" }, ";", ":", { noremap = true })

----------------------------
----- 插入模式 insert ------
----------------------------
-- 移动光标
keymap("i", "<C-k>", "<Up>", { noremap = true })
keymap("i", "<C-j>", "<Down>", { noremap = true })
keymap("i", "<C-h>", "<Left>", { noremap = true })
keymap("i", "<C-l>", "<Right>", { noremap = true })
-- 向后删除
keymap("i", "<C-d>", "<Delete>", { noremap = true })
-- 向后移动一个单词
keymap("i", "<C-f>", "<C-o>W", { noremap = true })
-- 删除当前行
keymap("i", "<C-q>", "<C-o>dd", { noremap = true })
-- 使当前行居中
keymap("i", "<C-z>", "<C-o>zz", { noremap = true })

-- 插入模式，快速打印当前时间
keymap("i", "xdate", [[<C-r>=strftime('%Y-%m-%d %H:%M:%S')<CR>]], { noremap = true, silent = true })

----------------------------
----- 可视模式 -------------
----------------------------
-- 可视模式下，针对选中内容，增加括号
keymap("v", "(", "<Esc>`>a)<Esc>`<i(<Esc>", { noremap = true, silent = true })
keymap("v", "[", "<Esc>`>a]<Esc>`<i[<Esc>", { noremap = true, silent = true })
keymap("v", "{", "<Esc>`>a}<Esc>`<i{<Esc>", { noremap = true, silent = true })
keymap("v", '"', '<Esc>`>a"<Esc>`<i"<Esc>', { noremap = true, silent = true })
keymap("v", "`", "<Esc>`>a`<Esc>`<i`<Esc>", { noremap = true, silent = true })
keymap("v", "'", "<Esc>`>a'<Esc>`<i'<Esc>", { noremap = true, silent = true })

----------------------------
----- 命令行模式 -----------
----------------------------
keymap("c", "<C-a>", "<Home>", { noremap = true })
keymap("c", "<C-e>", "<End>", { noremap = true })

----------------------------
----- 其他 -----------------
----------------------------

-- 开启拼写检查
-- lvim.keys.normal_mode["SS"] = ":setlocal spell!<CR>"
-- ]s ：移动到下一个拼写错误处
-- [s ：移动到上一个拼写错误处
-- z= ：选择正确的拼写
-- zg ：添加用户拼写
-- zw ：删除用户拼写

-- 折叠快捷键
-- zf{motion} ：将指定动作的范围进行折叠（e.g. 将整个段落进行折叠 zfap）
-- zd ：删除折叠
-- zo ：打开当前折叠
-- zc ：关闭当前折叠
-- zj ：跳转到下一个折叠
-- zk ：跳转到上一个折叠
-- zR ：打开所有折叠
-- zM ：关闭所有折叠

-- 移除不需要的快捷
lvim.keys.normal_mode["x"] = false
-- 移除 lvim 自带的上下移动一行的操作
lvim.keys.normal_mode["<A-j>"] = false
lvim.keys.normal_mode["<A-k>"] = false
lvim.keys.insert_mode["<A-j>"] = false
lvim.keys.insert_mode["<A-k>"] = false
lvim.keys.visual_block_mode["<A-j>"] = false
lvim.keys.visual_block_mode["<A-k>"] = false

----------------------------
----- 插件 -----------------
----------------------------
-- 插件 hop.nvim 窗口内快速跳转
keymap("n", ",", "<Cmd>HopChar1<CR>", { noremap = true, silent = true, desc = "HopChar1" })
keymap("n", ",,", "<Cmd>HopChar2<CR>", { noremap = true, silent = true, desc = "HopChar2" })

-- 插件 s1n7ax/nvim-window-picker 窗口选择↵
local picker = require("window-picker")
-- 快速选择窗口
keymap("n", "sw", function()
  local picked_window_id = picker.pick_window() or vim.api.nvim_get_current_win()
  vim.api.nvim_set_current_win(picked_window_id)
end, { noremap = true, silent = true, desc = "Pick a window" })
-- -- 交换两个窗口
local function swap_windows()
  local window = picker.pick_window()
  local target_buffer = vim.fn.winbufnr(window)
  vim.api.nvim_win_set_buf(window, 0)
  vim.api.nvim_win_set_buf(0, target_buffer)
end
keymap("n", "sW", swap_windows, { noremap = true, silent = true, desc = "Swap windows" })

-- 插件 LSP Bindings
-- 预览跳转定义位置
keymap(
  { "n", "x" },
  "gpd",
  "<Cmd>lua require('goto-preview').goto_preview_definition()<CR>",
  { noremap = true, silent = true, desc = "Preview definition" }
)
-- 预览跳转引用位置
keymap(
  { "n", "x" },
  "gpr",
  "<Cmd>lua require('goto-preview').goto_preview_implementation()<CR>",
  { noremap = true, silent = true, desc = "Preview implementation" }
)
-- 快速跳转
keymap(
  { "n", "x" },
  "gd",
  "<cmd>TroubleToggle lsp_definitions<cr>",
  { noremap = true, silent = true, desc = "Lsp definitions" }
)
keymap(
  { "n", "x" },
  "gr",
  "<cmd>TroubleToggle lsp_references<cr>",
  { noremap = true, silent = true, desc = "Lsp references" }
)
keymap(
  { "n", "x" },
  "gi",
  "<cmd>TroubleToggle lsp_implementations<cr>",
  { noremap = true, silent = true, desc = "Lsp implementations" }
)
keymap(
  { "n", "x" },
  "gt",
  "<cmd>TroubleToggle lsp_type_definitions<cr>",
  { noremap = true, silent = true, desc = "Lsp type_definitions" }
)

-- 插件 clangd_extensions.nvim clangd 增强
-- 快速跳转：头文件和源文件之间
keymap(
  { "n", "v" },
  "gsh",
  "<Cmd>ClangdSwitchSourceHeader<CR>",
  { noremap = true, silent = true, desc = "Switch Source Header" }
)

-- 插件 folke/trouble.nvim 漂亮的列表，显示诊断、引用、搜索结果、快速修复和定位列表↵
lvim.builtin.which_key.mappings["t"] = {
  name = "trouble",
  -- d = { "<cmd>TroubleToggle lsp_definitions<cr>", "definitions" },
  -- r = { "<cmd>TroubleToggle lsp_references<cr>", "references" },
  -- i = { "<cmd>TroubleToggle lsp_implementations<cr>", "implementations" },
  -- t = { "<cmd>TroubleToggle lsp_type_definitions<cr>", "type_definitions" },
  t = { "<cmd>TroubleToggle<cr>", "trouble" },
  w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "workspace" },
  d = { "<cmd>TroubleToggle document_diagnostics<cr>", "document" },
  q = { "<cmd>TroubleToggle quickfix<cr>", "quickfix" },
  l = { "<cmd>TroubleToggle loclist<cr>", "loclist" },
}

-- 插件 vim-bookmarks 书签
-- mm 当前行添加/删除书签
-- mi 当前行添加/编辑/删除带注释的书签
-- mn 跳转到缓冲区的下一个书签
-- mp 跳转到缓冲区的上一个书签
-- ma 显示所有书签
-- mc 仅删除当前缓冲区的书签
-- mx 清除所有缓冲区的书签
lvim.builtin.which_key.mappings["m"] = {
  name = "bookmarks",
  m = { "<Cmd>BookmarkToggle<CR>", "BookmarkToggle" },
  i = { "<Cmd>BookmarkAnnotate<CR>", "BookmarkAnnotate" },
  n = { "<Cmd>BookmarkNext<CR>", "BookmarkNext" },
  p = { "<Cmd>BookmarkPrev<CR>", "BookmarkPrev" },
  a = { "<Cmd>BookmarkShowAll<CR>", "BookmarkShowAll" },
  c = { "<Cmd>BookmarkClear<CR>", "BookmarkClear" },
  x = { "<Cmd>BookmarkClearAll<CR>", "BookmarkClearAll" },
}

-- 插件 telescope 强大搜索工具
lvim.builtin.which_key.mappings["f"] = {
  name = "telescope",
  f = {
    function()
      require("lvim.core.telescope.custom-finders").find_project_files({ previewer = false })
    end,
    "Find File",
  },
  o = { "<Cmd>Telescope oldfiles previewer=false<CR>", "Find Recent File" },
  b = { "<Cmd>Telescope buffers previewer=false<CR>", "Find Buffers" },
  l = { "<Cmd>Telescope live_grep_args<CR>", "Live Grep Args" },
  L = { "<Cmd>Telescope grep_string<CR>", "Grep String" },
  r = { "<Cmd>Telescope resume<CR>", "Resume last search" },
  c = { "<Cmd>Telescope current_buffer_fuzzy_find<CR>", "Current Buffer Fuzzy Find" },
  -- 列出所有函数、变量等
  t = { "<Cmd>Telescope treesitter<CR>", "Treesitter" },
  -- 书签相关搜索
  m = {
    name = "bookmarks",
    a = { "<Cmd>Telescope vim_bookmarks current_file<CR>", "current_file's bookmarks" },
    A = { "<Cmd>Telescope vim_bookmarks all<CR>", "all bookmarks" },
  },
}
-- live_grep_args 使用参数
-- -i ignore case
-- -s 大小写敏感
-- -w match word
-- -v 反转匹配
-- -g 通配符文件或文件夹，可以用!来取反
-- -F fixed-string 原意字符串，类似python的 r'xxx'

-- examples:
-- command	Description
-- rg image utils.py	Search in a single file utils.py
-- rg image src/	Search in dir src/ recursively
-- rg image	Search image in current dir recursively
-- rg '^We' test.txt	Regex searching support (lines starting with We)
-- rg -i image	Search image and ignore case (case-insensitive search)
-- rg -s image	Smart case search
-- rg -F '(test)'	Search literally, i.e., without using regular expression
-- rg image -g '*.py'	File globing (search in certain files), can be used multiple times
-- rg image -g '!*.py'	Negative file globing (do not search in certain files)
-- rg image --type py or rg image -tpy1	Search image in Python file
-- rg image -Tpy	Do not search image in Python file type
-- rg -l image	Only show files containing image (Do not show the lines)
-- rg --files-without-match image	Show files not containing image
-- rg -v image	Inverse search (search files not containing image)
-- rg -w image	Search complete word
-- rg --count	Show the number of matching lines in a file
-- rg --count-matches	Show the number of matchings in a file
-- rg neovim --stats	Show the searching stat (how many matches, how many files searched etc.)

-- 配合 nvim-tree 快捷键 ~/.local/share/lunarvim/lvim/lua/lvim/core/nvimtree.lua
-- gtf : 当前文件夹下搜索文件
-- gtg : 当前文件夹下搜索内容

-- 文本搜索（可带搜索参数）
-- keymap('n', '<leader>fl', '<Cmd>Telescope live_grep_args<CR>', { noremap = true, silent = true })
-- 书签搜索
-- keymap('n', '<leader>fc', '<Cmd>Telescope vim_bookmarks current_file<CR>', { noremap = true, silent = true })
-- keymap('n', '<leader>fa', '<Cmd>Telescope vim_bookmarks all<CR>', { noremap = true, silent = true })

-- 插件 folke/persistence.nvim 会话session管理
lvim.builtin.which_key.mappings["S"] = {
  name = "Session",
  c = { "<cmd>lua require('persistence').load()<cr>", "Restore last session for current dir" },
  l = { "<cmd>lua require('persistence').load({ last = true })<cr>", "Restore last session" },
  Q = { "<cmd>lua require('persistence').stop()<cr>", "Quit without saving session" },
}

-- 插件：akinsho/toggleterm.nvim 智能终端
vim.cmd([[
  autocmd TermEnter term://*toggleterm#*
      \ tnoremap <silent><C-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>
]])
-- 开启终端
-- 支持多终端：2<C-t> 即打开终端 2
keymap("n", "<C-t>", '<Cmd>exe v:count1 . "ToggleTerm"<CR><CR>', { noremap = true, silent = true, desc = "ToggleTerm" })
-- 退出终端模式
keymap("t", "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true })
keymap("t", "Q", "<Cmd>close<CR>", { noremap = true, silent = true })

-- 其他
lvim.builtin.which_key.mappings["a"] = {
  name = "Application",
  e = { "<CMD>NvimTreeFindFile<CR>", "Explorer" },
  o = { "<CMD>SymbolsOutline<CR>", "Outline" },
  t = { "<CMD>TodoTrouble<CR>", "TODO" },
}
