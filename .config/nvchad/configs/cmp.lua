local cmp = require("cmp")

local opts = {
  keyword_length = 3,
  view = {
    docs = {
      auto_open = false,
    },
  },
  mapping = {
    ["<M-x>"] = cmp.mapping.close(),
    ["<M-z>"] = cmp.mapping.abort(),
    ["<M-d>"] = cmp.mapping.open_docs(),
    ["<M-c>"] = cmp.mapping.close_docs(),
  },
  sources = {
    -- { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
    -- { name = "nvim_lua" },
    { name = "path" },
  },
}

return opts
