if Core.plugins.lsp.enable then
  local lsp_installer = Core.utils.plugins.require('nvim-lsp-installer')
  lsp_installer.on_server_ready(function(server)
    local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
    local opts = {
      capabilities = capabilities,
      -- disable when formatting
      on_attach = function(client)
        client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.document_range_formatting = false
      end,
    }
    if Core.language_servers[server.name] then
      opts = Core.language_servers[server.name].config(opts)
    end
    server:setup(opts)
  end)
end

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  underline = true,
  virtual_text = { spacing = 5, severity_limit = 'Warning' },
  update_in_insert = true,
})
