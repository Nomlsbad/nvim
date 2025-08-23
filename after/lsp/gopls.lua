return {
  settings = {
    gopls = {
      -- Formatting
      gofumpt = true,

      -- Completion
      usePlaceholders = true,

      -- Diagnostic
      analyses = {
        shadow = true,
        unusedvariable = true,
        useany = true,
      },
      staticcheck = true,
    },
  },
}
