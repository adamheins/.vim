-- enable LSPs
vim.lsp.enable('pylsp')
vim.lsp.enable('clangd')
vim.lsp.enable('texlab')

-- hide diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = function() end

-- prevent LSP from hijacking gq for wrapping comments
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    vim.bo[args.buf].formatexpr = nil;
  end,
})
