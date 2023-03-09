local hop = require('hop')
hop.setup()

local directions = require('hop.hint').HintDirection
vim.keymap.set('', '<leader>h', function()
  hop.hint_words()
end, {remap=true})
