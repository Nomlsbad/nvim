return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = false,
    -- branch = "main",
    build = ":TSUpdate",
    init = function(plugin)
      -- PERF: add nvim-treesitter queries to the rtp and it's custom query predicates early
      -- This is needed because a bunch of plugins no longer `require("nvim-treesitter")`, which
      -- no longer trigger the **nvim-treesitter** module to be loaded in time.
      -- Luckily, the only things that those plugins need are the custom queries, which we make available
      -- during startup.
      require("lazy.core.loader").add_to_rtp(plugin)
      require("nvim-treesitter.query_predicates")
    end,
    opts = {
      highlight = { enable = true },
      indent = { enable = true },
      ensure_installed = {
        "asm",
        "bash",
        "c",
        "cmake",
        "cpp",
        "diff",
        "dockerfile",
        "doxygen",
        "go",
        "gomod",
        "gosum",
        "gotmpl",
        "gowork",
        "json",
        "lua",
        "luadoc",
        "luap",
        "make",
        "markdown",
        "markdown_inline",
        "printf",
        "nasm",
        "python",
        "vim",
        "vimdoc",
        "yaml",
      },
    },
    config = function(_, opts) require("nvim-treesitter.configs").setup(opts) end,
  },
}
