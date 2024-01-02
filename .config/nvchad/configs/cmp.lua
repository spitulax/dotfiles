local cmp = require("cmp")

local opts = {
  preselect = cmp.PreselectMode.None,
  completion = {
    keyword_length = 3,
  },
  view = {
    docs = {
      auto_open = false,
    },
  },
  mapping = {
    ["<M-x>"] = cmp.mapping.close(),
    ["<M-z>"] = cmp.mapping.abort(),
    ["<M-d>"] = function()
      if cmp.visible_docs() then cmp.close_docs()
      else cmp.open_docs() end
    end,
    ["<CR>"] = vim.NIL,
    ["<Tab>"] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    }),
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "nvim_lua" },
    { name = "path" },
  },
}

return opts
