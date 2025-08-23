return {
  {
    "akinsho/bufferline.nvim",
    cond = true,
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    keys = {
      { "<leader>b1", "<cmd>BufferLineGoToBuffer 1<cr>", desc = "Go to 1st buffer" },
      { "<leader>b2", "<cmd>BufferLineGoToBuffer 2<cr>", desc = "Go to 2nd buffer" },
      { "<leader>b3", "<cmd>BufferLineGoToBuffer 3<cr>", desc = "Go to 3rd buffer" },
      { "<leader>b4", "<cmd>BufferLineGoToBuffer 4<cr>", desc = "Go to 4th buffer" },
      { "<leader>b5", "<cmd>BufferLineGoToBuffer 5<cr>", desc = "Go to 5th buffer" },
      { "<leader>bd", "<cmd>.bdelete<cr>",               desc = "Delete Buffers" },
      { "<leader>bo", "<cmd>BufferLineCloseOther<cr>",   desc = "Delete other Buffers" },
      { "<S-tab>",    "<cmd>BufferLineCyclePrev<cr>",    desc = "Prev Buffer" },
      { "<tab>",      "<cmd>BufferLineCycleNext<cr>",    desc = "Next Buffer" },
      { "[B",         "<cmd>BufferLineMovePrev<cr>",     desc = "Move buffer prev" },
      { "]B",         "<cmd>BufferLineMoveNext<cr>",     desc = "Move buffer next" },
    },
    opts = {
      options = {
        indicator = {
          icon = "▉", -- this should be omitted if indicator style is not 'icon'
          style = "icon",
        },
        diagnostic = "nvim_lsp",
        diagnostics_update_on_event = true, -- use nvim's diagnostic handler
        offsets = {
          {
            filetype = "neo-tree",
            text = "File Explorer",
            highlight = "Directory",
            text_align = "left",
          },
        },
        color_icons = true,
        show_buffer_icons = true,
        show_buffer_close_icons = true,
        show_close_icon = true,
        show_tab_indicators = true,
        show_duplicate_prefix = true,
        separator_style = "thin",
        always_show_bufferline = true,
        auto_toggle_bufferline = true,
      },
    },
  },
}
