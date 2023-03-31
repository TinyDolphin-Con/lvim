local _M = { _VERSION = "0.1" }

_M.load = function()

  lvim.builtin.gitsigns.opts.signs = {
    add          = {hl = 'GitSignsAdd'   , text = '+', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
    change       = {hl = 'GitSignsChange', text = '│', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    delete       = {hl = 'GitSignsDelete', text = '-', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    topdelete    = {hl = 'GitSignsDelete', text = '-', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    untracked    = {hl = 'GitSignsAdd',    text = '+', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
    changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
  }

  lvim.builtin.gitsigns.opts.signcolumn = true
  -- lvim.builtin.gitsigns.opts.numhl = true
  lvim.builtin.gitsigns.opts.linehl = true
  lvim.builtin.gitsigns.opts.word_diff = true

end

return _M
