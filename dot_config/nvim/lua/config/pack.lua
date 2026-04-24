vim.pack.add({
    "https://github.com/catppuccin/nvim",
    "https://github.com/nvim-mini/mini.pick",
    "https://github.com/folke/which-key.nvim",
    "https://github.com/nvim-treesitter/nvim-treesitter",
})

require("catppuccin").setup({
    auto_integrations = true
})
vim.cmd.colorscheme("catppuccin-macchiato")

require("mini.pick").setup()
require("which-key").setup({ preset = "helix" })


local ftypes = { 'rust', 'javascript', 'typescript', 'cpp', 'c', 'go', 'markdown', 'dockerfile', 'toml', 'yaml' }
require("nvim-treesitter").install(ftypes)

local ts_augroup = vim.api.nvim_create_augroup("sb.conf.treesitter", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
    group = ts_augroup,
    pattern = ftypes,
    callback = function()
        vim.treesitter.start()
        vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
        vim.bo.indentexpr = 'v:lua.require"nvim-treesitter".indentexpr()'
    end
})

vim.api.nvim_create_autocmd("PackChanged", {
    group = ts_augroup,
    callback = function(ev)
        local name, kind = ev.data.spec.name, ev.data.kind
        if name == 'nvim-treesitter' and kind == 'update' then
            if not ev.data.active then vim.cmd.packadd('nvim-treesitter') end
            vim.cmd('TSUpdate')
        end
    end
})
