return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader>cf",
      function()
        require("conform").format({ async = true })
      end,
      mode = { "n", "v" },
      desc = "Format buffer",
    },
  },
  init = function()
    vim.g.autoformat = true
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
  ---@module "conform"
  ---@type conform.setupOpts
  opts = {
    -- Define your formatters
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "isort", "black" },
      cpp = { "clang-format" },
      c = { "clang-format" },
      go = { "golangci-lint" },
      sh = { "shfmt" },
    },
    -- Set default options
    default_format_opts = {
      lsp_format = "fallback",
    },
    -- Set the log level. Use `:ConformInfo` to see the location of the log file.
    log_level = vim.log.levels.ERROR,
    -- Conform will notify you when a formatter errors
    notify_on_error = true,
    -- Conform will notify you when no formatters are available for the buffer
    notify_no_formatters = true,
    -- Set up format-on-save
    format_after_save = function(_)
      if not vim.g.autoformat then
        return
      end
      return { async = true }
    end,
    -- Customize formatters
    formatters = {},
  },
}
