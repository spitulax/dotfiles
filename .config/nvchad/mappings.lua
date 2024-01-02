---@type MappingsTable
local M = {}

local function prompt_callback(prompt, completion, callback)
  vim.ui.input({prompt = prompt .. ": ", completion = completion}, function(input)
    if input ~= nil then callback(input)
    else return
    end
  end)
end

local function prompt_cmd(prompt, completion, cmd)
  prompt_callback(prompt, completion, function(input)
    vim.cmd(cmd .. input)
  end)
end

M.disabled = {
  n = {
    ["<leader>n"] = "",
    ["<leader>rn"] = "",
    ["<C-n>"] = "",
  },
}

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
    ["<leader>o"] = {
      function()
        prompt_cmd("Open file", "file", "e ")
      end,
      "Open file" },
    ["<leader>c"] = {
      function()
        prompt_callback("Change to", "file", function(input)
          vim.cmd("e " .. input .. " | bd #")
        end)
      end,
      "Change buffer" },
    ["<C-q>"] = { "<cmd>qa<cr>", "Close Neovim" },
    ["<C-c>"] = { "<C-w>q", "Close current window" },
    ["<M-c>"] = { "<C-w>o", "Close all other windows" },
    ["<M-=>"] = { "<C-w>+", "Increase window height" },
    ["<M-->"] = { "<C-w>-", "Decrease window height" },
    ["<M-]>"] = { "<C-w>>", "Increase window width" },
    ["<M-[>"] = { "<C-w><", "Decrease window width" },
    ["<M-e>"] = { "<C-w>=", "Uniform window size" },
    ["<M-t>"] = { "<cmd>tabnew<cr>", "Create new tab" },
    ["<M-q>"] = { "<cmd>tabclose<cr>", "Close current tab" },
    ["<M-a>"] = { "<cmd>tabonly<cr>", "Close all other tabs" },
    ["<leader>x"] = {
      function()
        vim.cmd("bp | bd #")
      end,
      "Close current buffer" },
    ["<M-.>"] = { "<cmd>bn<cr>", "Goto next buffer" },
    ["<M-,>"] = { "<cmd>bp<cr>", "Goto prev buffer" },
    ["<M-b>"] = {
      function()
        prompt_cmd("Jump to buffer", "buffer", "b ")
      end,
      "Jump to buffer by name",
    },
  },
  v = {
    ["<C-n>"] = { ":norm ", "Execute normal mode commands" },
  },
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
        prompt_cmd("Find files in", "file", "Telescope find_files cwd=")
      end,
      "Find files in specified directory",
    },
    ["<leader>fk"] = { "<cmd> Telescope keymaps <CR>", "Find assigned keybindings" },
    ["<leader>ft"] = { "<cmd> Telescope builtin <CR>", "Find Telescope builtin commands"},
    ["<leader>fc"] = { "<cmd> Telescope highlights <CR>", "List highlight groups"},
    -- git
    ["<leader>gc"] = { "<cmd> Telescope git_commits <CR>", "Git commits" },
    ["<leader>gb"] = { "<cmd> Telescope git_branches <CR>", "Git branches" },
    ["<leader>gs"] = { "<cmd> Telescope git_status <CR>", "Git status" },
  },
}

return M
