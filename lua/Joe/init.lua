-- Generic Settings

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = 'a'
vim.opt.ignorecase = true 
vim.opt.smartcase = true 
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.wrap = true 
vim.opt.breakindent = true
vim.opt.tabstop = 2 
vim.opt.shiftwidth = 2

-- keybindings 

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.keymap.set('n', '<leader>w', '<cmd>write<cr>')
vim.keymap.set('n', '<leader>e', '<cmd>Ex<cr>')
vim.keymap.set('n', '<C-c>', '"+y')
vim.keymap.set('n', '<C-v>', '"p+')
-- remember to set up the keybindings for comment

--PackageManager
require('Joe.plugins')

-- Python 
vim.g.python3_host_prog = "/Users/joewinter/opt/anaconda3/bin/python" 

--Colour Settings
vim.opt.termguicolors = true
vim.cmd('colorscheme gruvbox-baby')




