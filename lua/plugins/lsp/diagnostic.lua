local icons = require("config.icons")

local severities = {
  icons.diagnostics.Error,
  icons.diagnostics.Warn,
  icons.diagnostics.Info,
  icons.diagnostics.Hint,
}

vim.diagnostic.config({
  -- signs = {
  --   severity = { vim.diagnostic.severity.ERROR, vim.diagnostic.severity.WARN },
  --   text = {
  --     [vim.diagnostic.severity.ERROR] = "", -- icons.diagnostics.Error,
  --     [vim.diagnostic.severity.WARN] = "", -- icons.diagnostics.Warn,
  --     [vim.diagnostic.severity.INFO] = "", -- icons.diagnostics.Info,
  --     [vim.diagnostic.severity.HINT] = "", -- icons.diagnostics.Hint,
  --   },
  --   numhl = {
  --     [vim.diagnostic.severity.ERROR] = "ErrorMsg",
  --     [vim.diagnostic.severity.WARN] = "WarningMsg",
  --     [vim.diagnostic.severity.INFO] = "InfoMsg",
  --     [vim.diagnostic.severity.HINT] = "HintMsg",
  --   },
  -- },
  -- virtual_text = {
  --   source = false,
  --   prefix = function(diagnostic, i, total)
  --     if i ~= total then
  --       return ""
  --     end
  --     return severities[diagnostic.severity]
  --   end,
  -- },
  signs = false,
  float = {
    border = "rounded",
  },
  severity_sort = true,
})
