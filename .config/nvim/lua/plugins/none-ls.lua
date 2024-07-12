local null_ls = require("null-ls")

null_ls.setup({
  diagnostics_format = "[#{m}] #{s} (#{c})",
})
