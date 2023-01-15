vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
-- keep cursor in the middle
-- for jumping
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- for searching
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- preserver copy buffer when pasting over word
vim.keymap.set("x", "<leader>p", [["_dP]])

-- buffer switch
vim.keymap.set("n", "<leader>kk", "<C-6>")
