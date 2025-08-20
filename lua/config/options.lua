local opt = vim.opt

opt.autowrite = true
opt.cindent = true
opt.cinwords = "if,else,while,do,for,try,catch"
opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus"
opt.colorcolumn = "100"
opt.confirm = true
opt.cursorline = true
opt.cursorlineopt = "line,number"
opt.expandtab = true
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
opt.matchpairs = "(:),{:},[:],<:>"
opt.mouse = "a"
opt.number = true
opt.relativenumber = true
opt.ruler = false
opt.sessionoptions = {
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
opt.shiftwidth = 4
opt.showmode = false
opt.signcolumn = "yes"
opt.smarttab = true
opt.smoothscroll = true
opt.softtabstop = -1
opt.splitright = true
opt.termguicolors = true
opt.timeoutlen = 400
opt.undofile = true
