local map = vim.keymap.set

map("n", "<leader>n", "<cmd>set nu!<CRn", { desc = "toggle line number" })
map("n", "<leader>rn", "<cmd>set rnu!<CR>", { desc = "toggle relative number" })
