local opts = {
  graph_style = "unicode",
  commit_select_view = {
    kind = "auto",
  },
  log_view = {
    kind = "auto",
  },
  reflog_view = {
    kind = "auto",
  },
  signs = {
    hunk = { "", "" },
    item = { "󰁔", "󱞣" },
    section = { "󰜴", "󱞤" },
  },
  integrations = {
    telescope = true,
    diffview = true,
  },
  mappings = {
    commit_editor = {
      ["<leader><cr>"] = "Submit",
      ["<leader><bs>"] = "Abort",
    },
    rebase_editor = {
      ["<leader><cr>"] = "Submit",
      ["<leader><bs>"] = "Abort",
    },
  },
}

return opts
