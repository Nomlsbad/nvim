return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    cond = false,
    opts = {
      completions = {
        lsp = { enabled = true },
        blink = { enabled = true },
      },
    },
  },
}
