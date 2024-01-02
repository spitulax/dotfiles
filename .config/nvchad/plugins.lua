local M = {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      flavour = "mocha",
    },
    priority = 1000,
  },

  {
    "nvim-neorg/neorg",
    ft = "norg",
    build = ":Neorg sync-parsers",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = function()
      return require("custom.configs.neorg")
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = function()
      return vim.tbl_deep_extend("force", require("plugins.configs.treesitter"), require("custom.configs.treesitter"))
    end,
  },

  {
    "mg979/vim-visual-multi",
    branch = "master",
    config = function()
      require("custom.configs.vim-visual-multi")
    end,
    lazy = false,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = function()
      return vim.tbl_deep_extend("force", require("plugins.configs.nvimtree"), require("custom.configs.nvim-tree"))
    end,
  },

  {
    "lewis6991/gitsigns.nvim",
    opts = function()
      return vim.tbl_deep_extend("force", require("plugins.configs.others").gitsigns, require("custom.configs.others").gitsigns)
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = function()
      return require("custom.configs.mason")
    end
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require("plugins.configs.lspconfig")
      require("custom.configs.lspconfig")
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    opts = function()
      return vim.tbl_deep_extend("force", require("plugins.configs.cmp"), require("custom.configs.cmp"))
    end
  },
}

return M
