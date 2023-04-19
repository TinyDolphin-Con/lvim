local _M = { _VERSION = "0.1" }

_M.load = function()
  -- lsp 自动安装
  -- lvim.lsp.installer.setup.automatic_installation = true
  -- lvim.lsp.automatic_servers_installation = true

  --lsp  跳过指定 server
  -- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })

  -- lsp
  -- require("lvim.lsp.null-ls.linters").setup({
  -- 	{ filetypes = { "cpp" }, command = "cpplint" },
  -- 	{ filetypes = { "sh" }, command = "shellcheck" },
  -- 	{ filetypes = { "lua" }, command = "luacheck" },
  -- 	{ filetypes = { "go" }, command = "golangci_lint" },
  -- 	{ filetypes = { "python" }, command = "pylint" },
  -- 	{ filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" }, command = "eslint" },
  -- 	{ filetypes = { "html" }, command = "tidy" },
  -- 	{ filetypes = { "css" }, command = "stylelint" },
  -- 	{ filetypes = { "markdown" }, command = "markdownlint", args = { "--disable", "MD013" } },
  -- })

  -- lvim.format_on_save = { pattern = "*", timeout = 2000 }
  -- require("lvim.lsp.null-ls.formatters").setup({
  -- 	{ filetypes = { "cpp" }, command = "clang_format" },
  -- 	{ filetypes = { "sh" }, command = "shfmt", extra_args = { "-i", "2" } },
  -- 	{ filetypes = { "lua" }, command = "stylua" },
  -- 	{ filetypes = { "cmake" }, command = "cmake_format" },
  -- 	{ filetypes = { "go" }, command = "gofmt" },
  -- 	{
  -- 		filetypes = { "python" },
  -- 		command = "yapf",
  -- 		args = { "--style={based_on_style: google, column_limit: 120, indent_width: 4}" },
  -- 	},
  -- 	{ filetypes = { "lua" }, command = "stylua" },
  -- 	{ filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" }, command = "prettier" },
  -- 	{ filetypes = { "html", "css", "markdown" }, command = "prettier" },
  -- })
end

return _M
