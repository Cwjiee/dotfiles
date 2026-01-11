vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 8
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.softtabstop = 2
vim.opt.smartindent = true

vim.opt.termguicolors = true
vim.opt.guicursor = "n-v-i-c:block-Cursor"

vim.opt.scrolloff = 10
vim.opt.signcolumn = "yes"

vim.opt.updatetime = 50

vim.opt.wrap = false

-- to tell  Neovim where the Python executable is, so it doesn't take time to scan Homebrew paths and shell environment to find python provider.
vim.g.python3_host_prog = '/Users/weijie/.pyenv/versions/3.12.8/bin/python3'

-- Prevent Neovim from searching for providers you don't use
-- This stops Neovim from scanning your $PATH for these binaries on startup
-- vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
-- vim.g.loaded_ruby_provider = 0
--
-- Optional: Speed up loading of large files
-- Disables certain features for very large files to keep the UI snappy
vim.g.bigfile_size = 1024 * 100 -- 100 KB
