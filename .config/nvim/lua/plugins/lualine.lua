require("lualine").setup({
	options = {
		theme = "catppuccin-nvim",
		component_separators = {
			left = "",
			right = "",
		},
		section_separators = {
			left = "",
			right = "",
		},
	},
	sections = {
		lualine_x = {
			"lsp_status",
			"encoding",
			"fileformat",
			"filetype",
		},
	},
	extensions = {
		"fern",
		"fugitive",
		"mason",
		"quickfix",
		"trouble",
	},
})
