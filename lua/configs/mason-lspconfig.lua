require("mason-lspconfig").setup {
  ensure_installed = {
    "dockerls",
    "lus_ls",
    "gopls",
    "pyright",
  },
}
