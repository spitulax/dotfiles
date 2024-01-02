local M = {}

---@type Base46HLGroupsList
M.override = {
  -- Nvim
  CursorLine = { bg = "NONE" },
  CursorLineNr = { bold = true, fg = "white" },
  LineNr = { fg = "grey_fg" },

  -- Nvim-tree
  NvimTreeRootFolder = { fg = "green" },

  -- Statusline
  St_Mode = { bg = "NONE" },

  -- Syntax highlighting
  Special = { fg = "nord_blue" },
  Comment = { italic = true },
  Boolean = { bold = true },
  Keyword = { bold = true },
  Type = { bold = true },
}

M.add = {
  -- Nvim
  TabLine = { underline = false, bg = "NONE", fg = "light_grey" },
  TabLineSel = { bold = true, bg = "NONE", fg = "white" },
  TabLineFill = { bg = "NONE" },

  -- Statusline
  NvimTreeModifiedFile = { fg = "orange" },
}

return M
