require("catppuccin").setup({
  flavour = "mocha",
  background = {
    light = "latte",
    dark = "mocha",
  },
  transparent_background = true,
  show_end_of_buffer = true,
  integrations = {
    cmp = true,
    gitsigns = true,
    lsp_trouble = false,
    nvimtree = true,
    telescope = {
      enabled = true,
      -- style = "nvchad"
    },
    treesitter = true,
  },
})

vim.opt.background = "dark"
vim.cmd.colorscheme "catppuccin-mocha"
