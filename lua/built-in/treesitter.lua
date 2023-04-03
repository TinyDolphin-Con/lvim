local _M = { _VERSION = "0.1" }

_M.load = function()
  -- 设置折叠
  vim.opt.foldmethod = "expr"
	vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
  vim.opt.foldtext =
    [[substitute(getline(v:foldstart),'\\t',repeat('\ ',&tabstop),'g').'...'.trim(getline(v:foldend)) . ' (' . (v:foldend - v:foldstart + 1) . ' lines)']]

  -- 自动安装相关语法的高亮显示
  lvim.builtin.treesitter.auto_install = true
  lvim.builtin.treesitter.ensure_installed = { "comment", "markdown_inline", "regex" }

  -- 设置 treesitter
  lvim.builtin.treesitter.matchup.enable = true
  lvim.builtin.treesitter.autotag.enable = true
	lvim.builtin.treesitter.rainbow.enable = true
	lvim.builtin.treesitter.highlight.enable = true
  lvim.builtin.treesitter.ensure_installed = {
		"bash",
		"vim",
		"lua",
		"c",
		"make",
		"cpp",
		"cmake",
		"go",
		"gomod",
		"python",
		"javascript",
		"typescript",
		"tsx",
		"http",
		"html",
		"css",
		"markdown",
		"json",
		"jsonc",
		"yaml",
		"toml",
		"comment",
		"regex",
		"dockerfile",
	}
 --  lvim.builtin.treesitter.textobjects.select = {
	-- 	enable = true,
	-- 	lookahead = true,
	-- 	keymaps = {
	-- 		["ac"] = "@class.outer",
	-- 		["ic"] = "@class.inner",
	-- 		["af"] = "@function.outer",
	-- 		["if"] = "@function.inner",
	-- 		["aa"] = "@parameter.outer",
	-- 		["ia"] = "@parameter.inner",
	-- 	},
	-- }
 --  lvim.builtin.treesitter.textobjects.move = {
	-- 	enable = true,
	-- 	set_jumps = true, -- whether to set jumps in the jumplist
	-- 	goto_next_start = {
	-- 		["]f"] = "@function.outer",
	-- 		["]]"] = "@class.outer",
	-- 	},
	-- 	goto_next_end = {
	-- 		["]F"] = "@function.outer",
	-- 		["]["] = "@class.outer",
	-- 	},
	-- 	goto_previous_start = {
	-- 		["[f"] = "@function.outer",
	-- 		["[["] = "@class.outer",
	-- 	},
	-- 	goto_previous_end = {
	-- 		["[F"] = "@function.outer",
	-- 		["[]"] = "@class.outer",
	-- 	},
	-- }
	-- lvim.builtin.treesitter.textobjects.swap = {
	-- 	enable = true,
	-- 	swap_next = {
	-- 		["<M-a>"] = "@parameter.inner",
	-- 	},
	-- 	swap_previous = {
	-- 		["<M-A>"] = "@parameter.inner",
	-- 	},
	-- }
end


return _M
