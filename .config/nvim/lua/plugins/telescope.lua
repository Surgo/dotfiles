-- telescope.nvim
local actions = require("telescope.actions")
local open_with_trouble = require("trouble.sources.telescope").open

require('telescope').setup({
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = actions.close,
        ["<c-t>"] = open_with_trouble
      },
      n = {
        ["q"] = actions.close,
        ["<c-t>"] = open_with_trouble,
      },
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
  },
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {}
    }
  },
})
local builtin = require('telescope.builtin')
vim.keymap.set('n', ';;', builtin.buffers, {})
vim.keymap.set('n', '::', builtin.live_grep, {})
vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })
-- https://github.com/nvim-telescope/telescope-fzf-native.nvim?tab=readme-ov-file#installation
-- > To get fzf-native working, you need to build it with either cmake or make.
-- As of now, we do not ship binaries. Both install methods will be supported going forward.
-- require("telescope").load_extension "fzf"
require("telescope").load_extension "ui-select"
require("telescope").load_extension "file_browser"
