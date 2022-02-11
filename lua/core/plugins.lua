local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({ 'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path })
  execute('packadd packer.nvim')
end

local packer = Core.utils.plugins.require('packer')

packer.init(Core.plugins.packer.init)

local function is_enable(plugin)
  return Core.plugins[plugin].enable
end

local function get_cmp()
  if Core.plugins.lsp.enable == true then
    return 'nvim-cmp'
  else
    return
  end
end

return packer.startup(function(use)
  use('wbthomason/packer.nvim')

  -- Syntax Highlighting and Visual Plugins
  use({
    'kyazdani42/nvim-web-devicons',
    event = 'BufRead',
  })
  use({
    'goolord/alpha-nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    disable = not is_enable('alpha'),
    event = 'BufWinEnter',
    config = "require('config.alpha')",
  })
  use({
    'lewis6991/gitsigns.nvim',
    requires = 'nvim-lua/plenary.nvim',
    disable = not is_enable('gitsigns'),
    event = 'BufRead',
    config = "require('config.gitsigns')",
  })
  use({
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    disable = not is_enable('lualine'),
    event = 'BufRead',
    config = "require('config.lualine')",
  })
  use({
    'lukas-reineke/indent-blankline.nvim',
    disable = not is_enable('indent_blankline'),
    event = 'BufRead',
    config = "require('config.blankline')",
  })

  -- Tree-Sitter
  use({
    'nvim-treesitter/nvim-treesitter',
    event = 'BufWinEnter',
    run = ':TSUpdate',
    disable = not is_enable('treesitter'),
    config = "require('config.treesitter')",
  })

  -- LSP and Autocomplete
  use({
    'neovim/nvim-lspconfig',
    event = 'BufRead',
    disable = not is_enable('lsp'),
  })
  use({
    'williamboman/nvim-lsp-installer',
    disable = not is_enable('lsp'),
  })
  use({
    'hrsh7th/nvim-cmp',
    config = "require('config.cmp')",
    disable = not is_enable('lsp'),
  })
  use({
    'hrsh7th/cmp-nvim-lsp',
    disable = not is_enable('lsp'),
  })
  use({
    'hrsh7th/cmp-buffer',
    after = 'nvim-cmp',
    disable = not is_enable('lsp'),
  })
  use({
    'hrsh7th/cmp-path',
    after = 'nvim-cmp',
    disable = not is_enable('lsp'),
  })
  use({
    'hrsh7th/cmp-cmdline',
    after = 'nvim-cmp',
    disable = not is_enable('lsp'),
  })
  use({
    'hrsh7th/cmp-vsnip',
    after = 'nvim-cmp',
    disable = not is_enable('lsp'),
  })
  use({
    'hrsh7th/vim-vsnip',
    after = 'nvim-cmp',
    disable = not is_enable('lsp'),
  })
  use({
    'onsails/lspkind-nvim',
    disable = not is_enable('lsp'),
  })
  use({
    'windwp/nvim-autopairs',
    after = get_cmp(),
    disable = not is_enable('autopairs'),
    config = "require('config.autopairs')",
  })

  -- Terminal Integration
  use({
    'akinsho/nvim-toggleterm.lua',
    disable = not is_enable('toggleterm'),
    config = "require('config.toggleterm')",
  })

  -- Navigation
  use({
    'kyazdani42/nvim-tree.lua',
    commit = 'd8bf1ad',
    cmd = 'NvimTreeToggle',
    disable = not is_enable('nvim_tree'),
    config = "require('config.nvimtree')",
  })
  use({
    'akinsho/bufferline.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    disable = not is_enable('bufferline'),
    event = 'BufRead',
    config = "require('config.bufferline')",
  })

  -- Colorschemes
  use({ 'rose-pine/neovim', as = 'rose-pine', opt = true })
  use({ 'gruvbox-community/gruvbox', opt = true })
  use({ 'shaunsingh/nord.nvim', opt = true })
  use({ 'folke/tokyonight.nvim', opt = true })
  use({ 'tiagovla/tokyodark.nvim', opt = true })
  use({ 'catppuccin/nvim', as = 'catppuccin', opt = true })

  -- Others
  use({
    'terrortylor/nvim-comment',
    disable = not is_enable('nvim_comment'),
    config = "require('config.comment')",
  })
  use({
    'jose-elias-alvarez/null-ls.nvim',
    requires = 'nvim-lua/plenary.nvim',
    disable = not is_enable('null_ls'),
    config = "require('config.null_ls')",
  })
end)
