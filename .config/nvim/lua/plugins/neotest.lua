 -- Temporary solution
 -- See: https://github.com/antoinemadec/FixCursorHold.nvim/issues/13
vim.g.cursorhold_updatetime = 100

require("neotest").setup({
  adapters = {
    require("neotest-python"),
  }
})
