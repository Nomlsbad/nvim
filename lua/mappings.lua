require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("i", "jk", "<ESC>")
map("n", "<leader>lf", "<cmd>silent !golangci-lint run --fix <cr>")
map("n", "<leader>ll", "<cmd> !golangci-lint run <cr>")

-- map("n", "<leader>a", function()
--   require("aerial.actions").close_all()
-- end)

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
