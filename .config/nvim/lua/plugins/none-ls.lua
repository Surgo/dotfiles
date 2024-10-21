local null_ls = require("null-ls")

null_ls.setup({
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({
        group = "lsp_format_on_save",
        buffer = bufnr,
      })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = "lsp_format_on_save",
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format()
        end,
      })
    end
  end,
  diagnostics_format = "[#{m}] #{s} (#{c})",
  sources = {
    null_ls.builtins.diagnostics.sqlfluff.with({
      extra_args = { "--dialect", "postgres" },
    }),
  },
})
