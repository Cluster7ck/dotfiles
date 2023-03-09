local gitsigns = require("gitsigns")

gitsigns.setup {
    current_line_blame = true,
    current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol',
        virt_text_priority = 100,
        delay = 100
    }
}

vim.keymap.set("n", "<leader>b", "<cmd>Gitsigns blame_line<cr>")
