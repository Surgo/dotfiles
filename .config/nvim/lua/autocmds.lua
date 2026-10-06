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

vim.api.nvim_create_autocmd("BufWritePre", {
	desc = "Trim trailing whitespace and surrounding blank lines",
	group = vim.api.nvim_create_augroup("Trim", { clear = true }),
	callback = function(event)
		local original = vim.api.nvim_buf_get_lines(event.buf, 0, -1, true)
		local stripped = vim.tbl_map(function(line)
			return (line:gsub("%s+$", ""))
		end, original)
		local first = 1
		while first <= #stripped and stripped[first] == "" do
			first = first + 1
		end
		local last = #stripped
		while last >= first and stripped[last] == "" do
			last = last - 1
		end
		local trimmed = vim.list_slice(stripped, first, last)
		if not vim.deep_equal(original, trimmed) then
			local view = vim.fn.winsaveview()
			vim.api.nvim_buf_set_lines(event.buf, 0, -1, true, trimmed)
			vim.fn.winrestview(view)
		end
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
