local telescope = require('telescope')
local telescope_builtin = require('telescope.builtin')
local telescope_actions = require 'telescope.actions'
local M = {}

telescope.setup {
  defaults = {
    prompt_position = 'top',
    layout_strategy = 'horizontal',
    use_less = false
  }
}

M.find_files = function()
  telescope_builtin.find_files {
    find_command = { 'rg', '--files', '--iglob', '!.git', '--hidden' },
    previewer = false
  }
end

vim.keymap.set('n', '<leader>pf', M.find_files, {})
vim.keymap.set('n', '<C-p>', telescope_builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
	telescope_builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
