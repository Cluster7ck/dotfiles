local trouble = require("trouble")

trouble.setup {
    mode = "document_diagnostics",
    auto_close = true,
    auto_open = false,
    auto_jump = {"document_diagnostics", "lsp_definitions"}
}

vim.keymap.set("n", "<leader>tr", "<cmd>TroubleToggle<cr>",
  {silent = true, noremap = true}
)
