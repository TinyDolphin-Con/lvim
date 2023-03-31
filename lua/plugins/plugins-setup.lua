lvim.plugins = {
  ---------------------------
  ------ UI & 颜色主题 ------
  ---------------------------
  -- 美化括号
  {
    "p00f/nvim-ts-rainbow",
  },
  -- 漂亮的列表，显示诊断、引用、搜索结果、快速修复和定位列表
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  -- 屏幕滚动
  {
    "karb94/neoscroll.nvim",
    event = "WinScrolled",
    config = function()
      require('neoscroll').setup({
        -- All these keys will be mapped to their corresponding default scrolling animation
        mappings = {'<C-u>', '<C-d>', '<C-b>', '<C-f>',
        '<C-y>', '<C-e>', 'zt', 'zz', 'zb'},
        hide_cursor = true,          -- Hide cursor while scrolling
        stop_eof = true,             -- Stop at <EOF> when scrolling downwards
        use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
        respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
        cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
        easing_function = nil,        -- Default easing function
        pre_hook = nil,              -- Function to run before the scrolling animation starts
        post_hook = nil,              -- Function to run after the scrolling animation ends
      })
    end
  },
  -- 窗口选择
  {
    "s1n7ax/nvim-window-picker",
    tag = "1.*",
    config = function()
      require("window-picker").setup({})
    end,
  },
  -- 高亮显示并支持搜索 TODO
  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    config = function()
      require("todo-comments").setup()
    end,
  },


  ---------------------------
  ------ 高效编码 -----------
  ---------------------------
  -- 显示匹配
  {
    "andymass/vim-matchup",
    event = "CursorMoved",
    setup = function()
      vim.g.matchup_surround_enabled = 1
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end,
  },
  -- 文档注释插件
  {
    "stevearc/dressing.nvim",
    event = "BufWinEnter",
    config = function()
      require("dressing").setup({
        input = {
          get_config = function()
            if vim.api.nvim_buf_get_option(0, "filetype") == "neo-tree" then
              return { enabled = false }
            end
          end,
        },
        select = {
          format_item_override = {
            codeaction = function(action_tuple)
              local title = action_tuple[2].title:gsub("\r\n", "\\r\\n")
              local client = vim.lsp.get_client_by_id(action_tuple[1])
              return string.format("%s\t[%s]", title:gsub("\n", "\\n"), client.name)
            end,
          },
        },
      })
    end,
  },

  ---------------------------
  ------ 搜索 ---------------
  ---------------------------
  -- hop Buffer 内快速移动
  {
    "phaazon/hop.nvim",
    event = "BufRead",
    config = function() require("hop").setup() end,
  },
  -- telescope-vim-bookmarks.nvim 书签搜索
  {
    "tom-anders/telescope-vim-bookmarks.nvim",
    config = function()
      require("telescope").load_extension("vim_bookmarks")
    end,
  },
  -- telescope-live-grep-args.nvim 可指定参数的文本搜索
  {
    "nvim-telescope/telescope-live-grep-args.nvim",
    config = function()
      require("telescope").load_extension("live_grep_args")
    end,
  },

  ---------------------------
  ------ 书签 ---------------
  ---------------------------
  -- 书签
  {
    "MattesGroeger/vim-bookmarks",
    event = "BufRead",
    setup = function()
      vim.cmd([[hi link BookmarkSign TodoSignTODO]])
      vim.cmd([[hi link BookmarkAnnotationSign TodoSignTODO]])
    end,
    config = function()
      vim.g.bookmark_sign = ""
      vim.g.bookmark_annotation_sign = ""
      vim.g.bookmark_display_annotation = 1
      vim.g.bookmark_no_default_key_mappings = 1
      vim.g.bookmark_auto_save_file = join_paths(get_cache_dir(), "vim-bookmarks")
    end,
  },

  ---------------------------
  ------ C/C++ ---------------
  ---------------------------
  -- 显示函数签名
  {
    "ray-x/lsp_signature.nvim",
    config = function()
      require("lvim.lsp").common_on_attach = function(client, bufnr)
        require("lsp_signature").on_attach({
          extra_trigger_chars = { "(", "," },
          toggle_key = "<C-s>", -- 插入模式下的切换开关
        })
      end
    end,
  },
  -- 跳转项目根目录
  {
    "ahmedkhalf/lsp-rooter.nvim",
    event = "BufRead",
    config = function()
      require("lsp-rooter").setup()
    end,
  },
  -- clangd 增强插件，用于增强对 C++ 的语法补全和代码导航功能
  {
    "p00f/clangd_extensions.nvim",
    ft = { "c", "cpp", "objc", "objcpp" },
    config = function()
      require("clangd_extensions").setup({
        server = {
          cmd = { "clangd", "--clang-tidy", "--enable-config", "--function-arg-placeholders=0" },
          on_attach = function(client, bufnr)
            require("lvim.lsp").common_on_attach(client, bufnr)
            -- require("lsp_signature").on_attach(require("user.config.lsp_signature").config_table)
            -- vim.keymap.set("n", "<C-h>", "<CMD>ClangdSwitchSourceHeader<CR>", { noremap = true, buffer = bufnr })
          end,
          on_init = require("lvim.lsp").common_on_init,
          capabilities = require("lvim.lsp").common_capabilities(),
        },
        extensions = {
          inlay_hints = {
            other_hints_prefix = " ",
          },
        },
      })
    end,
  },
  {
  "rmagatti/goto-preview",
    config = function()
      require('goto-preview').setup {
        width = 120; -- Width of the floating window
        height = 25; -- Height of the floating window
        default_mappings = false; -- Bind default mappings
        debug = false; -- Print debug information
        opacity = nil; -- 0-100 opacity level of the floating window where 100 is fully transparent.
        post_open_hook = nil -- A function taking two arguments, a buffer and a window to be ran as a hook.
        -- You can use "default_mappings = true" setup option
        -- Or explicitly set keybindings
        -- vim.cmd("nnoremap gpd <cmd>lua require('goto-preview').goto_preview_definition()<CR>")
        -- vim.cmd("nnoremap gpi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>")
        -- vim.cmd("nnoremap gP <cmd>lua require('goto-preview').close_all_win()<CR>")
      }
    end
  },
  -- 符号侧边栏
  {
    "simrat39/symbols-outline.nvim",
    config = function()
      require('symbols-outline').setup()
    end
  },
  -- zsh 补全插件
  {
    "tamago324/cmp-zsh",
    config = function()
      vim.list_extend(lvim.builtin.cmp.sources, { { name = "zsh" } })
      require("cmp_zsh").setup({
        filetype = { "sh", "zsh" },
      })
    end,
    requires = { "Shougo/deol.nvim" },
  },

  ---------------------------
  ------ Git ---------------
  ---------------------------

  ---------------------------
  ------ 其他 ---------------
  ---------------------------
  -- 会话 session 管理
  {
    "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    module = "persistence",
    config = function()
      require("persistence").setup({
        dir = join_paths(get_cache_dir(), "session/"),
        options = { "buffers", "curdir", "tabpages", "winsize" },
      })
    end,
  },
}
