return {
  {
    "mason-org/mason-lspconfig.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "neovim/nvim-lspconfig",
      "mason-org/mason.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      require("mason").setup()
      require("mason-lspconfig").setup({ ensure_installed = { "lua_ls" } })

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

      vim.lsp.config("*", {
        capabilities = capabilities,
        on_attach = on_attach,
      })

      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
      vim.diagnostic.config({ float = { border = "rounded", max_width = 80 } })
    end
  },
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = { "hrsh7th/cmp-nvim-lsp", "L3MON4D3/LuaSnip" },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        sources = { { name = "nvim_lsp" } },
        mapping = cmp.mapping.preset.insert({
          ["<Tab>"] = cmp.mapping.select_next_item(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
      })
    end
  }
}
