require("mason-lspconfig").setup {
  ensure_installed = {
    "clangd",
    "docker_compose_language_service",
    "lus_ls",
    "neocmake",
    "gopls",
  },
}
