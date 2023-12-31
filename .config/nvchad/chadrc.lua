---@type ChadrcConfig
local M = {}

M.plugins = "custom.plugins"

M.ui = {
  theme = "catppuccin",
  transparency = true,
  lsp_semantic_tokens = false,

  hl_override = require("custom.highlight.statusline"),

  cmp = {
    selected_item_bg = "simple",
  },

  statusline = {
    theme = "vscode",
    separator_style = "block",
  },

  tabufline = {
    enabled = false,
    show_numbers = false,
    overriden_modules = function(modules)
      table.remove(modules, 4) -- remove tabufline buttons
    end,
  },

  nvdash = {
    load_on_startup = true,

    header = {
      "        Neovim v" .. (vim.version().major) .. "." .. (vim.version().minor) .. "." .. (vim.version().patch) .. "        ",
    },

    buttons = {
      { "  Find File", "Spc f f", "Telescope find_files" },
      { "󰈚  Recent Files", "Spc f o", "Telescope oldfiles" },
      { "󰈭  Find Word", "Spc f w", "Telescope live_grep" },
      { "  Bookmarks", "Spc m a", "Telescope marks" },
    },
  },
}

M.mappings = require("custom.mappings")

return M
