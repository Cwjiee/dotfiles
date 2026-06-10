vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 150 })
  end,
})

vim.api.nvim_create_autocmd('FileType', {
      pattern = '*',
      callback = function()
        local lang = vim.treesitter.language.get_lang(vim.bo.filetype) or vim.bo.filetype
        -- Check if the parser is installed and can be loaded
        if pcall(vim.treesitter.language.inspect, lang) then
          vim.treesitter.start()
        end
      end,
    })

