vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", { clear = false }),
  callback = function(ev)
    local map = function(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = ev.buf
      vim.keymap.set(mode, l, r, opts)
    end

    local on_list = function(opts)
      local aerial = require("aerial")
      if not aerial.is_open() then
        aerial.open({ focus = true })
      else
        aerial.focus()
      end
    end

    map("n", "gO", function()
      vim.lsp.buf.document_symbol({ on_list = on_list })
    end, { desc = "Symbols" })
  end,
})

return {
  {
    'stevearc/aerial.nvim',
    -- Optional dependencies
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons"
    },
    opts = {
      backends = {
        ["_"] = { "treesitter", "lsp", "markdown", "asciidoc", "man" },
        cpp = { "lsp", "treesitter" },
      },
      layout = {
        default_direction = "prefer_left",
      },
      attach_mode = "global",
      filter_kind = false,
      autojump = true,
      icons = require("config.icons")
    },
  },
}
