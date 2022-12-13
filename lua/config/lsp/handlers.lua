local M = {}

M.setup = function()
  vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    virtual_text = { spacing = 5, severity_limit = 'Warning' },
    update_in_insert = true,
  })
end

M.on_attach = function(client)
  -- format on save
  if client.resolved_capabilities.document_formatting then
    vim.cmd([[
      augroup LspFormatting
        autocmd! * <buffer>
        autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
      augroup END
    ]])
  end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
local cmp_nvim_lsp = Core.utils.plugins.require('cmp_nvim_lsp')
M.capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

return M
