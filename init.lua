local icons = require("config.icons")

vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "", -- icons.diagnostics.Error,
      [vim.diagnostic.severity.WARN] = "",  -- icons.diagnostics.Warn,
      [vim.diagnostic.severity.INFO] = "",  -- icons.diagnostics.Info,
      [vim.diagnostic.severity.HINT] = "",  -- icons.diagnostics.Hint,
    },
    numhl = {
      [vim.diagnostic.severity.ERROR] = "ErrorMsg",
      [vim.diagnostic.severity.WARN] = "WarningMsg",
      [vim.diagnostic.severity.INFO] = "InfoMsg",
      [vim.diagnostic.severity.HINT] = "HintMsg",
    },
  },
  virtual_text = {
    source = "if_many",
    prefix = function(diagnostic, i, total)
      if i ~= total then return "" end

      if diagnostic.severity == vim.diagnostic.severity.ERROR then
        return icons.diagnostics.Error
      elseif diagnostic.severity == vim.diagnostic.severity.WARN then
        return icons.diagnostics.Warn
      elseif diagnostic.severity == vim.diagnostic.severity.INFO then
        return icons.diagnostics.Info
      elseif diagnostic.severity == vim.diagnostic.severity.HINT then
        return icons.diagnostics.Hint
      end

      return ""
    end,
  },
  float = {
    border = "rounded",
  },
  severity_sort = true,
})

require("config.options")
require("config.lazy")
require("config.mappings")
