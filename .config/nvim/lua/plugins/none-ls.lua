local null_ls = require("null-ls")

null_ls.setup({
  diagnostics_format = "[#{m}] #{s} (#{c})",
  sources = {
    null_ls.builtins.diagnostics.sqlfluff.with({
      extra_args = { "--dialect", "postgres" },
    }),
  }
})
