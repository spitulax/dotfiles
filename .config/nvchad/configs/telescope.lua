local opts = {
  mappings = {
    n = { ["<C-c>"] = require("telescope.actions").close },
  },
}

return opts
