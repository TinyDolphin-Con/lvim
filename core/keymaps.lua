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
lvim.keys.normal_mode["SP"] = ":setlocal paste!<CR>"

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
keymap({'n', 'x'}, ',', '<Cmd>HopChar1<CR>', { noremap = true, silent = true })
keymap({'n', 'x'}, ',,', '<Cmd>HopChar2<CR>', { noremap = true, silent = true })


-- 插件 LSP Bindings

-- 插件 telescope


-- 插件 toggleterm
