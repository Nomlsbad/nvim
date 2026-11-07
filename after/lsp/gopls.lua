vim.api.nvim_create_autocmd({ "LspAttach" }, {
  group = vim.api.nvim_create_augroup("Color", {}),
  pattern = "*.go",
  once = true,
  callback = function()
    vim.api.nvim_set_hl(0, "@lsp.type.variable.go", { fg = "#c0caf5" })
    vim.api.nvim_set_hl(0, "@lsp.type.property.go", { fg = "#c0caf5" })
    vim.api.nvim_set_hl(0, "@lsp.type.parameter.go", { fg = "#e0af68" })
    vim.api.nvim_set_hl(0, "@lsp.type.function.go", { fg = "#c0caf5" })
    vim.api.nvim_set_hl(0, "@lsp.type.method.go", { fg = "#c0caf5" })
    vim.api.nvim_set_hl(0, "@lsp.type.namespace.go", { fg = "#9d7cd8" })
    vim.api.nvim_set_hl(0, "@lsp.type.string.go", { fg = "#7dcfff" })
    vim.api.nvim_set_hl(0, "@string.go", { fg = "#7dcfff" })

    vim.api.nvim_set_hl(0, "@lsp.typemod.variable.static.go", { fg = "#f7768e" })
    vim.api.nvim_set_hl(0, "@lsp.typemod.function.definition.go", { fg = "#73daca" })
    vim.api.nvim_set_hl(0, "@lsp.typemod.method.definition.go", { fg = "#73daca" })
    vim.api.nvim_set_hl(0, "@lsp.typemod.string.format.go", { fg = "#b4f9f8" })

    vim.api.nvim_set_hl(0, "@lsp.typemod.method.defaultLibrary.go", { link = "@lsp" })
    vim.api.nvim_set_hl(0, "@lsp.typemod.variable.readonly.go", { link = "@lsp" })
    vim.api.nvim_set_hl(0, "@lsp.typemod.variable.defaultLibrary.go", { link = "@lsp" })
    vim.api.nvim_set_hl(0, "@lsp.typemod.type.defaultLibrary.go", { link = "@lsp" })
    vim.api.nvim_set_hl(0, "@lsp.typemod.function.defaultLibrary.go", { link = "@lsp" })
  end,
})

return {
  settings = {
    gopls = {
      semanticTokens = true,
    },
  },
}
