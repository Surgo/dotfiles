 -- Temporary solution
 -- See: https://github.com/antoinemadec/FixCursorHold.nvim/issues/13
vim.g.cursorhold_updatetime = 100

require("neotest").setup({
  adapters = {
    require("neotest-python"),
  }
})

vim.keymap.set("n", "<leader>t", function() require("neotest").run.run() end, { desc = "Run the nearest test" })
vim.keymap.set("n", "<leader>T", function() require("neotest").run.run(vim.fn.expand("%")) end, { desc = "Run the current file" })
vim.keymap.set("n", "<leader>d", function() require("neotest").run.run({strategy = "dap"}) end, { desc = "Debug the nearest test" })
vim.keymap.set("n", "<leader>a", function() require("neotest").run.attach() end, { desc = "Attach to the nearest test" })
