lvim.plugins = {

  ----------
  --- UI ---
  ----------
  -- {
  --   's1n7ax/nvim-window-picker',
  --   config = function()
  --     require('window-picker').setup{ selection_chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890'}
  --   end
  -- }

  -- hop Buffer 内快速移动
  {
    "phaazon/hop.nvim",
    event = "BufRead",
    config = function() require("hop").setup() end,
  },

}
