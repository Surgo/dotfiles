require("mason-null-ls").setup({
  automatic_installation = {
    exclude = {
      "sqlfluff",
    }
  },
  ensure_installed = {
    -- CSS
    "stylelint",
    -- Docker
    "hadolint",
    -- Markdown
    "markdownlint",
    -- "vale",  # Not tested yet
    -- JSON
    "jq",
    -- Lua
    "luacheck",
    "stylua",
    -- Python
    "autoflake",
    "autopep8",
    "black",
    "debugpy",
    "isort",
    "flake8",
    "mypy",
    -- Shell
    "shellcheck",
    "shfmt",
    -- SQL
    "sql_formatter",
    "sqlfluff",
    -- Terraform
    "terraform_fmt",
    -- TypeScript / JavaScript
    "eslint_d",
    "prettier",
    -- Zsh
    "beautysh",
  },
  handlers = {},
})
