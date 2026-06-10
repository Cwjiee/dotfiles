if vim.loader then
  vim.loader.enable()
end
vim.cmd("syntax off")

vim.cmd("filetype plugin on")
require("config.lazy")
require("config.keymaps")
require("config.options")
require("config.autocmds")
