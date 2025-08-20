return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    opts = {
      options = {
        -- section_separators = {},
        -- component_separators = {},
        disabled_filetypes = {
          "neo-tree",
        },
        ignore_focuse = {},
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { { "", draw_empty = true } },
        lualine_c = {
          { "branch", icon = "" },
          { "diff", symbols = { added = " ", modified = " ", removed = " " } },
          { "filename", path = 1, separator = "" },
          { "filetype", separator = "", icon_only = true, icon = { align = "left" } },
        },
        lualine_x = { "diagnostics", "lsp_status" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
    },
  },
}
