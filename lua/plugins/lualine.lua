return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    opts = {
      options = {
        section_separators = { left = "", right = "" },
        component_separators = "",
        disabled_filetypes = {
          "neo-tree",
        },
        ignore_focuse = {},
      },
      sections = {
        lualine_a = {
          {
            "mode",
            separator = { left = "", right = "" },
          },
        },
        lualine_b = {},
        lualine_c = {
          { "branch", icon = "" },
          { "diff", symbols = { added = " ", modified = " ", removed = " " } },
        },
        lualine_x = {
          "diagnostics",
          {
            "lsp_status",
            icon = "",
            symbols = { done = "" },
          },
        },
        lualine_y = {},
        lualine_z = {
          {
            "location",
            separator = { left = "", right = "" },
          },
        },
      },
    },
  },
}
