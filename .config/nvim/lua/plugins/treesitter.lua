return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate'
}

-- return {
--   "romus204/tree-sitter-manager.nvim",
--   dependencies = {}, -- tree-sitter CLI must be installed system-wide
--   config = function()
--     require("tree-sitter-manager").setup({
--       -- Default Options
--       ensure_installed = { "go", "embedded_template", "ruby", "html" }, -- list of parsers to install at the start of a neovim session
--       -- border = nil, -- border style for the window (e.g. "rounded", "single"), if nil, use the default border style defined by 'vim.o.winborder'. See :h 'winborder' for more info.
--       auto_install = true, -- if enabled, install missing parsers when editing a new file
--       highlight = true, -- treesitter highlighting is enabled by default
--       additional_vim_regex_highlighting = false,
--       -- parser_dir = vim.fn.stdpath("data") .. "/site/parser",
--       -- query_dir = vim.fn.stdpath("data") .. "/site/queries",
--     })
--   end
-- }

-- return {
--   "nvim-treesitter/nvim-treesitter",
--   lazy = false,
--   -- event = { "BufReadPost", "BufNewFile" },
--   build = ":TSUpdate",
--   dependencies = {
--     "windwp/nvim-ts-autotag",
--   },
--   config = function()
--     local configs = require("nvim-treesitter.config")
-- 
--     vim.filetype.add({
--       filename = {
--         [".zshrc"] = "bash",
--         [".zshenv"] = "bash",
--         [".zprofile"] = "bash",
--       },
--     })
-- 
--     configs.setup({
--       highlight = {
--         enable = true,
--         additional_vim_regex_highlighting = false,
--       },
--       indent = { enable = true },
--       autotag = { enable = true },
--       ensure_installed = {
--         "python", "lua", "vim", "vimdoc", "javascript",
--         "typescript", "tsx", "html", "css", "json",
--         "yaml", "markdown", "markdown_inline", "bash",
--         "dockerfile", "gitignore", "ruby"
--       },
--       auto_install = true,
--     })
--   end,
-- }
