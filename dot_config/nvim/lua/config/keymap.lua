-- terminal mode
vim.keymap.set("t", "<Esc><Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })
vim.keymap.set("t", "<c-h>", [[<C-\><C-n><C-w>h]], { desc = "Go to the left window" })
vim.keymap.set("t", "<c-j>", [[<C-\><C-n><C-w>j]], { desc = "Go to the down window" })
vim.keymap.set("t", "<c-k>", [[<C-\><C-n><C-w>k]], { desc = "Go to the up window" })
vim.keymap.set("t", "<c-l>", [[<C-\><C-n><C-w>l]], { desc = "Go to the right window" })

-- x - actions
vim.keymap.set("n", "<leader>xq", ":copen<CR>", { desc = "Quickfix open" })
vim.keymap.set("n", "<leader>xl", ":lopen<CR>", { desc = "Location open" })

-- f - find
local pickers = require("mini.pick").builtin;
vim.keymap.set("n", "<leader>ff", pickers.files, { desc = "Pick files" })
vim.keymap.set("n", "<leader>fb", pickers.buffers, { desc = "Pick buffers" })
vim.keymap.set("n", "<leader>fg", pickers.grep, { desc = "Pick grep" })
vim.keymap.set("n", "<leader>fl", pickers.grep_live, { desc = "Pick livegrep" })
vim.keymap.set("n", "<leader>fh", pickers.help, { desc = "Pick help" })

-- l - LSP
vim.keymap.set("n", "<leader>ld", vim.lsp.buf.definition, { desc = "LSP Definition" })
vim.keymap.set("n", "<leader>lD", vim.lsp.buf.declaration, { desc = "LSP Declaration" })
vim.keymap.set("n", "<leader>li", vim.lsp.buf.implementation, { desc = "LSP Implementations" })
vim.keymap.set("n", "<leader>lr", vim.lsp.buf.references, { desc = "LSP References" })
vim.keymap.set("n", "<leader>ls", vim.lsp.buf.document_symbol, { desc = "LSP Document Symbols" })
vim.keymap.set("n", "<leader>lS", vim.lsp.buf.workspace_symbol, { desc = "LSP Workspace Symbols" })
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, { desc = "LSP Format file" })
vim.keymap.set("n", "<leader>lL", function () vim.lsp.codelens.enable(not vim.lsp.codelens.is_enabled()) end, { desc = "LSP Toggle codelens" })
vim.keymap.set("n", "<leader>lI", function () vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end, { desc = "LSP Toggle inlay hints" })
