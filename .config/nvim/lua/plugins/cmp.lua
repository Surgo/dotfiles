local cmp = require("cmp")

cmp.setup({
	snippet = {
		expand = function(args)
			require("snippy").expand_snippet(args.body) -- For `snippy` users.
			-- Native snippet isn't working currently
			-- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
		end,
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		["<C-k>"] = cmp.mapping.select_next_item(),
		["<C-j>"] = cmp.mapping.select_prev_item(),
		["Down"] = cmp.mapping.select_next_item(),
		["Up"] = cmp.mapping.select_prev_item(),
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),

		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp", priority = 1, group_index = 2 },
		{ name = "buffer", priority = 1, group_index = 2 },
		{ name = "path", priority = 2, group_index = 2 },
		{ name = "snippy", priority = 2, group_index = 2 },
		{
			name = "cmdline",
			option = {
				ignore_cmds = { "Man", "!" },
			},
			priority = 3,
			group_index = 2,
		},
	}),
})
