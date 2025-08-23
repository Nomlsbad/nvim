vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
    if not client:supports_method('workspace/fileOperations/willRename') then
      vim.notify('method is not supported by any servers active on the current buffer')
    end
    if not client:supports_method('workspace/fileOperations/didRename') then
      vim.notify('method is not supported by any servers active on the current buffer')
    end


    vim.lsp.buf.hover = require("pretty_hover").hover

    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

    local map = function(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = ev.buf
      vim.keymap.set(mode, l, r, opts)
    end

    map("n", "gD", vim.lsp.buf.declaration, { desc = "Go to Declaration" })
    map("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
    map("n", "K", vim.lsp.buf.hover, { desc = "Hover" })
    map("n", "gi", vim.lsp.buf.implementation, { desc = "Go to Implementation" })
    map("n", "<C-k>", vim.lsp.buf.signature_help, { desc = "Signature Help" })
    map("n", "<space>wa", vim.lsp.buf.add_workspace_folder, { desc = "Add Workspace Folder" })
    map(
      "n",
      "<space>wr",
      vim.lsp.buf.remove_workspace_folder,
      { desc = "Remove Workspace Folder" }
    )
    map(
      "n",
      "<space>wl",
      function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end,
      { desc = "List Workspace Folder" }
    )
    map("n", "gY", vim.lsp.buf.type_definition, { desc = "Go to Type Definition" })
    map("n", "<space>rn", vim.lsp.buf.rename, { desc = "Rename" })
    map({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
    map("n", "gr", vim.lsp.buf.references, { desc = "References" })
  end,
})
