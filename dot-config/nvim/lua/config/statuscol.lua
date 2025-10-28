local M = {}
M.defaults = function()
  local builtin = require "statuscol.builtin"
  require("statuscol").setup {
    relculright = true,
    segments = {
      {
        sign = {
          namespace = { "gitsigns" },
          maxwidth = 1,
          auto = true,
        },
        click = "v:lua.ScSa",
      },
      {
        sign = {
          namespace = { "diagnostic" },
          maxwidth = 1,
          auto = true,
        },
        click = "v:lua.ScSa",
      },
      {
        text = { builtin.lnumfunc, " " },
        condition = { true, builtin.not_empty },
        click = "v:lua.ScLa",
      },
    },
  }
end

return M
