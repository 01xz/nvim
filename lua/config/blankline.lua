local indent_blankline = Core.utils.plugins.require('indent_blankline')
indent_blankline.setup({
  filetype_exclude = { 'alpha', 'packer', 'NvimTree', 'lsp-installer' },
  buftype_exclude = { 'terminal' },
  show_current_context = true,
})
