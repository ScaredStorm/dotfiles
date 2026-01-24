-- open lists
vim.keymap.set("n", "<leader>qo", ":copen<CR>", { desc = "Quickfix open" })
vim.keymap.set("n", "<leader>lo", ":lopen<CR>", { desc = "Location open" })


vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "LSP Format file" })
