local lsp_zero = require('lsp-zero')

lsp_zero.extend_lspconfig()
lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({buffer = bufnr})
end)
vim.g.rustaceanvim = {
  server = {
    capabilities = lsp_zero.get_capabilities()
  },
}
require'lspconfig'.gopls.setup{}
require('lspconfig').nil_ls.setup{}
return {}
