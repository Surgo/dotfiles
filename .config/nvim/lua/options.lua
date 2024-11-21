-- Make line numbers default
vim.opt.number = true
-- vim.opt.relativenumber = true

-- Set the width of the number column
vim.opt.numberwidth = 4

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = "a"

-- Set pop up menu height
vim.opt.pumheight = 10

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
vim.opt.clipboard:append("unnamedplus")

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = "yes"

-- Decrease update time
vim.opt.updatetime = 100

-- Decrease mapped sequence wait time
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain white-space characters in the editor.
vim.opt.list = true
vim.opt.listchars = {
	tab = "» ",
	trail = "·",
	nbsp = "␣",
}

-- Display lines as one long line
vim.opt.wrap = true

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

-- Set highlight on search
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Input Method (IM) is to be used in Insert mode.
vim.opt.iminsert = 0
vim.opt.imsearch = 0

-- Convert tabs to spaces
vim.opt.expandtab = true

-- The number of spaces inserted for each indentation
vim.opt.shiftwidth = 2

-- Insert 2 spaces for a tab
vim.opt.tabstop = 2

-- Enable spell checking
vim.opt.spell = true
vim.opt.spelllang:append("en")
