local lsp_installer = Core.utils.plugins.require('nvim-lsp-installer')

lsp_installer.on_server_ready(function(server)
  local opts = {
    on_attach = require('config.lsp.handlers').on_attach,
    capabilities = require('config.lsp.handlers').capabilities,
  }
  if Core.language_servers[server.name] then
    local ls_opts = Core.utils.plugins.require('config.lsp.settings.' .. server.name)
    if not Core.language_servers[server.name].enable_format then
      ls_opts.on_attach = function(client)
        client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.document_range_formatting = false
      end
    end
    opts = vim.tbl_deep_extend('force', ls_opts, opts)
  end
  server:setup(opts)
end)
