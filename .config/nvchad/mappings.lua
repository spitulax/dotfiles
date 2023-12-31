local M = {}

M.general = {
  i = {
    -- navigate within insert mode
    ["<C-h>"] = { "<Left>", "Move left" },
    ["<C-l>"] = { "<Right>", "Move right" },
    ["<C-j>"] = { "<Down>", "Move down" },
    ["<C-k>"] = { "<Up>", "Move up" },
    ["<C-a>"] = { "<Esc>^i", "Go to start of the line" },
    ["<C-e>"] = { "<End>", "Go to end of the line" },
  },
  n = {
    ["!"] = { ":!", "Enter shell command mode", opts = { nowait = true } },
    ["<C-q>"] = { "<cmd>qa<cr>", "Close Neovim" },
    ["<C-c>"] = { "<cmd>q<cr>", "Close current window" },
    ["<leader>n"] = nil,
    ["<leader>rn"] = nil,
    ["<M-.>"] = { "<cmd>bn<cr>", "Goto next buffer" },
    ["<M-,>"] = { "<cmd>bp<cr>", "Goto prev buffer" },
    ["<M-b>"] = {
      function()
        vim.ui.input({prompt = "Jump to: ", completion = "buffer"}, function(input)
          if input ~= nil then vim.cmd("b " .. input)
          else return end
        end)
      end,
      "Jump to buffer by name",
    },
  }
}

M.nvimtree = {
  n = {
    ["<leader>n"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },
    ["<leader>e"] = { "<cmd> NvimTreeFocus <CR>", "Focus nvimtree" },
  },
}

M.lspconfig = {
  n = {
    ["<leader>lf"] = {
      function()
        vim.diagnostic.open_float { border = "rounded" }
      end,
      "Floating diagnostic",
    },

    ["[d"] = {
      function()
        vim.diagnostic.goto_prev { float = { border = "rounded" } }
      end,
      "Goto prev diagnostic",
    },

    ["]d"] = {
      function()
        vim.diagnostic.goto_next { float = { border = "rounded" } }
      end,
      "Goto next diagnostic",
    },
  },
}

M.telescope = {
  n = {
    -- find
    ["<leader>fe"] = {
      function()
        vim.ui.input({prompt = "Find in: ", completion = "file"}, function(input)
          if input ~= nil then vim.cmd("Telescope find_files cwd=" .. input)
          else return end
        end)
      end,
      "Find files in specified directory",
    },
    ["<leader>fk"] = { "<cmd> Telescope keymaps <CR>", "Find assigned keybindings" },
    ["<leader>ft"] = { "<cmd> Telescope builtin <CR>", "Find Telescope builtin commands"},
    -- git
    ["<leader>gc"] = { "<cmd> Telescope git_commits <CR>", "Git commits" },
    ["<leader>gb"] = { "<cmd> Telescope git_branches <CR>", "Git branches" },
    ["<leader>gs"] = { "<cmd> Telescope git_status <CR>", "Git status" },
  },
}

return M
