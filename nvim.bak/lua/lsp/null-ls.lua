local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local code_actions = null_ls.builtins.code_actions
local diagnostics = null_ls.builtins.diagnostics

 
local sources = {
  formatting.terraform_fmt,
  formatting.eslint_d,
  diagnostics.eslint_d,
}

null_ls.setup({
    debug = true,
    sources = sources,

    on_attach = function(client)
      if client.server_capabilities.documentFormattingProvider then
          vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
      end
    end
})

require('lspconfig')['elmls'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
