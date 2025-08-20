return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    keys = {
      {
        "<leader>?",
        function() require("which-key").show({ global = false }) end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
    opts = {
      present = "helix",
      win = {
        no_overlap = false,
        width = { min = 25, max = 100 },
        col = -2,
        row = -2,
        border = "rounded",
      },
      layout = {
        width = 50,
      },
    },
  },
}
