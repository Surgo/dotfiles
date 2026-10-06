require("neotest").setup({
	adapters = {
		require("neotest-python"),
	},
})

vim.keymap.set("n", "<leader>tr", function()
	require("neotest").run.run()
end, { desc = "Run the nearest test" })
vim.keymap.set("n", "<leader>tt", function()
	require("neotest").run.run(vim.fn.expand("%"))
end, { desc = "Run the current file" })
vim.keymap.set("n", "<leader>td", function()
	require("neotest").run.run({ strategy = "dap" })
end, { desc = "Debug the nearest test" })
vim.keymap.set("n", "<leader>ta", function()
	require("neotest").run.attach()
end, { desc = "Attach to the nearest test" })
