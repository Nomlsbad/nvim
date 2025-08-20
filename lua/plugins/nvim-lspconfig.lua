vim.lsp.config("*", {
  capabilities = {
    workspace = {
      fileOperations = {
        didRename = true,
        willRename = true,
      },
    },
  },
})

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
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
    map("n", "<space>wr", vim.lsp.buf.remove_workspace_folder,
      { desc = "Remove Workspace Folder" })
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

local icons = require("config.icons")

vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "", -- icons.diagnostics.Error,
      [vim.diagnostic.severity.WARN] = "",  -- icons.diagnostics.Warn,
      [vim.diagnostic.severity.INFO] = "",  -- icons.diagnostics.Info,
      [vim.diagnostic.severity.HINT] = "",  -- icons.diagnostics.Hint,
    },
    numhl = {
      [vim.diagnostic.severity.ERROR] = "ErrorMsg",
      [vim.diagnostic.severity.WARN] = "WarningMsg",
      [vim.diagnostic.severity.INFO] = "InfoMsg",
      [vim.diagnostic.severity.HINT] = "HintMsg",
    },
  },
  virtual_text = {
    source = "if_many",
    prefix = function(diagnostic, i, total)
      if i ~= total then return "" end

      if diagnostic.severity == vim.diagnostic.severity.ERROR then
        return icons.diagnostics.Error
      elseif diagnostic.severity == vim.diagnostic.severity.WARN then
        return icons.diagnostics.Warn
      elseif diagnostic.severity == vim.diagnostic.severity.INFO then
        return icons.diagnostics.Info
      elseif diagnostic.severity == vim.diagnostic.severity.HINT then
        return icons.diagnostics.Hint
      end

      return ""
    end,
  },
  float = {
    border = "rounded",
  },
  severity_sort = true,
})

return {
  {
    "neovim/nvim-lspconfig",
    dependencies = { "mason.nvim" },
  },
}
