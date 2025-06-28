vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- move visual content up/down
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

-- copy to system clipboard
vim.keymap.set("v", "<leader>y", "\"+y")

-- half page up/down but centered
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "<leader>dd", vim.diagnostic.open_float, { desc = "Toggles local troubleshoot"})
