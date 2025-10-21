local M = {}

M.defaults = function()
  local opt = vim.opt
  local vc = vim.cmd
  local o = vim.o
  local g = vim.g

  o.clipboard = "unnamedplus"
  o.cursorline = true
  o.cursorlineopt = "number"
  o.laststatus = 3
  o.termguicolors = true

  o.expandtab = true
  o.shiftwidth = 2
  o.smartindent = true
  o.softtabstop = 2
  o.tabstop = 2

  o.ignorecase = true
  o.mouse = "a"
  o.smartcase = true
  opt.fillchars = { eob = " " }

  o.number = true
  o.numberwidth = 2
  o.relativenumber = true
  o.ruler = false

  o.splitbelow = true
  o.splitright = true
  o.timeoutlen = 400
  o.undofile = true
end

return M
