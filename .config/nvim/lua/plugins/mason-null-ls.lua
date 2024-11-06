require("mason-null-ls").setup({
  automatic_installation = {
    exclude = {
      "sqlfluff",
    }
  },
  ensure_installed = {
    -- CSS
    "stylelint",
    "prettier",
    -- Docker
    "hadolint",
    -- Markdown
    "markdownlint",
    -- "vale",  # Not tested yet
    -- JSON
    "jsonlint",
    "jq",
    -- Lua
    "luacheck",
    "stylua",
    -- Python
    "autopep8",
    "black",
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
    -- YAML
    "actionlint",
    "yamllint",
    "yamlfmt",
    -- Zsh
    "beautysh",
  },
  handlers = {},
})
