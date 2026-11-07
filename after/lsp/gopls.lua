vim.api.nvim_create_autocmd({ "ColorScheme", "VimEnter" }, {
  group = vim.api.nvim_create_augroup("Color", {}),
  pattern = "*",
  callback = function()
    vim.api.nvim_set_hl(0, "Constant", {})
    vim.api.nvim_set_hl(0, "String", { fg = "#7dcfff" })
    vim.api.nvim_set_hl(0, "Character", { fg = "#7dcfff" })
    vim.api.nvim_set_hl(0, "Number", {})
    vim.api.nvim_set_hl(0, "Boolean", {})
    vim.api.nvim_set_hl(0, "Float", {})

    vim.api.nvim_set_hl(0, "Identifier", { fg = "#c0caf5" })
    vim.api.nvim_set_hl(0, "Function", { fg = "#73daca" })

    vim.api.nvim_set_hl(0, "Statememnt", { fg = "#9d7cd8" })
    vim.api.nvim_set_hl(0, "Conditional", { fg = "#9d7cd8" })
    vim.api.nvim_set_hl(0, "Repeat", { fg = "#9d7cd8" })
    vim.api.nvim_set_hl(0, "Label", { fg = "#9d7cd8" })
    vim.api.nvim_set_hl(0, "Operator", { fg = "#89ddff" })
    vim.api.nvim_set_hl(0, "Keyword", { fg = "#9d7cd8" })
    vim.api.nvim_set_hl(0, "Exception", { fg = "#9d7cd8" })

    vim.api.nvim_set_hl(0, "PreProc", { fg = "#9d7cd8" })
    vim.api.nvim_set_hl(0, "Include", { fg = "#9d7cd8" })
    vim.api.nvim_set_hl(0, "Define", { fg = "#565f89" })
    vim.api.nvim_set_hl(0, "Macro", { fg = "#565f89" })
    vim.api.nvim_set_hl(0, "PreCondit", { fg = "#565f89" })

    vim.api.nvim_set_hl(0, "Type", { fg = "#27a1b9" })
    vim.api.nvim_set_hl(0, "StorageClass", { fg = "#9d7cd8" })
    vim.api.nvim_set_hl(0, "Structure", { fg = "#27a1b9" })
    vim.api.nvim_set_hl(0, "Typedef", { fg = "#27a1b9" })

    vim.api.nvim_set_hl(0, "@lsp.type.variable.go", { link = "Identifier" })
    vim.api.nvim_set_hl(0, "@lsp.type.property.go", { link = "Identifier" })
    vim.api.nvim_set_hl(0, "@lsp.type.parameter.go", { link = "@variable.parameter" })
    vim.api.nvim_set_hl(0, "@lsp.type.function.go", { link = "Identifier" })
    vim.api.nvim_set_hl(0, "@lsp.type.method.go", { link = "Identifier" })
    vim.api.nvim_set_hl(0, "@lsp.type.namespace.go", { link = "@module" })

    vim.api.nvim_set_hl(0, "@lsp.typemod.variable.static.go", { fg = "#f7768e" })
    vim.api.nvim_set_hl(0, "@lsp.typemod.variable.readonly.go", { link = "Constant" })
    vim.api.nvim_set_hl(0, "@lsp.typemod.function.definition.go", { link = "Function" })
    vim.api.nvim_set_hl(0, "@lsp.typemod.method.definition.go", { link = "Function" })
    vim.api.nvim_set_hl(0, "@lsp.typemod.string.format.go", { link = "@lsp.type.regexp" })

    vim.api.nvim_set_hl(0, "@lsp.typemod.method.defaultLibrary.go", { link = "@lsp" })
    vim.api.nvim_set_hl(0, "@lsp.typemod.variable.defaultLibrary.go", { link = "@lsp" })
    vim.api.nvim_set_hl(0, "@lsp.typemod.type.defaultLibrary.go", { link = "@lsp" })
    vim.api.nvim_set_hl(0, "@lsp.typemod.function.defaultLibrary.go", { link = "@lsp" })
  end,
})

return {
  settings = {},
}
