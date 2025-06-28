return {
  {
    'andweeb/presence.nvim',
    enabled = true,
    config = function()
      require("presence").setup({
        editing_text        = "Manhandling %s",               -- Format string rendered when an editable file is loaded in the buffer (either string or function(filename: string): string)
        file_explorer_text  = "Lost inside %s ඞ",              -- Format string rendered when browsing a file explorer (either string or function(file_explorer_name: string): string)
        git_commit_text     = "Selling my soul to git",       -- Format string rendered when committing changes in git (either string or function(filename: string): string)
        plugin_manager_text = "Downloading 500 plugins I won't use",         -- Format string rendered when managing plugins (either string or function(plugin_manager_name: string): string)
        reading_text        = "Reading %s",               -- Format string rendered when a read-only or unmodifiable file is loaded in the buffer (either string or function(filename: string): string)
        workspace_text      = "Lost in the sauce of %s",            -- Format string rendered when in a git repository (either string or function(project_name: string|nil, filename: string): string)
        line_number_text    = "Drowning in (Line %s/%s)",        -- Format string rendered when `enable_line_number` is set to true (either string or function(line_number: number, line_count: number): string)
      })
    end,
  }
}
