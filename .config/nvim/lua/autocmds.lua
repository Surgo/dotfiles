-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight_yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
  desc = "Format on save",
  group = vim.api.nvim_create_augroup("lsp_format_on_save", {}),
  pattern = {
    "*.tf",
    "*.tfvars",
  },
  callback = function()
    vim.lsp.buf.format()
  end,
})
