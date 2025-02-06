local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    go = { "gofumpt", "goimports", "golines" },
    python = { "black" },
    c = { "clang-format" },
    cpp = { "clang-format" },
  },

  formatters = {
    golines = {
      prepend_args = { "--max-len=100" },
    },
    ["clang-format"] = {},
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
