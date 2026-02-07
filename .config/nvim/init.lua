-- 1. Basic Settings
vim.opt.number = true          -- Show line numbers
vim.opt.relativenumber = true  -- Show relative line numbers (great for jumping)
vim.opt.tabstop = 4            -- 4 spaces for tabs
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- 2. Install 'lazy.nvim' (A lightweight plugin manager)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- 3. Configure the Error Checker (LSP)
require("lazy").setup({
  "neovim/nvim-lspconfig", -- The bridge between Neovim and Pyright
})

-- Connect to Pyright
require'lspconfig'.pyright.setup{}

-- 4. Keybindings for Errors (Diagnostics)
-- Press [d to go to previous error, ]d to go to next error
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
-- Press Space + e to see the full error message
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
