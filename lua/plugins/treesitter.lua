return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    branch = "main",
    build = ":TSUpdate",
    opts = {
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
    config = function(_, opts)
      local ts = require("nvim-treesitter")

      local ensure_installed = opts.ensure_installed
      local already_installed = ts.get_installed()

      local to_install = vim
        .iter(ensure_installed)
        :filter(function(parser)
          return not vim.tbl_contains(already_installed, parser)
        end)
        :totable()

      if #to_install > 0 then
        ts.install(to_install)
      end

      vim.api.nvim_create_autocmd("FileType", {
        callback = function()
          pcall(vim.treesitter.start)
        end,
      })
    end,
  },
}
