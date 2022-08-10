Core.utils.plugins.packadd('nvim-treesitter')
Core.utils.plugins.require('nvim-treesitter.install').compilers = { 'gcc' }
-- prefer git
--Core.utils.plugins.require("nvim-treesitter.install").prefer_git = true

local treesitter = Core.utils.plugins.require('nvim-treesitter.configs')

treesitter.setup({
  ensure_installed = 'all',
  ignore_install = {},
  indent = { enable = true },
  highlight = {
    enable = true,
    disable = {},
    additional_vim_regex_highlighting = false,
  },
})
