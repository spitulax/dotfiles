local opt = vim.opt
local g = vim.g

opt.listchars = {
  space = "·",
  tab = "←-→",
  trail = "∼",
  nbsp = "-",
}
opt.list = true

opt.shiftwidth = 2
opt.tabstop = 2
opt.softtabstop = 2
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.clipboard = "unnamed"
opt.complete = ""
opt.timeoutlen = 500
