require("cfck.remap")
require("cfck.packer")

vim.api.nvim_set_option('showmatch', true)
vim.api.nvim_set_option('ignorecase', true)
vim.api.nvim_set_option('mouse', 'v')

vim.api.nvim_set_option('tabstop', 4)
vim.api.nvim_set_option('softtabstop', 4)
vim.api.nvim_set_option('shiftwidth', 4)
vim.api.nvim_set_option('expandtab', true)
vim.opt.smartindent = true

vim.api.nvim_set_option('number', true)
vim.api.nvim_set_option('mouse', 'a')
vim.api.nvim_set_option('clipboard', 'unnamedplus')
vim.api.nvim_set_option('ttyfast', true)
vim.api.nvim_set_option('signcolumn', 'yes')

vim.opt.list = true
vim.opt.listchars:append("tab:> ")
vim.opt.cursorline = true

vim.opt.colorcolumn = "100"

vim.opt.incsearch = true
vim.opt.hlsearch = true

vim.opt.scrolloff = 8
vim.opt.updatetime = 50

-- vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.termguicolors = true

vim.opt.swapfile = false
vim.opt.wrap = false

-- vim.api.nvim_set_option('noswapfile', true)
