local loaded = false

vim.api.nvim_create_user_command("Octo", function(opts)
	if loaded then
		return
	end
	loaded = true
	require("octo").setup({
		picker_config = {
			mappings = {
				merge_pr = { lhs = "<C-g>m", desc = "merge pull request" },
			},
		},
	})
	vim.cmd("Octo " .. opts.args)
end, { nargs = "*" })

local map = function(keys, args, desc)
	vim.keymap.set("n", keys, "<Cmd>Octo " .. args .. "<CR>", { desc = "Octo: " .. desc })
end
map("<leader>op", "pr list", "[P]R list")
map("<leader>oi", "issue list", "[I]ssue list")
map("<leader>oc", "pr checkout", "PR [C]heckout")
map("<leader>or", "review start", "[R]eview start")
map("<leader>oR", "review resume", "[R]eview resume")
map("<leader>os", "review submit", "Review [S]ubmit")
