require'nvim-treesitter.configs'.setup({
  ensure_installed = {
    'bash',
    'c',
    'html',
    'lua',
    'markdown',
    'python',
    'terraform',
    'vim',
    'vimdoc',
  },
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
    config = {
      -- Languages that have a single comment style
      typescript = "// %s",
      css = "/* %s */",
      scss = "/* %s */",
      html = "<!-- %s -->",
      svelte = "<!-- %s -->",
      vue = "<!-- %s -->",
      json = "",
    },
  },
  indent = {
    enable = true,
    disable = {
      "python",
      "yaml",
    },
  },
})
