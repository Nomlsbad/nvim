return {
  {
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",
    opts = {
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "▎" },
        untracked = { text = "▎" },
      },
      signs_staged = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "▎" },
      },
      current_line_blame_opts = {
        delay = 100,
      },
      on_attach = function(buffer)
        local gitsigns = require("gitsigns")

        local function map(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
        end

        -- stylua: ignore start
        map("n", "]h", function()
          if vim.wo.diff then
            vim.cmd.normal({ "]c", bang = true })
          else
            gitsigns.nav_hunk("next")
          end
        end, "Next Hunk")
        map("n", "[h", function()
          if vim.wo.diff then
            vim.cmd.normal({ "[c", bang = true })
          else
            gitsigns.nav_hunk("prev")
          end
        end, "Prev Hunk")
        map("n", "]H", function() gitsigns.nav_hunk("last") end, "Last Hunk")
        map("n", "[H", function() gitsigns.nav_hunk("first") end, "First Hunk")
        map({ "n", "v" }, "<leader>hs", ":Gitsigns stage_hunk<CR>", "Stage Hunk")
        map({ "n", "v" }, "<leader>hr", ":Gitsigns reset_hunk<CR>", "Reset Hunk")
        map("n", "<leader>hS", gitsigns.stage_buffer, "Stage Buffer")
        map("n", "<leader>hu", gitsigns.undo_stage_hunk, "Undo Stage Hunk")
        map("n", "<leader>hR", gitsigns.reset_buffer, "Reset Buffer")
        map("n", "<leader>hp", gitsigns.preview_hunk_inline, "Preview Hunk Inline")
        map("n", "<leader>hb", function() gitsigns.blame_line({ full = true }) end, "Blame Line")
        map("n", "<leader>hB", function() gitsigns.blame() end, "Blame Buffer")
        map("n", "<leader>hd", gitsigns.diffthis, "Diff This")
        map("n", "<leader>hD", function() gitsigns.diffthis("~") end, "Diff This ~")
        map("n", '<leader>tb', gitsigns.toggle_current_line_blame, "Toggle Line Blame")
        map("n", '<leader>tw', gitsigns.toggle_word_diff, "Toggle Word Diff")
        map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk")
      end,
    },
  }
}
