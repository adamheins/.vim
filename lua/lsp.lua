-- To do custom configuration, add options here:
-- vim.lsp.config('pylsp', {})
-- vim.lsp.config('clangd', {})
-- vim.lsp.config('texlab', {})

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
