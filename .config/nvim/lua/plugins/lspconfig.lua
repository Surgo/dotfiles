local lsp_format_on_save = function(fidget)
	if not vim.g.format_on_save_enabled then
		fidget.notify("[LSP] Skip formatting")
		return
	end

	-- fidget.notify(string.format("[LSP] [%s] Formatted", client.name))
	vim.lsp.buf.format({
		filter = function(filter_client)
			return filter_client.name ~= "null-ls"
		end,
		async = false,
	})
end

local setup_user_lsp_config = function(event)
	-- Enable completion triggered by <c-x><c-o>
	vim.bo[event.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

	-- Buffer local mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local map = function(keys, func, desc)
		vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
	end
	-- Jump to the definition of the word under your cursor.
	--  This is where a variable was first declared, or where a function is defined, etc.
	--  To jump back, press <C-t>.
	map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")

	-- Find references for the word under your cursor.
	map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")

	-- Jump to the implementation of the word under your cursor.
	--  Useful when your language has ways of declaring types without an actual implementation.
	map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")

	-- Jump to the type of the word under your cursor.
	--  Useful when you're not sure what type a variable is and you want to see
	--  the definition of its *type*, not where it was *defined*.
	map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")

	-- Fuzzy find all the symbols in your current document.
	--  Symbols are things like variables, functions, types, etc.
	map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")

	-- Fuzzy find all the symbols in your current workspace.
	--  Similar to document symbols, except searches over your entire project.
	map("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

	-- Rename the variable under your cursor.
	--  Most Language Servers support renaming across files, etc.
	map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")

	-- Execute a code action, usually your cursor needs to be on top of an error
	-- or a suggestion from your LSP for this to activate.
	map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

	-- Opens a popup that displays documentation about the word under your cursor
	--  See `:help K` for why this keymap.
	map("K", vim.lsp.buf.hover, "Hover Documentation")

	-- WARN: This is not Goto Definition, this is Goto Declaration.
	--  For example, in C this would take you to the header.
	map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

	-- The following two autocommands are used to highlight references of the
	-- word under your cursor when your cursor rests there for a little while.
	--    See `:help CursorHold` for information about when this is executed
	--
	-- When you move your cursor, the highlights will be cleared (the second autocommand).
	local client = vim.lsp.get_client_by_id(event.data.client_id)
	if client and client.server_capabilities.documentHighlightProvider then
		vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
			buffer = event.buf,
			callback = vim.lsp.buf.document_highlight,
		})

		vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
			buffer = event.buf,
			callback = vim.lsp.buf.clear_references,
		})
	end
	if
			client
			and client.name ~= "null-ls"
			and client:supports_method(vim.lsp.protocol.Methods.textDocument_formatting)
	then
		local fidget = require("fidget")
		local lsp_format_on_save_group = vim.api.nvim_create_augroup("LspFormatOnSave", {})
		fidget.notify(string.format("[LSP] [%s] Enable auto-format on save", client.name))
		vim.api.nvim_clear_autocmds({
			group = lsp_format_on_save_group,
			buffer = event.buf,
		})
		vim.api.nvim_create_autocmd("BufWritePre", {
			desc = "Format on save",
			group = lsp_format_on_save_group,
			buffer = event.buf,
			callback = function()
				lsp_format_on_save(fidget)
			end,
		})
	end
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.lsp.config("*", { capabilities = capabilities })
vim.lsp.config("lua_ls", {
	capabilities = capabilities,
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			diagnostics = {
				globals = {
					"vim",
					"require",
				},
				disable = {
					"missing-fields",
				},
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

local typos_config_path = vim.fs.joinpath(vim.fn.stdpath("config"), "typos.toml")
vim.lsp.config("typos_lsp", {
	single_file_support = false,
	capabilities = capabilities,
	init_options = {
		config = typos_config_path,
		diagnosticSeverity = "Hint",
	},
})

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = setup_user_lsp_config,
})
