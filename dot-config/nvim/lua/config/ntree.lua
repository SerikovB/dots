local M = {}

M.defaults = function()
  require("nvim-tree").setup {}
  require("mappings").nvim_tree()
end

return M
