vim.cmd('filetype plugin indent on')
vim.o.shortmess = vim.o.shortmess .. 'c'
vim.o.hidden = true
vim.o.wildmenu = true

-- Encoding
vim.g.encoding = 'UTF-8'
vim.o.fileencoding = 'utf-8'

-- Color
vim.o.background = 'dark'
vim.o.termguicolors = true

-- Appearance
vim.o.ruler = true
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.cursorline = true
vim.wo.signcolumn = 'yes'
vim.wo.colorcolumn = '120'
vim.wo.wrap = false

-- Indentation
vim.o.tabstop = 2
vim.bo.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftround = true
vim.o.shiftwidth = 2
vim.bo.shiftwidth = 2
vim.o.expandtab = true
vim.bo.expandtab = true
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.smartindent = true

-- Support mouse
vim.o.mouse = 'a'

-- Search
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = true
vim.o.incsearch = true

-- Disable creating backup files
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false

-- Autoload
vim.o.autoread = true
vim.bo.autoread = true

-- Smaller updatetime
vim.o.updatetime = 300
vim.o.timeoutlen = 300

-- Split window from below and right
vim.o.splitbelow = true
vim.o.splitright = false

-- Disable various builtin plugins in Vim that bog down speed
vim.g.loaded_matchparen = 1
vim.g.loaded_matchit = 1
vim.g.loaded_logiPat = 1
vim.g.loaded_rrhelper = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_gzip = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_2html_plugin = 1
vim.g.loaded_shada_plugin = 1
vim.g.loaded_spellfile_plugin = 1
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_tutor_mode_plugin = 1
vim.g.loaded_remote_plugins = 1
