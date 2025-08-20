local icons = require("config.icons")

return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    keys = {
      {
        "<leader>e",
        "<cmd>Neotree toggle float focus reveal<cr>",
        desc = "Toggle float filesystem tree"
      },
    },
    lazy = false,
    ---@module "neo-tree"
    ---@type neotree.Config?
    opts = {
      close_if_last_window = false,
      popup_border_style = "rounded",
      default_component_configs = {
        name = {
          highlight_opened_files = "all",
        },
        git_status = {
          symbols = {
            added = "",
            deleted = "",
            modified = "",
            renamed = "",
          },
        },
        diagnostics = {
          symbols = {
            error = icons.diagnostics.Error,
            warn = icons.diagnostics.Warn,
            info = icons.diagnostics.Info,
            hint = icons.diagnostics.Hint,
          },
          highlights = {
            error = "DiagnosticSignError",
            warn = "DiagnosticSignWarn",
            info = "DiagnosticSignInfo",
            hint = "DiagnosticSignHint",
          },
        },
      },
      window = {
        mappings = {
          ["<space>"] = "none",
        },
      },
      filesystem = {
        filtered_items = {
          visible = true,
        },
      },
    },
  },
}
