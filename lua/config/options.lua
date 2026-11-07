vim.g.autoformat = false

local opt = vim.opt

opt.autoread = true
opt.breakindent = true
opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus"
opt.confirm = true
opt.copyindent = true
opt.cursorline = true
opt.cursorlineopt = "line,number"
opt.errorbells = true
opt.expandtab = false
opt.exrc = true
opt.fillchars = {
  foldopen = "",
  foldclose = "",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}
opt.laststatus = 3
opt.listchars = "tab:> ,space:∙,nbsp:+"
opt.matchpairs = "(:),{:},[:],<:>"
opt.mouse = "a"
opt.number = true
opt.relativenumber = true
opt.ruler = false
opt.scrolloff = 2
opt.sessionoptions = {
  "blank",
  "buffers",
  "curdir",
  "folds",
  "globals",
  "help",
  "tabpages",
  "winpos",
  "winsize",
  "skiprtp",
}
opt.shiftround = true
--opt.shiftwidth = 4
opt.showmode = false
opt.signcolumn = "number"
opt.smartindent = true
--opt.smarttab = true
opt.smoothscroll = true
opt.softtabstop = -1
opt.spell = true
opt.spelloptions = "camel"
opt.splitright = true
--opt.tabstop = 4
opt.termguicolors = true
opt.timeoutlen = 400
opt.undofile = true
