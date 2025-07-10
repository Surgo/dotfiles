local null_ls = require("null-ls")
local utils = require("utils")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local python_exec_path = utils.get_python_exec_path()

local sources = {
	formatting.prettier.with({
		prefer_local = true,
	}),
	diagnostics.mypy.with({
		extra_args = { "--python-executable", python_exec_path },
	}),
	diagnostics.sqlfluff.with({
		extra_args = { "--dialect", "postgres" },
	}),
}

local function null_ls_format_on_save(fidget)
	if not vim.g.format_on_save_enabled then
		fidget.notify("[null-ls] Skip formatting")
		return
	end

	vim.lsp.buf.format({
		filter = function(client)
			return client.name == "null-ls"
		end,
		async = false,
	})
end

local null_ls_format_on_save_group = vim.api.nvim_create_augroup("NullLsFormatOnSave", {})
local setup_null_ls_format_on_save = function(client, bufnr)
	local fidget = require("fidget")

	if client.supports_method("textDocument/formatting") and client.name == "null-ls" then
		fidget.notify(string.format("[%s] Enable auto-format on save", client.name))
		vim.api.nvim_clear_autocmds({
			group = null_ls_format_on_save_group,
			buffer = bufnr,
		})
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = null_ls_format_on_save_group,
			buffer = bufnr,
			callback = function()
				null_ls_format_on_save(fidget)
			end,
		})
	end
end

null_ls.setup({
	on_attach = setup_null_ls_format_on_save,
	diagnostics_format = "[#{m}] #{s} (#{c})",
	sources = sources,
})
