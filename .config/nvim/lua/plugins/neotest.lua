local loaded = false

local load = function()
	if loaded then
		return require("neotest")
	end
	loaded = true

	local neotest = require("neotest")
	neotest.setup({
		adapters = {
			require("neotest-python"),
		},
	})
	return neotest
end

vim.keymap.set("n", "<leader>tr", function()
	load().run.run()
end, { desc = "Run the nearest test" })
vim.keymap.set("n", "<leader>tt", function()
	load().run.run(vim.fn.expand("%"))
end, { desc = "Run the current file" })
vim.keymap.set("n", "<leader>td", function()
	require("plugins.dap").load()
	load().run.run({ strategy = "dap" })
end, { desc = "Debug the nearest test" })
vim.keymap.set("n", "<leader>ta", function()
	load().run.attach()
end, { desc = "Attach to the nearest test" })
