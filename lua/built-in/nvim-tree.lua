local _M = { _VERSION = "0.1" }

_M.load = function()

lvim.builtin.nvimtree.setup.view.adaptive_size = 50 -- 宽度动态调整，最大值 50

end

return _M
