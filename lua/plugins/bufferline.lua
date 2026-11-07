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
      { "<S-tab>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
      { "<tab>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
      { "[B", "<cmd>BufferLineMovePrev<cr>", desc = "Move buffer prev" },
      { "]B", "<cmd>BufferLineMoveNext<cr>", desc = "Move buffer next" },
    },
    opts = {
      options = {
        mode = "buffers",
        numbers = "none",
        close_command = false,
        right_mouse_command = false,
        left_mouse_command = false,
        middle_mouse_command = false,
        indicator = {
          icon = "", -- this should be omitted if indicator style is not 'icon'
          style = "none",
        },
        buffer_close_icon = "",
        modified_icon = "● ",
        close_icon = "",
        diagnostic = false,
        diagnostics_update_on_event = false, -- use nvim's diagnostic handler
        offsets = {
          {
            filetype = "neo-tree",
            text = "File Explorer",
            highlight = "Directory",
            text_align = "left",
            separator = false,
          },
        },
        color_icons = true,
        show_buffer_icons = true,
        show_buffer_close_icons = false,
        show_close_icon = false,
        show_tab_indicators = true,
        show_duplicate_prefix = true,
        separator_style = "slant",
        always_show_bufferline = true,
        persist_buffer_sort = false,
        hover = {
          enabled = false,
        },
        sort_by = "insert_after_current",
      },
    },
  },
}
