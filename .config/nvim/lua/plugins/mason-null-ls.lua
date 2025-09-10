require("mason-null-ls").setup({
	automatic_installation = {
		exclude = {
			"sqlfluff",
		},
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
		"stylua",
		-- Python
		"autoflake",
		"black",
		"debugpy",
		"isort",
		"flake8",
		"mypy",
		"python-lsp-server",
		-- Rust
		"codelldb",
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
