local M = {}
local vc = vim.cmd

M.defaults = function()
  vim.g.lushwal_configuration = {
    wal_path = vim.fn.stdpath "config" .. "/colors.json",
    addons = {
      lualine = true,
    },
  }
  vc "colorscheme lushwal"
end

return M
