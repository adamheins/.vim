-- Config for nvim-treesitter
require('nvim-treesitter').setup({
  ensure_installed = { "c", "cpp", "python", "javascript", "html", "css", "vim", "lua" },

  -- treesitter doesn't play nice with vimtex
  highlight = { enable = true, disable = {"latex"} },

  -- treesitter indent doesn't work properly for markdown lists
  indent = { enable = true, disable = {"markdown"} },
  additional_vim_regex_highlighting = false,
})
