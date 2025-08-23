vim.lsp.config("*", {
  capabilities = {
    workspace = {
      fileOperations = {
        didRename = true,
        willRename = true,
      },
    },
  },
})

require("plugins.lsp.mappings")
require("plugins.lsp.diagnostic")

return require("plugins.lsp.nvim-lspconfig")
