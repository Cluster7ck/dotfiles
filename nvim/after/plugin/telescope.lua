local telescope = require('telescope')
local telescope_builtin = require('telescope.builtin')
local telescope_actions = require 'telescope.actions'
local trouble = require("trouble.providers.telescope")
local M = {}

telescope.setup {
  defaults = {
    mappings = {
      i = { ["<c-t>"] = trouble.open_with_trouble },
      n = { ["<c-t>"] = trouble.open_with_trouble },
    },
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
vim.keymap.set('n', '<leader>W', telescope_builtin.current_buffer_fuzzy_find, {})
vim.keymap.set('n', '<leader>w', telescope_builtin.buffers, {})
vim.keymap.set('n', '<leader>rg', telescope_builtin.lsp_references, {})
vim.keymap.set('n', '<leader>ps', function()
	telescope_builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
