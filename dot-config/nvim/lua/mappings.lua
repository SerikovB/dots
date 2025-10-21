local M = {}

local map = vim.keymap.set

M.mapleader = function()
  vim.g.mapleader = " "
  vim.g.maplocalleader = " "
end

M.defaults = function()
  map("n", "<leader>n", "<cmd>set nu!<CR>", { desc = "toggle line number" })
  map("n", "<leader>rn", "<cmd>set rnu!<CR>", { desc = "toggle relative number" })
end

M.lsp_config = function(bufnr)
  local function opts(desc)
    return { buffer = bufnr, desc = "LSP " .. desc }
  end

  local ts = require "telescope.builtin"
  if ts then
    map("n", "gr", ts.lsp_references, opts "references")
    map("n", "gd", ts.lsp_definitions, opts "definitions")
    map("n", "gi", ts.lsp_implementations, opts "implementations")
    map("n", "<leader>td", ts.lsp_type_definitions, opts "type definitions")
    map("n", "<leader>ds", ts.lsp_document_symbols, opts "document symbols")
    map("n", "<leader>ws", ts.lsp_dynamic_workspace_symbols, opts "dynamic workspace symbols")
  else
    map("n", "gr", vim.lsp.buf.references, opts "references")
    map("n", "gd", vim.lsp.buf.definitions, opts "definitions")
    map("n", "gi", vim.lsp.buf.implementation, opts "implementations")
    map("n", "<leader>td", vim.lsp.buf.type_definition, opts "type definitions")
    map("n", "<leader>ds", vim.lsp.buf.document_symbol, opts "document symbols")
    map("n", "<leader>ws", vim.lsp.buf.workspace_symbol, opts "dynamic workspace symbols")
  end

  map("n", "ga", vim.lsp.buf.code_action, opts "code actions")
  map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts "add workspace folder")
  map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts "remove workspace folder")
  map("n", "<leader>rr", vim.lsp.buf.rename, opts "rename all references")
end

M.nvim_cmp = function()
  local cmp = require "cmp"

  return {
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),

    ["<CR>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    },

    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif require("luasnip").expand_or_jumpable(1) then
        require("luasnip").expand_or_jump(1)
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif require("luasnip").jumpable(-1) then
        require("luasnip").jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  }
end

M.themes = function() end

return M
