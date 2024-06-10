require("mason").setup({})

local mason_lspconfig = require("mason-lspconfig")
mason_lspconfig.setup({
  ensure_installed = {
    -- https://github.com/williamboman/mason-lspconfig.nvim?tab=readme-ov-file#available-lsp-servers
    -- All
    "typos_lsp",
    -- CSS
    "stylelint_lsp",
    -- Docker
    "dockerls",
    "docker_compose_language_service",
    -- JSON
    "jsonls",
    -- Lua
    "lua_ls",
    -- Python
    "debugpy",
    "pylsp",
    "ruff_lsp",
    -- SQL
    "sqlls",
    -- Terraform
    "terraformls",
    "tflint",
    -- TypeScript / JavaScript
    "tsserver",
    "eslint",
  }
})
mason_lspconfig.setup_handlers({
  function(server)
    local opt = {
      capabilities = require('cmp_nvim_lsp').default_capabilities()
    }
    require('lspconfig')[server].setup(opt)
  end
})
