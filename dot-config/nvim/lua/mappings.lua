local M = {}

local map = vim.keymap.set

M.mapleader = function()
  vim.g.mapleader = " "
  vim.g.maplocalleader = " "
end

M.defaults = function()
  map("n", "<leader>n", "<cmd>set nu!<cr>", { desc = "Toggle line number" })
  map("n", "<leader>rn", "<cmd>set rnu!<cr>", { desc = "Toggle relative number" })
  map("n", "<leader>-", "<cmd>split<cr>", { desc = "Split window" })
  map("n", "<leader>=", "<cmd>vsplit<cr>", { desc = "Split window vertically" })
  map("n", "<leader>bn", "<cmd>tabnew<cr>", { desc = "Create new buffer in new tab" })
  map("n", "<leader><leader>", "<cmd>noh<cr>", { desc = "Clear search highlight" })
end

M.lsp_config = function(bufnr)
  local function opts(desc)
    return { buffer = bufnr, desc = "LSP " .. desc }
  end

  local ts = require "telescope.builtin"
  map("n", "<leader>d", ts.diagnostics, opts "diagnostics")
  map("n", "gr", ts.lsp_references, opts "references")
  map("n", "gd", ts.lsp_definitions, opts "definitions")
  map("n", "gi", ts.lsp_implementations, opts "implementations")
  map("n", "<leader>td", ts.lsp_type_definitions, opts "type definitions")
  map("n", "<leader>ds", ts.lsp_document_symbols, opts "document symbols")
  map("n", "<leader>ws", ts.lsp_dynamic_workspace_symbols, opts "dynamic workspace symbols")
  -- map("n", "gr", vim.lsp.buf.references, opts "references")
  -- map("n", "gd", vim.lsp.buf.definitions, opts "definitions")
  -- map("n", "gi", vim.lsp.buf.implementation, opts "implementations")
  -- map("n", "<leader>td", vim.lsp.buf.type_definition, opts "type definitions")
  -- map("n", "<leader>ds", vim.lsp.buf.document_symbol, opts "document symbols")
  -- map("n", "<leader>ws", vim.lsp.buf.workspace_symbol, opts "dynamic workspace symbols")

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

M.barbar = function()
  map("n", "<C-n>", "<cmd>BufferNext<cr>", { desc = "Next buffer" })
  map("n", "<C-p>", "<cmd>BufferPrevious<cr>", { desc = "Prev buffer" })

  map("n", "<C-1>", "<cmd>BufferGoto 1<cr>", { desc = "Goto buffer 1" })
  map("n", "<C-2>", "<cmd>BufferGoto 2<cr>", { desc = "Goto buffer 2" })
  map("n", "<C-3>", "<cmd>BufferGoto 3<cr>", { desc = "Goto buffer 3" })
  map("n", "<C-4>", "<cmd>BufferGoto 4<cr>", { desc = "Goto buffer 4" })
  map("n", "<C-5>", "<cmd>BufferGoto 5<cr>", { desc = "Goto buffer 5" })
  map("n", "<C-6>", "<cmd>BufferGoto 6<cr>", { desc = "Goto buffer 6" })
  map("n", "<C-7>", "<cmd>BufferGoto 7<cr>", { desc = "Goto buffer 7" })
  map("n", "<C-8>", "<cmd>BufferGoto 8<cr>", { desc = "Goto buffer 8" })
  map("n", "<C-9>", "<cmd>BufferGoto 9<cr>", { desc = "Goto buffer 9" })
  map("n", "<C-0>", "<cmd>BufferLast<cr>", { desc = "Goto last buffer" })

  map("n", "<leader>mn", "<cmd>BufferMoveNext<cr>", { desc = "Swap current buffer with next one" })
  map("n", "<leader>mp", "<cmd>BufferMovePrevious<cr>", { desc = "Swap current buffer with previous one" })

  map("n", "<leader>bc", "<cmd>BufferClose<cr>", { desc = "Close buffer" })
  map("n", "<leader>br", "<cmd>BufferRestore<cr>", { desc = "Restore buffer" })
  map("n", "<leader>bp", "<cmd>BufferPin<cr>", { desc = "Pin buffer" })
end

M.telescope = function()
  local ts = require "telescope.builtin"
  local function opts(desc)
    return { desc = "Telescope " .. desc }
  end

  map("n", "<leader>ff", ts.find_files, opts "find files")
  map("n", "<leader>lg", ts.live_grep, opts "live grep")
  map("n", "<leader>gf", ts.git_files, opts "git files")
  map("n", "<leader>gs", ts.grep_string, opts "grep string")
end

M.nvim_tree = function()
  local api = require "nvim-tree.api"
  local function opts(desc)
    return { desc = "Nvim-tree " .. desc, noremap = true, silent = true, nowait = true }
  end

  map("n", "<leader>tt", api.tree.focus, opts "open and focus")
  map("n", "<leader>tc", api.tree.close, opts "close")
end

return M
