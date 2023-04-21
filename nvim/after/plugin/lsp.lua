local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.ensure_installed({
    'rust_analyzer',
})

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  -- TODO customize these
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<leader>vw", vim.lsp.buf.workspace_symbol, opts)
  vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
  vim.keymap.set("n", "<C-n>", vim.diagnostic.goto_next, opts)
  vim.keymap.set("n", "<C-g>", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", "<leader>rc", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
  vim.keymap.set("i", "<F2>", vim.lsp.buf.rename, opts)
  vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
  vim.keymap.set("n", "<leader>ff", vim.cmd.LspZeroFormat, opts)
  -- from nvim-code-action-menu plugin
  vim.keymap.set("n", "<leader>rr", vim.cmd.CodeActionMenu, opts)
  vim.keymap.set("v", "<leader>rr", vim.cmd.CodeActionMenu, opts)
end)


lsp.setup()
