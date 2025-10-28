local M = {}

M.defaults = function()
  require("telescope").setup {}
  require("mappings").telescope()
end

return M
