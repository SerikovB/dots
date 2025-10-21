local M = {
  completion = { completeopt = "menu,menuone,noinsert" },
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  mapping = require("mappings").nvim_cmp(),
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "nvim_lua" },
    { name = "async_path" },
  },
  window = {
    completion = require("cmp").config.window.bordered(),
    documentation = require("cmp").config.window.bordered(),
  },

  enabled = function()
    local disabled = false
    disabled = disabled or (vim.api.nvim_get_option_value("buftype", { buf = 0 }) == "prompt")
    disabled = disabled or (vim.fn.reg_recording() ~= "")
    disabled = disabled or (vim.fn.reg_executing() ~= "")
    disabled = disabled or require("cmp.config.context").in_treesitter_capture "comment"
    return not disabled
  end,
}

return M
