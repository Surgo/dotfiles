require("lspsaga").setup({
	code_action = {
		extend_gitsigns = true,
	},
})

vim.keymap.set("n", "<M-j>", "<cmd>Lspsaga diagnostic_jump_next<CR>")
vim.keymap.set("n", "<M-k>", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
