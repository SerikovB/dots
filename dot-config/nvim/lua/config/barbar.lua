local M = {}

M.defaults = function()
  require("barbar").setup {
    focus_on_close = "previous",
  }
  require("mappings").barbar()
end

return M
