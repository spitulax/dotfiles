local lazy_load = require("core.utils").lazy_load

local M = {
  "nvim-lua/popup.nvim",

  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
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
    init = function()
      lazy_load("vim-visual-multi")
    end,
    config = function()
      require("custom.configs.vim-visual-multi")
    end,
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
    end,
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
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    lazy = false,
    config = function(_, _)
      require("harpoon").setup({})
    end,
  },

  {
    'nvim-telescope/telescope.nvim', branch = '0.1.x',
    dependencies = {
      'nvim-telescope/telescope-media-files.nvim',
      {
        "AckslD/nvim-neoclip.lua",
        opts = function()
          return require("custom.configs.others").neoclip
        end
      },
    },
    opts = function()
      return vim.tbl_deep_extend("force", require("plugins.configs.telescope"), require("custom.configs.telescope"))
    end,
  },

  {
    'echasnovski/mini.nvim', version = false,
    init = function(_)
      lazy_load("mini.nvim")
    end,
    config = function(_, _)
      require('mini.align').setup()
      require('mini.bufremove').setup()
      require('mini.surround').setup()
    end
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    opts = function()
      return vim.tbl_deep_extend("force", require("plugins.configs.others").blankline, require("custom.configs.others").blankline)
    end
  },

  {
    "folke/which-key.nvim",
    opts = function()
      return require("custom.configs.which-key")
    end,
  },

  {
    'sindrets/diffview.nvim',
    config = true,
    cmd = { "DiffviewOpen", "DiffviewFileHistory" },
  },

  {
    "NeogitOrg/neogit",
    opts = function()
      return require("custom.configs.neogit")
    end,
    cmd = "Neogit",
  },
}

return M
