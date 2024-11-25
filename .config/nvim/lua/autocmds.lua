-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("HighlightYank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
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
	vim.lsp.buf.format({ async = false })
end
vim.api.nvim_create_user_command("Format", format, {})
