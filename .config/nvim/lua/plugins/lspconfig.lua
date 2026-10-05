local utils = require("utils")

local completion_kind_hl = {
	Class = "@type",
	Constant = "@constant",
	Constructor = "@constructor",
	Enum = "@type",
	EnumMember = "@constant",
	Field = "@variable.member",
	File = "@string.special.path",
	Folder = "@string.special.path",
	Function = "@function",
	Interface = "@type",
	Keyword = "@keyword",
	Method = "@function.method",
	Module = "@module",
	Property = "@property",
	Snippet = "@keyword",
	Struct = "@type",
	Text = "@string",
	Variable = "@variable",
}

local lsp_format_on_save = function(fidget, bufnr)
	if not vim.g.format_on_save_enabled then
		fidget.notify("[LSP] Skip formatting")
		return
	end

	local ft = vim.bo[bufnr].filetype
	local preferred = nil
	if ft == "python" then
		preferred = utils.has_tool_in_venv("ruff") and "ruff" or "pylsp"
	end

	if ft == "python" and preferred == "ruff" then
		fidget.notify("[LSP] [ruff] Starting fix all")
		vim.lsp.buf.code_action({
			context = {
				only = { "source.fixAll" },
				diagnostics = {},
			},
			apply = true,
		})
	end

	vim.defer_fn(function()
		vim.lsp.buf.format({
			bufnr = bufnr,
			filter = function(filter_client)
				if filter_client.name == "null-ls" then
					return false
				end
				if preferred then
					local should_format = filter_client.name == preferred
					if should_format then
						fidget.notify(string.format("[LSP] [%s] Formatting", filter_client.name))
					end
					return should_format
				end
				local should_format = filter_client.name ~= "null-ls"
				if should_format then
					fidget.notify(string.format("[LSP] [%s] Formatting", filter_client.name))
				end
				return should_format
			end,
			async = false,
		})
	end, 200)
end

local setup_user_lsp_config = function(event)
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
	map("grr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")

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

	-- WARN: This is not Goto Definition, this is Goto Declaration.
	--  For example, in C this would take you to the header.
	map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

	-- The following two autocommands are used to highlight references of the
	-- word under your cursor when your cursor rests there for a little while.
	--    See `:help CursorHold` for information about when this is executed
	--
	-- When you move your cursor, the highlights will be cleared (the second autocommand).
	local client = vim.lsp.get_client_by_id(event.data.client_id)
	if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_completion) then
		vim.lsp.completion.enable(true, client.id, event.buf, {
			autotrigger = true,
			convert = function(item)
				local kind = vim.lsp.protocol.CompletionItemKind[item.kind]
				return { kind_hlgroup = kind and completion_kind_hl[kind] or nil }
			end,
		})
	end

	if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlineCompletion, event.buf) then
		vim.lsp.inline_completion.enable(true, { bufnr = event.buf })

		local map = function(keys, func, desc)
			vim.keymap.set("i", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
		end
		map("<M-l>", vim.lsp.inline_completion.get, "Accept inline completion")
		map("<M-]>", function()
			vim.lsp.inline_completion.select({ count = 1 })
		end, "Next inline completion")
		map("<M-[>", function()
			vim.lsp.inline_completion.select({ count = -1 })
		end, "Previous inline completion")
	end

	if client and client.server_capabilities.documentHighlightProvider then
		vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
			buffer = event.buf,
			callback = function()
				for _, c in ipairs(vim.lsp.get_clients({ bufnr = event.buf })) do
					if
						c.server_capabilities.documentHighlightProvider
						and c:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight)
					then
						vim.lsp.buf.document_highlight()
						return
					end
				end
			end,
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
		local lsp_formatting_group = vim.api.nvim_create_augroup("LspFormatting", { clear = false })
		fidget.notify(string.format("[LSP] [%s] Enable auto-format on save", client.name))

		vim.api.nvim_clear_autocmds({
			group = "LspFormatting",
			buffer = event.buf,
		})

		vim.api.nvim_create_autocmd("BufWritePre", {
			desc = "LSP formatting",
			group = lsp_formatting_group,
			buffer = event.buf,
			callback = function()
				lsp_format_on_save(fidget, event.buf)
			end,
		})
	end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.general = capabilities.general or {}
