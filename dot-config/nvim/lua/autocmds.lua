local M = {}

M.load = function()
  local autocmd = vim.api.nvim_create_autocmd
  -- Format document before saving
  autocmd("BufWritePre", {
    pattern = "*",
    callback = function(args)
      require("conform").format { bufnr = args.buf }
    end,
  })
end

return M
