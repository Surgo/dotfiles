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
local default_capabilities = require('cmp_nvim_lsp').default_capabilities()
local config_dir = os.getenv("XDG_CONFIG_HOME") or vim.fs.dirname(tostring(vim.fn.stdpath("config"))) or "~/.config"
local lsp_config_dir = vim.fs.joinpath(config_dir, "lsp")

mason_lspconfig.setup_handlers({
  function(server)
    require('lspconfig')[server].setup({
      capabilities=default_capabilities,
    })
  end,
  ["typos_lsp"] = function ()
    require("lspconfig").typos_lsp.setup {
      init_options = {
        config = vim.fs.joinpath(lsp_config_dir, "typos.toml"),
      }
    }
  end,
  ["lua_ls"] = function ()
    require("lspconfig").lua_ls.setup {
      capabilities=default_capabilities,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
            disable = { 'missing-fields' },
          },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
            ignoreDir = {
              "pack/plugins/start",
              "pack/colorscheme/start",
            },
            checkThirdParty = "Disable",
          },
        }
      }
    }
  end,
})
