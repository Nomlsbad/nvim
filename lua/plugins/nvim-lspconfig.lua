vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    vim.lsp.buf.hover = require("pretty_hover").hover

    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to Declaration" })
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
    -- vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover" })
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Go to Implementation" })
    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, { desc = "Signature Help" })
    vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, { desc = "Add Workspace Folder" })
    vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, { desc = "Remove Workspace Folder" })
    vim.keymap.set(
      "n",
      "<space>wl",
      function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end,
      { desc = "List Workspace Folder" }
    )
    vim.keymap.set("n", "gY", vim.lsp.buf.type_definition, { desc = "Go to Type Definition" })
    vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, { desc = "Rename" })
    vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
    vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "References" })
  end,
})

return {
  {
    "neovim/nvim-lspconfig",
    dependencies = { "mason.nvim" },
  },
}
