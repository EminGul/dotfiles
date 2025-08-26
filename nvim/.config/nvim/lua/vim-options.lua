-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Change default split behaviour to below and right
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Disable line wrapping
vim.opt.wrap = false

-- Tab settings
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- Synchronizes the system clipboard with Neovim's clipboard
vim.opt.clipboard = "unnamedplus"

-- Center when scrolling 
vim.opt.scrolloff = 999

-- Make visual block work at the end of a line
vim.opt.virtualedit = "block"

-- See effects of command in a split window below (eg. for file-wide substitutions)
vim.opt.inccommand = "split"

-- Ignore casing in editor
vim.opt.ignorecase = true

-- Enable 24-bit colours & highlighting rules
vim.opt.termguicolors = true

-- Set leader                        
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.o.signcolumn = "yes"
vim.diagnostic.config({
    update_in_insert = true,
})
