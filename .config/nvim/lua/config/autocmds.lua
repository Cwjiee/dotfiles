vim.api.nvim_create_autocmd("FileType", {
  pattern = { "javascript", "typescript", "ruby", "python", "go", "lua", "matlab" },
  callback = function()
    local ft = vim.bo.filetype

    if ft == "python" then
      vim.opt_local.shiftwidth = 4
      vim.opt_local.tabstop = 4
      vim.opt_local.expandtab = true
    elseif ft == "ruby" and ft == "lua" then
      vim.opt_local.shiftwidth = 2
      vim.opt_local.tabstop = 2
      vim.opt_local.expandtab = true
    elseif ft == "go" then
      vim.opt_local.shiftwidth = 4
      vim.opt_local.tabstop = 4
      vim.opt_local.expandtab = false
    elseif ft == "matlab" then
      vim.bo.shiftwidth = 4      -- Number of spaces per indent
      vim.bo.tabstop = 4         -- Tab character visually = 4 spaces
      vim.bo.softtabstop = 4     -- Editing tabs = 4 spaces
      vim.bo.expandtab = true    -- Use spaces instead of tabs
      vim.bo.autoindent = true
      vim.bo.smartindent = true
    elseif ft == "java" then
      vim.opt_local.shiftwidth = 4
      vim.opt_local.tabstop = 4
      vim.opt_local.expandtab = true
    else
      vim.opt_local.shiftwidth = 2
      vim.opt_local.tabstop = 2
      vim.opt_local.expandtab = true
    end
  end,
})

