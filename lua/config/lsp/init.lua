if Core.plugins.lsp.enable then
  require('config.lsp.lsp_installer')
  require('config.lsp.handlers').setup()
end
