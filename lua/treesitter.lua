-- Config for nvim-treesitter
require('nvim-treesitter').setup({
  -- treesitter doesn't play nice with vimtex
  highlight = { enable = true, disable = {"latex"} },

  -- treesitter indent doesn't work properly for markdown lists
  indent = { enable = true, disable = {"markdown"} },
  additional_vim_regex_highlighting = false,
})
