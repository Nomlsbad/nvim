return {
  {
    "saghen/blink.cmp",

    version = "1.*",

    -- optional: provides snippets for the snippet source
    dependencies = {
      { "L3MON4D3/LuaSnip", version = "v2.*" },
      { "echasnovski/mini.icons" },
    },

    ---@module "blink.cmp"
    ---@type blink.cmp.Config
    opts = {
      enabled = function() --
        return not vim.tbl_contains({ "neo-tree" }, vim.bo.filetype)
      end,

      keymap = {
        preset = "none",

        ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
        ["<C-e>"] = { "hide", "fallback" },

        ["<cr>"] = { "accept", "fallback" },
        ["<del>"] = { "cancel", "fallback" },

        ["<tab>"] = { "select_next", "snippet_forward", "fallback" },
        ["<s-tab>"] = { "select_prev", "snippet_backward", "fallback" },
        ["<down>"] = { "select_next", "fallback" },
        ["<up>"] = { "select_prev", "fallback" },

        ["<c-d>"] = { "scroll_documentation_down", "fallback" },
        ["<c-u>"] = { "scroll_documentation_up", "fallback" },

        ["<c-k>"] = { "show_signature", "hide_signature", "fallback" },
      },

      appearance = {
        nerd_font_variant = "mono",
      },

      completion = {
        keyword = { range = "full" },
        trigger = {
          show_on_insert = true,
        },
        menu = {
          border = "rounded",
          draw = {
            components = {
              kind_icon = {
                text = function(ctx)
                  local kind_icon, _, _ = require("mini.icons").get("lsp", ctx.kind)
                  return kind_icon
                end,
              },
            },
          },
        },
        documentation = {
          auto_show = true,
          window = {
            border = "rounded",
          },
        },
      },

      signature = {
        enabled = true,
        window = {
          border = "rounded",
        },
      },

      fuzzy = { implementation = "prefer_rust_with_warning" },

      snippets = { preset = "luasnip" },

      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },

      cmdline = {
        enabled = true,

        completion = {
          list = {
            selection = {
              preselect = false,
            },
          },
        },

        sources = function()
          local type = vim.fn.getcmdtype()
          -- Search forward and backward
          if type == "/" or type == "?" then return { "buffer" } end
          -- Commands
          if type == ":" or type == "@" then return { "cmdline", "buffer" } end
          return {}
        end,
      },

      term = {
        enabled = true,
      },
    },
    opts_extend = { "sources.default" },
  },
}
