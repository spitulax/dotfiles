---@type MappingsTable
local M = {}

local function prompt_callback(prompt, completion, callback)
  vim.ui.input({prompt = prompt .. ": ", completion = completion}, function(input)
    if input and string.gsub(input, " ", "") ~= "" then callback(input) end
  end)
end

local function prompt_cmd(prompt, completion, cmd)
  prompt_callback(prompt, completion, function(input)
    if input and string.gsub(input, " ", "") ~= "" then vim.cmd(cmd .. input) end
  end)
end

M.disabled = {
  i = {
    ["<C-e>"] = "",
  },

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
    ["<C-b>"] = { "<Esc>^i", "Go to start of the line" },
    ["<C-e>"] = { "<End>", "Go to end of the line" },
    ["<M-n>"] = { "<Esc>ea", "Go to end of the word" },
    ["<M-p>"] = { "<Esc>gea", "Go to end of the previous word" },
    ["<M-b>"] = { "<Esc>bi", "Go to beginning of the word" },
  },

  n = {
    -- shortcuts
    ["!"] = { ":!", "Enter shell command mode", opts = { nowait = true } },
    ["<C-p>"] = { "\"+p", "Paste from + register (p)" },
    ["<M-p>"] = { "\"+P", "Paste from + register (P)" },
    ["<C-y>"] = { "\"+y", "Yank to + register" },
    ["<C-q>"] = { "<cmd>qa<cr>", "Close Neovim" },
    ["<M-.>"] = { "<cmd>bn<cr>", "Goto next buffer" },
    ["<M-,>"] = { "<cmd>bp<cr>", "Goto prev buffer" },
    ["<leader>o"] = {
      function()
        prompt_cmd("Open file", "file", "e ")
      end,
      "Open file" },
    ["<leader>O"] = {
      function()
        prompt_callback("Change to", "file", function(input)
          vim.cmd("e " .. input)
          if #(vim.fn.win_findbuf(vim.fn.bufnr("#"))) < 1 then
            MiniBufremove.delete(vim.fn.bufnr("#"))
          end
        end)
      end,
      "Change buffer" },
    ["<leader>x"] = { "<cmd>lua MiniBufremove.delete(0)<cr>", "Close current buffer", opts = { silent = true } },
    ["<leader>X"] = { "<cmd>lua MiniBufremove.delete(vim.fn.bufnr('#'))<cr>", "Close previous buffer", opts = { silent = true } },
    ["<M-b>"] = {
      function()
        prompt_cmd("Jump to buffer", "buffer", "b ")
      end,
      "Jump to buffer by name",
    },
    ["<leader>S"] = {
      function()
        local buf = vim.api.nvim_create_buf(true, true)
        if buf ~= 0 then vim.api.nvim_set_current_buf(buf) end
      end,
      "Create a scrath buffer",
    },

    -- window and tab management
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
  },

  v = {
    -- shortcuts
    ["!"] = { ":!", "Enter shell command mode", opts = { nowait = true } },
    ["<C-n>"] = { ":norm ", "Execute normal mode commands", opts = { nowait = true } },
    ["<C-p>"] = { "\"+p", "Paste from + register (p)" },
    ["<C-y>"] = { "\"+y", "Yank to + register" },
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
    -- extensions
    ["<leader>fxm"] = { "<cmd> Telescope media_files <CR>", "Preview media" },
    ["<leader>fl"] = { "<cmd> Telescope neoclip <CR>", "Preview clipboard" },
  },
}

return M
