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
    null_ls = { enable = true },
    nvim_comment = { enable = true },

    -- Packer-specific needs
    packer = {
      enable = true,
      init = {
        display = {
          open_fn = function()
            return Core.utils.plugins.require('packer.util').float({ border = 'single' })
          end,
        },
      },
    },
  },

  -- Update in core.utils
  utils = {},

  -- Language Servers
  language_servers = {
    --cmake = {
    --  config = function(opts)
    --    opts = vim.tbl_deep_extend('force', {}, opts)
    --    return opts
    --  end
    --},
    --pylsp = {},
    --clangd = {},
    --ltex = {},
    sumneko_lua = {
      config = function(opts)
        opts = vim.tbl_deep_extend('force', {
          settings = {
            Lua = {
              runtime = { version = 'LuaJIT', path = vim.split(package.path, ';') },
              diagnostics = { globals = { 'vim' } },
              workspace = {
                library = vim.api.nvim_get_runtime_file('', true),
                checkThirdParty = false,
                preloadFileSize = 10000,
              },
              telemetry = { enable = false },
            },
          },
        }, opts)
        return opts
      end,
    },
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

-- Colorscheme
Core.utils.plugins.require('colorscheme.' .. Core.settings.colorscheme)

-- LSP
require('config.lsp')
