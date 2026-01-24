return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        require"nvim-treesitter".install {"rust", "javascript", "typescript", "c", "cpp", "markdown", "typst" }
    end
}
