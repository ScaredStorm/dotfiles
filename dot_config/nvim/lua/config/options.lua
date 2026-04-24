local opt = vim.opt

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

opt.grepprg = "rg --vimgrep"
opt.ignorecase = true
opt.smartcase = true
opt.expandtab = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.wrap = false
opt.list = true
opt.smoothscroll = true
opt.smartindent = true
opt.splitbelow = true
opt.splitright = true
opt.signcolumn = "yes"
opt.mouse = "a"
opt.number = true
opt.relativenumber = true
opt.termguicolors = true
opt.swapfile = false

require("vim._core.ui2").enable()
