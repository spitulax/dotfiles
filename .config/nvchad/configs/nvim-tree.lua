local opts = {
  modified = {
    enable = true,
    show_on_dirs = false,
  },
  view = {
    signcolumn = "auto",
  },
  git = {
    enable = true,
    ignore = false,
  },
  renderer = {
    group_empty = true,
    highlight_git = true,
    highlight_modified = "name",
    root_folder_label = ":~:s?$?/..?",
    indent_markers = {
      enable = true,
    },
    icons = {
      show = {
        git = true,
      },
    },
  },
}

return opts
