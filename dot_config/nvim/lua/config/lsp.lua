vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
        if client:supports_method("textDocument/completion") then
            vim.opt.completeopt = { "menu", "menuone", "fuzzy", "noinsert", "popup" }

            vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
            vim.keymap.set("i", "<c-space>", function()
                vim.lsp.completion.get()
            end)
        end
    end
})

-- diagnostics
vim.diagnostic.config({
    virtual_lines = true,
})

-- enabled lsp servers
vim.lsp.enable({"lua_ls", "tinymist", "rust_analyzer"})
