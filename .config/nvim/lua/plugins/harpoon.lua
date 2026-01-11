return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")
    local extensions = require("harpoon.extensions")
    harpoon:setup({
      settings = {
        save_on_toggle = true
      }
    })
    harpoon:extend(extensions.builtins.navigate_with_number());
  end,
  keys = {
    { "<leader>a", function() require("harpoon"):list():add() end },
    { "<leader>e", function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end },
    { "<leader>1", function() require("harpoon"):list():select(1) end },
    { "<leader>2", function() require("harpoon"):list():select(2) end },
    { "<leader>3", function() require("harpoon"):list():select(3) end },
    { "<leader>4", function() require("harpoon"):list():select(4) end },
    { "<C-S-P>", function() require("harpoon"):list():prev() end },
    { "<C-S-N>", function() require("harpoon"):list():next() end },
  }
}
