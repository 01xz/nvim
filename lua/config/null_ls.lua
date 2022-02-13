local null_ls = Core.utils.plugins.require('null-ls')

local formatting = null_ls.builtins.formatting

null_ls.setup({
  sources = {
    formatting.scalafmt,
    formatting.shfmt,
    formatting.stylua.with({
      extra_args = { '--quote-style', 'AutoPreferSingle', '--indent-type', 'Spaces', '--indent-width', '2' },
    }),
  },
  on_attach = function(client)
    if client.resolved_capabilities.document_formatting then
      vim.cmd([[
      augroup LspFormatting
          autocmd! * <buffer>
          autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
      augroup END
      ]])
    end
  end,
})
