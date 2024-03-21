-- Reffered:
-- - https://github.com/nvim-lua/kickstart.nvim

require("base")
require("options")
require("keymaps")
require("autocmds")
require("colorscheme")
-- Start plugins
require("plugins.web-devicons")
require("plugins.lualine")
require("plugins.telescope")
require("plugins.copilot")
require("plugins.fidget")
-- require("plugins.treesitter") # Not works with telescope
require("plugins.mason-lspconfig")
require("plugins.mason-tool-installer")
require("plugins.lspconfig")
