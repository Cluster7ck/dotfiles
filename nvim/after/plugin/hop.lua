local hop = require('hop')
hop.setup()

local directions = require('hop.hint').HintDirection
vim.keymap.set('', '<leader>hw', function()
  hop.hint_words()
end, {remap=true})
