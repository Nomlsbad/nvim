return {
    settings = {
        Lua = {
            diagnostics = {
                enable = true,
                globals = { "vim" },
            },
            workspace = {
                library = {
                    vim.fn.expand("$VIMRUNTIME/lua"),
                    vim.fn.expand("$VIMRUNTIME/lua/vim/lsp"),
                    vim.fn.stdpath("data") .. "/lazy",
                },
            },
        },
    },
}