capabilities.general.positionEncodings = { "utf-16" }
vim.lsp.config("*", { capabilities = capabilities })

-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#lua_ls
vim.lsp.config("lua_ls", {
	on_init = function(client)
		if client.workspace_folders then
			local path = client.workspace_folders[1].name
			if
				path ~= vim.fn.stdpath("config")
				and (vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc"))
			then
				return
			end
		end

		client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
			runtime = {
				version = "LuaJIT",
				path = {
					"lua/?.lua",
					"lua/?/init.lua",
				},
			},
			workspace = {
				library = {
					vim.env.VIMRUNTIME,
					"${3rd}/luv/library",
					"${3rd}/busted/library",
				},
				ignoreDir = {
					"pack/plugins/start",
					"pack/colorscheme/start",
				},
				checkThirdParty = "Disable",
			},
		})
	end,
	settings = {
		Lua = {},
	},
})

local typos_config_path = vim.fs.joinpath(vim.fn.stdpath("config"), "typos.toml")
vim.lsp.config("typos_lsp", {
	workspace_required = true,
	capabilities = capabilities,
	init_options = {
		config = typos_config_path,
		diagnosticSeverity = "Hint",
	},
})

-- ruff supersedes pylsp's linters and formatters where the project provides it
local pylsp_settings = function()
	local has_autopep8 = utils.has_tool_in_venv("autopep8")
	local has_black = utils.has_tool_in_venv("black")
	local has_isort = utils.has_tool_in_venv("isort")
	local has_yapf = utils.has_tool_in_venv("yapf")
	local has_ruff = utils.has_tool_in_venv("ruff")
	local has_mypy = utils.has_tool_in_venv("mypy")
	local has_pylint = utils.has_tool_in_venv("pylint")

	return {
		pylsp = {
			plugins = {
				-- Formatters: only enable one
				autopep8 = { enabled = not has_ruff and has_autopep8 and not has_black and not has_yapf },
				black = { enabled = not has_ruff and has_black },
				yapf = { enabled = not has_ruff and has_yapf and not has_black },
				isort = { enabled = not has_ruff and has_isort },
				-- Linters: only enable one
				pyflakes = { enabled = not has_ruff and not has_mypy },
				pycodestyle = { enabled = not has_ruff and not has_black and not has_yapf and not has_autopep8 },
				mccabe = { enabled = false },
				pylint = { enabled = not has_ruff and has_pylint },
			},
		},
	}
end

local push_pylsp_settings = function(client)
	client.config.settings = pylsp_settings()
	client:notify("workspace/didChangeConfiguration", {
		settings = client.config.settings,
	})
end

vim.lsp.config("pylsp", {
	on_init = push_pylsp_settings,
})

-- pylsp always answers navigation; ruff starts only where the project has it
vim.lsp.enable("pylsp")

local function refresh_python_ls()
	vim.lsp.enable("ruff", utils.has_tool_in_venv("ruff"))

	for _, client in ipairs(vim.lsp.get_clients({ name = "pylsp" })) do
		push_pylsp_settings(client)
	end
end

vim.api.nvim_create_autocmd({ "VimEnter", "DirChanged" }, {
	group = vim.api.nvim_create_augroup("PythonLsGate", { clear = true }),
	callback = refresh_python_ls,
})

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = setup_user_lsp_config,
})

vim.g.format_on_save_enabled = true

local toggle_format_on_save = function()
	local fidget = require("fidget")

	vim.g.format_on_save_enabled = not vim.g.format_on_save_enabled
	if vim.g.format_on_save_enabled then
		fidget.notify("[null-ls] Auto-format on save ENABLED")
	else
		fidget.notify("[null-ls] Auto-format on save DISABLED")
	end
end
vim.api.nvim_create_user_command("ToggleFormatOnSave", toggle_format_on_save, {})

local format = function()
	local bufnr = vim.api.nvim_get_current_buf()
	local fidget = require("fidget")
	lsp_format_on_save(fidget, bufnr)
end
vim.api.nvim_create_user_command("Format", format, {})
