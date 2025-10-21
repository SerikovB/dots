local M = {}

M.catppuccin = function()
  require("catppuccin").setup {
    flavour = "mocha",
    transparent_background = true,
  }
end

M.tokyonight = function()
  require("tokyonight").setup {
    transparent = true,
    styles = {
      sidebars = "transparent",
      floats = "transparent",
    },
  }
end

M.defaults = function()
  require("fkthemes").setup {
    themes = { "tokyonight", "catppuccin", "gruvbox" },
    transparent_background = true,
  }
end

return M
