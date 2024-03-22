require("mason").setup({})
require('mason-lspconfig').setup_handlers({ function(server)
  local opt = {
    capabilities = require('cmp_nvim_lsp').default_capabilities()
  }
  require('lspconfig')[server].setup(opt)
end })
