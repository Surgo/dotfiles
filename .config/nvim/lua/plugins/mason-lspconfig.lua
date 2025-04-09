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
		"ruff",
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
local default_capabilities = require("cmp_nvim_lsp").default_capabilities()

mason_lspconfig.setup_handlers({
	function(server)
		local lsp_mapping = {
			-- old_name = "new_name",
		}
		if lsp_mapping[server] then
			server = lsp_mapping[server]
		end
		local lsp_config = require("lspconfig")
		lsp_config[server].setup({
			capabilities = default_capabilities,
		})
	end,
	["lua_ls"] = function()
		require("lspconfig").lua_ls.setup({
			capabilities = default_capabilities,
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
						disable = { "missing-fields" },
					},
					workspace = {
						library = vim.api.nvim_get_runtime_file("", true),
						ignoreDir = {
							"pack/plugins/start",
							"pack/colorscheme/start",
						},
						checkThirdParty = "Disable",
					},
				},
			},
		})
	end,
	["typos_lsp"] = function()
		require("lspconfig").typos_lsp.setup({
			init_options = {
				config = vim.fs.joinpath(vim.fn.stdpath("config"), "typos.toml"),
			},
		})
	end,
})
