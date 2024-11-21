-- Config for nvim-treesitter
require'nvim-treesitter.configs'.setup {
  highlight = { enable = true },
  incremental_selection = { enable = true },
  textobjects = { enable = true },
  additional_vim_regex_highlighting = false,
}