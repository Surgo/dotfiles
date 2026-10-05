-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("HighlightYank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

vim.api.nvim_create_autocmd("CmdlineChanged", {
	desc = "Trigger command-line completion",
	group = vim.api.nvim_create_augroup("CmdlineAutocomplete", { clear = true }),
	pattern = { ":", "/", "?" },
	callback = function()
		vim.fn.wildtrigger()
	end,
})
