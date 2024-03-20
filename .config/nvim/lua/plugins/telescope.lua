---- telescope.nvim
local actions = require("telescope.actions")
require('telescope').setup{
  defaults = {
    mappings = {
      i = { ["<esc>"] = actions.close },
      n = { ["q"] = actions.close },
    },
    vimgrep_arguments = {
      "ag",
      "--nocolor",
      "--noheading",
      "--numbers",
      "--column",
      "--smart-case",
      "--silent",
      "--vimgrep",
    }
  }
}
local builtin = require('telescope.builtin')
vim.keymap.set('n', ';;', builtin.buffers, {})
vim.keymap.set('n', '::', builtin.live_grep, {})
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
require("telescope").load_extension "file_browser"
