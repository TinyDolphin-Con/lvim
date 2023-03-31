-- keymappings <https://www.lunarvim.org/docs/configuration/keybindings>
lvim.leader = "space"

-- 启用键盘映射
local keymap = vim.keymap.set

-- 正常模式 normal
-- 快速保存
lvim.keys.normal_mode["W"] = ":w<CR>"
-- 快速退出
lvim.keys.normal_mode["Q"] = ":q<CR>"
-- 快速保存并退出
lvim.keys.normal_mode["qw"] = ":wq<CR>"
-- 选中全文（普通模式、可视模式和选择模式）
lvim.keys.normal_mode["VV"] = "<Esc>gg0vG$<CR>"
-- 取消搜索高亮
lvim.keys.normal_mode["<leader><CR>"] = ":nohlsearch<CR>"

-- 向下翻转半页并居中
lvim.keys.normal_mode["<C-d>"] = "<C-d>zz"
lvim.keys.normal_mode["<C-u>"] = "<C-u>zz"

-- 切换粘贴模式
lvim.keys.normal_mode["SP"] = {":setlocal paste!<CR>"}

-- 开启拼写检查
-- lvim.keys.normal_mode["SS"] = ":setlocal spell!<CR>"
-- ]s ：移动到下一个拼写错误处
-- [s ：移动到上一个拼写错误处
-- z= ：选择正确的拼写
-- zg ：添加用户拼写
-- zw ：删除用户拼写

-- 切分分屏：右左上下
lvim.keys.normal_mode["sl"] = ":set splitright<CR>:vsplit<CR>"
lvim.keys.normal_mode["sh"] = ":set nosplitright<CR>:vsplit<CR>"
lvim.keys.normal_mode["sk"] = ":set nosplitbelow<CR>:split<CR>"
lvim.keys.normal_mode["sj"] = ":set splitbelow<CR>:split<CR>"
-- 调整分屏大小
lvim.keys.normal_mode["SL"] = ":vertical resize-5<CR>"
lvim.keys.normal_mode["SH"] = ":vertical resize+5<CR>"
lvim.keys.normal_mode["SK"] = ":res +5<CR>"
lvim.keys.normal_mode["SJ"] = ":res -5<CR>"


-- 插入模式 insert
-- 移动光标
lvim.keys.insert_mode["<C-k>"] = "<Up>"
lvim.keys.insert_mode["<C-J>"] = "<Down>"
lvim.keys.insert_mode["<C-h>"] = "<Left>"
lvim.keys.insert_mode["<C-l>"] = "<Right>"
-- 向后删除
lvim.keys.insert_mode["<C-d>"] = "<Delete>"

-- 插入模式，快速打印当前时间（暂时失效）
-- keymap('i', 'xdate', [[<C-r>=strftime('%Y-%m-%d %H:%M:%S')<CR>]], { noremap = true, silent = true })


-- 可视模式
-- 可视模式下，针对选中内容，增加括号
lvim.keys.visual_mode["("] = "<Esc>`>a)<Esc>`<i(<Esc><CR>"
lvim.keys.visual_mode["["] = "<Esc>`>a]<Esc>`<i[<Esc><CR>"
lvim.keys.visual_mode["{"] = "<Esc>`>a}<Esc>`<i{<Esc><CR>"
lvim.keys.visual_mode["'"] = "<Esc>`>a'<Esc>`<i'<Esc>"
lvim.keys.visual_mode["`"] = "<Esc>`>a`<Esc>`<i`<Esc>"
lvim.keys.visual_mode["\""] = "<Esc>`>a\"<Esc>`<i\"<Esc>"


-- 命令行模式
keymap('c', '<C-a>', '<Home>', { noremap = true, silent = true })
keymap('c', '<C-e>', '<End>', { noremap = true, silent = true })


-- 其他
-- 折叠快捷键
-- zf{motion} ：将指定动作的范围进行折叠（e.g. 将整个段落进行折叠 zfap）
-- zd ：删除折叠
-- zo ：打开当前折叠
-- zc ：关闭当前折叠
-- zj ：跳转到下一个折叠
-- zk ：跳转到上一个折叠
-- zR ：打开所有折叠
-- zM ：关闭所有折叠

-- 插件 hop.nvim 窗口内快速跳转
lvim.keys.normal_mode[","] = "<Cmd>HopChar1<CR>"
lvim.keys.normal_mode[",,"] = "<Cmd>HopChar2<CR>"

-- 插件 s1n7ax/nvim-window-picker 窗口选择↵
local picker = require('window-picker')
-- 快速选择窗口
keymap('n', 'gw', function()
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
keymap('n', 'gW', swap_windows, { noremap = true, silent = true, desc = 'Swap windows' })

-- 插件 LSP Bindings
-- 预览跳转定义位置
keymap({"n", "x"}, "gpd", "<Cmd>lua require('goto-preview').goto_preview_definition()<CR>", { noremap = true, silent = true, desc = "Preview definition" })
-- 预览跳转引用位置
keymap({"n", "x"}, "gpr", "<Cmd>lua require('goto-preview').goto_preview_implementation()<CR>", { noremap = true, silent = true, desc = "Preview implementation" })
-- 快速跳转
keymap({"n", "x"}, "gd", "<cmd>TroubleToggle lsp_definitions<cr>", { noremap = true, silent = true, desc = "Lsp definitions" })
keymap({"n", "x"}, "gr", "<cmd>TroubleToggle lsp_references<cr>", { noremap = true, silent = true, desc = "Lsp references" })
keymap({"n", "x"}, "gi", "<cmd>TroubleToggle lsp_implementations<cr>", { noremap = true, silent = true, desc = "Lsp implementations" })
keymap({"n", "x"}, "gt", "<cmd>TroubleToggle lsp_type_definitions<cr>", { noremap = true, silent = true, desc = "Lsp type_definitions" })

-- 插件 clangd_extensions.nvim clangd 增强
-- 快速跳转：头文件和源文件之间
keymap({'n', 'v'}, 'gsh', '<Cmd>ClangdSwitchSourceHeader<CR>', { noremap = true, silent = true, desc = "Switch Source Header" })

-- 插件 folke/trouble.nvim 漂亮的列表，显示诊断、引用、搜索结果、快速修复和定位列表↵
lvim.builtin.which_key.mappings["t"] = {
  name = "trouble",
  -- d = { "<cmd>TroubleToggle lsp_definitions<cr>", "definitions" },
  -- r = { "<cmd>TroubleToggle lsp_references<cr>", "references" },
  -- i = { "<cmd>TroubleToggle lsp_implementations<cr>", "implementations" },
  -- t = { "<cmd>TroubleToggle lsp_type_definitions<cr>", "type_definitions" },
  T = { "<cmd>TroubleToggle<cr>", "trouble" },
  W = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "workspace" },
  D = { "<cmd>TroubleToggle document_diagnostics<cr>", "document" },
  Q = { "<cmd>TroubleToggle quickfix<cr>", "quickfix" },
  L = { "<cmd>TroubleToggle loclist<cr>", "loclist" },
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
  f = { "<Cmd>Telescope git_files show_untracked=true<CR>", "git_files" },
  o = { "<Cmd>Telescope oldfiles<CR>", "oldfiles" },
  b = { "<Cmd>Telescope buffers<CR>", "buffers" },
  l = { "<Cmd>Telescope live_grep_args<CR>", "live_grep_args" },
  L = { "<Cmd>Telescope grep_string<CR>", "grep_string" },
  r = { "<Cmd>Telescope resume<CR>", "resume" },
  -- 列出所有函数、变量等
  t = { "<Cmd>Telescope treesitter<CR>", "treesitter" },
  -- git 相关搜索
  g = {
    name = "git",
    c = { "<Cmd>Telescope git_commits<CR>", "git_commits" },
    s = { "<Cmd>Telescope git_status<CR>", "git_status" },
    S = { "<Cmd>Telescope git_stash<CR>", "git_stash" },
  },
  -- 书签相关搜索
  m = {
    name = "bookmarks",
    a = { "<Cmd>Telescope vim_bookmarks current_file<CR>", "current_file's bookmarks" },
    A = { "<Cmd>Telescope vim_bookmarks all<CR>", "all bookmarks" },
  },
}
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
keymap('n', '<C-t>', '<Cmd>exe v:count1 . "ToggleTerm"<CR><CR>', { noremap = true, silent = true, desc = "ToggleTerm" })
-- 退出终端模式
keymap('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true })
keymap('t', 'Q', '<Cmd>close<CR>', { noremap = true, silent = true })

-- 其他
lvim.builtin.which_key.mappings["a"] = {
		name = "Application",
		e = { "<CMD>NvimTreeFindFile<CR>", "Explorer" },
		o = { "<CMD>SymbolsOutline<CR>", "Outline" },
		t = { "<CMD>TodoTrouble<CR>", "TODO" },
}
