-- Referred from:
-- * https://github.com/nvim-lua/kickstart.nvim
-- * https://github.com/LunarVim/LunarVim

require("base")
require("options")
require("keymaps")
require("autocmds")
require("colorscheme")
-- Plugins
require("plugins.web-devicons")
require("plugins.lualine")
require("plugins.telescope")
require("plugins.tree")
require("plugins.snippy")
require("plugins.copilot")
require("plugins.fidget")
require("plugins.trim")
-- require("plugins.treesitter") # Not works with telescope
require("plugins.lspconfig")
require("plugins.none-ls")
require("plugins.cmp")
require("plugins.mason-lspconfig")
require("plugins.mason-null-ls")
require("plugins.mason-tool-installer")
require("plugins.trouble")
require("plugins.gitsigns")
