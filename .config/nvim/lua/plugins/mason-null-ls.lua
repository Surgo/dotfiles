vim.schedule(function()
	require("mason-null-ls").setup({
		automatic_installation = {
			exclude = {
				"ruff",
			},
		},
		ensure_installed = {
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
			"debugpy",
			-- Rust
			"codelldb",
			-- Shell
			"shellcheck",
			"shfmt",
			-- SQL
			"sql_formatter",
			-- YAML
			"actionlint",
			"yamllint",
			"yamlfmt",
			-- Zsh
			"beautysh",
		},
		handlers = {},
	})
end)
