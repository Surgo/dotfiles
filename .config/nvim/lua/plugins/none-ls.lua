local null_ls = require("null-ls")
-- local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
  diagnostics_format = "[#{m}] #{s} (#{c})",
  sources = {
    -- formatting.terraform_fmt,
    diagnostics.sqlfluff.with({
      extra_args = { "--dialect", "postgres" },
    }),
  },
})
