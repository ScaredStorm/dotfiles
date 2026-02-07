-- open lists
vim.keymap.set("n", "<leader>xq", ":copen<CR>", { desc = "Quickfix open" })
vim.keymap.set("n", "<leader>xl", ":lopen<CR>", { desc = "Location open" })

-- l - LSP
vim.keymap.set("n", "<leader>ld", vim.lsp.buf.definition, { desc = "LSP Definition" })
vim.keymap.set("n", "<leader>lD", vim.lsp.buf.declaration, { desc = "LSP Declaration" })
vim.keymap.set("n", "<leader>li", vim.lsp.buf.implementation, { desc = "LSP Implementations" })
vim.keymap.set("n", "<leader>lr", vim.lsp.buf.references, { desc = "LSP References" })
vim.keymap.set("n", "<leader>ls", vim.lsp.buf.document_symbol, { desc = "LSP Document Symbols" })
vim.keymap.set("n", "<leader>lS", vim.lsp.buf.workspace_symbol, { desc = "LSP Workspace Symbols" })
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, { desc = "LSP Format file" })
