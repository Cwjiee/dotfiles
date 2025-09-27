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
      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
        vim.lsp.handlers.hover,
        {
          border = "rounded",
          max_width = 80,
          wrap = true
        }
      )

      vim.diagnostic.config({
        float = {
          border = "rounded",
          max_width = 80,
        }
      })

      local lspconfig = require("lspconfig")
      local mason_lspconfig = require("mason-lspconfig")

      mason_lspconfig.setup({
        ensure_installed = { "lua_ls" },
        automatic_installation = true,
      })

      local on_attach = function(client, bufnr)
        local bufopts = { noremap = true, silent = true, buffer = bufnr }

        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts) -- Go to Definition
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts) -- Go to Declaration
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts) -- Go to Implementation
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts) -- Show References
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts) -- Hover
        vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts) -- Type Definition
        vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts) -- Formatting
        vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, bufopts) -- Diagnostic navigation
        vim.keymap.set('n', ']d', vim.diagnostic.goto_next, bufopts)
      end

      mason_lspconfig.setup_handlers({
        function(server_name)
          lspconfig[server_name].setup({
            on_attach = on_attach
          })
        end
      })

      -- lspconfig.jdtls.setup {
      --   cmd = { '/Users/weijie/.local/share/nvim/mason/bin/jdtls' },
      -- }
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
