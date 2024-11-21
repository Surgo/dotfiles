require("lualine").setup({
	options = {
		theme = "catppuccin",
		component_separators = {
			left = "",
			right = "",
		},
		section_separators = {
			left = "",
			right = "",
		},
		extensions = {
			"fern",
			"fugitive",
			"mason",
			"quickfix",
			"trouble",
		},
	},
})
