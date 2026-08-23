return {
  {
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {
      terminal = {
        enabled = false,
      },
    },
  },
  require("plugins.snaks.scroll"),
}
