local _M = { _VERSION = "0.1" }

_M.load = function()

  lvim.builtin.telescope.pickers.find_files = {
    find_command = { "fd", "-H" , "-I"},  -- "-H" search hidden files, "-I" do not respect to gitignore
  }

end


return _M
