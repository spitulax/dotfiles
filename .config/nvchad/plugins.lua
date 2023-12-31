local M = {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
  },

  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("neorg").setup(function()
        return require("custom.configs.neorg")
      end)
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = function()
      return require("custom.configs.treesitter")
    end,
  },

  {
    "mg979/vim-visual-multi",
    branch = "master",
    lazy = false,
    init = require("custom.configs.vim-visual-multi"),
  },
}

return M
