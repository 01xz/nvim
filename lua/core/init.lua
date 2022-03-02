-- Core object to use for namespacing
Core = {
  plugins = {
    -- Visual
    alpha = { enable = true },
    gitsigns = { enable = true },
    lualine = { enable = true },
    indent_blankline = { enable = true },

    -- Tree-Sitter
    treesitter = { enable = true },

    -- LSP
    lsp = {
      enable = true,
      cmp_sources = {
        { name = 'buffer' },
        { name = 'path' },
        { name = 'cmdline' },
        { name = 'nvim_lsp' },
        { name = 'vsnip' },
      },
    },
    null_ls = { enable = true },
    autopairs = { enable = true },

    -- Terminal
    toggleterm = {
      enable = true,
      toggle_float = function()
        local Terminal = Core.utils.plugins.require('toggleterm.terminal').Terminal
        local float = Terminal:new({ direction = 'float' })
        return float:toggle()
      end,
    },

    -- Navigation
    nvim_tree = { enable = true },
    bufferline = { enable = true },

    -- Others
    nvim_comment = { enable = true },
  },

  -- Update in core.utils
  utils = {},

  -- Language Servers
  language_servers = {
    clangd = { enable_format = true },
    cmake = { enable_format = true },
    ltex = { enable_format = true },
    pylsp = { enable_format = true },
    sumneko_lua = { enable_format = false },
    verible = { enable_format = true },
  },

  -- Some Common Settings
  settings = {
    transparent_bg = false,
    colorscheme = 'gruvbox',
  },
}

-- Utils
require('core.utils')

-- General
require('core.options')
require('core.plugins')
require('core.keybindings')

-- Speed up
require('impatient').enable_profile()

-- Colorscheme
Core.utils.plugins.require('colorscheme.' .. Core.settings.colorscheme)

-- LSP
require('config.lsp')
