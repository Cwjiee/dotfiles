return {
  { 
    "mason-org/mason.nvim",
    version = "^1.0.0",
    config = function()
      require("mason").setup()
    end
  },
  { "mason-org/mason-lspconfig.nvim", version = "^1.0.0" },
  {
    "neovim/nvim-lspconfig",
    dependencies = { 
      "mason-org/mason.nvim",
      "mason-org/mason-lspconfig.nvim"
    },
    config = function()
      require("mason-lspconfig").setup()
    end,
    config = function()
       require("mason-lspconfig").setup({
         ensure_installed = { "lua_ls" },
         automatic_installation = true,
       })

    local lspconfig = require("lspconfig")

    require("mason-lspconfig").setup_handlers({
      function(server_name)
        lspconfig[server_name].setup({})
      end
    })

      require("lspconfig").jdtls.setup {
        cmd = { '/Users/weijie/.local/share/nvim/mason/bin/jdtls' },
      }
    end
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "L3MON4D3/LuaSnip",
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        mapping = cmp.mapping.preset.insert({
          ["<Tab>"] = cmp.mapping.select_next_item(),
          ["<S-Tab>"] = cmp.mapping.select_prev_item(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = { { name = "nvim_lsp" } }
      })
    end
  }
}

-- return {
--   {
--     "mason-org/mason.nvim",
--     version = "1.11.0",
--     config = function()
--       require("mason").setup()
--     end
--   },
-- }
