local null_ls = require("null-ls")
local diagnostics = null_ls.builtins.diagnostics
local null_ls_format_on_save = vim.api.nvim_create_augroup("NullLsFormatOnSave", {})

null_ls.setup({
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") and client.name == "null-ls" then
      print(string.format("[null-ls] [%s] Enable auto-format on save", client.name))
      vim.api.nvim_clear_autocmds({ group = null_ls_format_on_save, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = null_ls_format_on_save,
        buffer = bufnr,
        callback = function()
          print(string.format("[null-ls] formatted", client.name))
          vim.lsp.buf.format({ async = false })
        end,
      })
    end
  end,
  diagnostics_format = "[#{m}] #{s} (#{c})",
  sources = {
    diagnostics.sqlfluff.with({
      extra_args = { "--dialect", "postgres" },
    }),
  },
})
