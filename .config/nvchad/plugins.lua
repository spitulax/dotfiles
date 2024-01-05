local M = {
  "nvim-lua/popup.nvim",

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
    enabled = false,
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

  {
    'nvim-telescope/telescope.nvim', branch = '0.1.x',
    dependencies = {
      'nvim-telescope/telescope-media-files.nvim',
    },
    opts = function()
      return vim.tbl_deep_extend("force", require("plugins.configs.telescope"), require("custom.configs.telescope"))
    end,
  },

  {
    "AckslD/nvim-neoclip.lua",
    opts = function()
      return require("custom.configs.others").neoclip
    end
  },

  {
    'echasnovski/mini.nvim', version = false,
    event = "BufWinEnter",
    init = function(_)
      require('mini.align').setup()
      require('mini.bufremove').setup()
      require('mini.surround').setup()
    end,
  },
}

return M
