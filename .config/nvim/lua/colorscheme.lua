require("catppuccin").setup({
  flavour = "mocha",
  background = {
    light = "latte",
    dark = "mocha",
  },
  transparent_background = true,
  show_end_of_buffer = true,
  integrations = {
    telescope = {
      enabled = true,
      -- style = "nvchad"
    }
  },
})

vim.opt.background = "dark"
vim.cmd.colorscheme "catppuccin-mocha"
