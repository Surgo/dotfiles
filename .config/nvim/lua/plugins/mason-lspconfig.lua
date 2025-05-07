require("mason").setup({})

local mason_lspconfig = require("mason-lspconfig")
mason_lspconfig.setup({
	ensure_installed = {
		-- https://github.com/williamboman/mason-lspconfig.nvim?tab=readme-ov-file#available-lsp-servers
		-- All
		"typos_lsp",
		-- CSS
		"stylelint_lsp",
		"tailwindcss",
		-- Docker
		"dockerls",
		"docker_compose_language_service",
		-- JSON
		"jsonls",
		-- Lua
		"lua_ls",
		-- Python
		"pylsp",
		-- SQL
		"sqlls",
		-- Terraform
		"terraformls",
		"tflint",
		-- HTML
		"html",
		-- TypeScript / JavaScript
		"astro",
		"ts_ls",
		"eslint",
	},
})
