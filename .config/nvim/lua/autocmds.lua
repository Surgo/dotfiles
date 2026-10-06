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

local side_panes = {
	["NvimTree"] = true,
	["trouble"] = true,
	["dap-repl"] = true,
	["dapui_breakpoints"] = true,
	["dapui_console"] = true,
	["dapui_scopes"] = true,
	["dapui_stacks"] = true,
	["dapui_watches"] = true,
	["neotest-output-panel"] = true,
	["neotest-summary"] = true,
	["qf"] = true,
}

local function is_side_pane(win)
	if vim.api.nvim_win_get_config(win).relative ~= "" then
		return false
	end
	return side_panes[vim.bo[vim.api.nvim_win_get_buf(win)].filetype] == true
end

vim.api.nvim_create_autocmd("QuitPre", {
	desc = "Close side panes along with the last editing window",
	group = vim.api.nvim_create_augroup("CloseSidePanes", { clear = true }),
	callback = function()
		local wins = vim.api.nvim_tabpage_list_wins(0)
		local editing = vim.tbl_filter(function(win)
			return not is_side_pane(win) and vim.api.nvim_win_get_config(win).relative == ""
		end, wins)
		if #editing ~= 1 then
			return
		end
		for _, win in ipairs(wins) do
			if is_side_pane(win) then
				pcall(vim.api.nvim_win_close, win, true)
			end
		end
	end,
})
