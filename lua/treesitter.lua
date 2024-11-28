-- Config for nvim-treesitter
require'nvim-treesitter.configs'.setup {
  -- treesitter doesn't play nice with vimtex
  highlight = { enable = true, disable = {"latex"} },
  additional_vim_regex_highlighting = false,
}
