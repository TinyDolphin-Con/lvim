lvim.plugins = {
  ---------------------------
  ------ UI & 颜色主题 ------
  ---------------------------


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

  ---------------------------
  ------ Git ---------------
  ---------------------------

  ---------------------------
  ------ 其他 ---------------
  ---------------------------
}
