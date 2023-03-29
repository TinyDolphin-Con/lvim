local _M = { _VERSION = "0.1" }

_M.load = function()
  -- 状态栏的风格
  lvim.builtin.lualine.style = "lvim"

  -- 变量
  local components = require("lvim.core.lualine.components")

  -- 左边第一栏显示模式
  lvim.builtin.lualine.sections.lualine_a = { "mode" }

  -- 左边第二栏显示当前工作目录
  lvim.builtin.lualine.sections.lualine_b = {
    {
      function()
        return "  " .. vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
      end,
    },
    components.branch,
  }

  -- 左边第三栏显示如下配置
  lvim.builtin.lualine.sections.lualine_c = {
    -- 当前文件可读状态
    {
      function()
        if not vim.bo.readonly or not vim.bo.modifiable then
          return ""
        end
        return ""
      end,
      color = { fg = "#f7768e" },
    },
    -- git diff
    components.diff,
    -- python env
    components.python_env,
    -- 显示文件的绝对路径
    { "filename", path = 3 },
  }

  -- 右边第一栏显示诊断信息
  lvim.builtin.lualine.sections.lualine_x = {
    components.diagnostics,
  }

  -- 右边第二栏显示如下配置
  components.lsp.icon = { " ", color = { fg = "#ddd" } }
  lvim.builtin.lualine.sections.lualine_y = {
    components.treesitter,
    components.lsp,
    components.spaces,
    components.filetype,
    { "fileformat", color = { fg = "#c2e7f0" } },
  }

  -- 右边第三栏显示如下配置
  lvim.builtin.lualine.sections.lualine_z = {
    {
      function()
        -- 格式化文件大小函数
        local function format_file_size(file)
          local size = vim.fn.getfsize(file)
          if size <= 0 then
            return ""
          end
          local sufixes = { "B", "K", "M", "G" }
          local i = 1
          while size > 1024 do
            size = size / 1024
            i = i + 1
          end
          local fmt = "%.1f%s"
          if i == 1 then
            fmt = "%d%s"
          end
          return string.format(fmt, size, sufixes[i])
        end
        -- 显示文件大小
        local file = vim.fn.expand("%:p")
        if string.len(file) == 0 then
          return ""
        end
        return format_file_size(file)
      end,
      cond = function()
        return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
      end,
    },
    -- 显示文件 当前行数/总行数、当前列号
    { " %l/%L  %c", type = "stl" },
    components.scrollbar,
  }
end

return _M
