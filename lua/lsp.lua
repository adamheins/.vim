-- To do custom configuration, add options here:
-- vim.lsp.config('pylsp', {})
-- vim.lsp.config('clangd', {})
-- vim.lsp.config('texlab', {})

-- enable LSPs
vim.lsp.enable('texlab')

-- uv tool install python-lsp-server
vim.lsp.enable('pylsp')

-- sudo apt install clangd
vim.lsp.enable('clangd')

-- npm install -g typescript typescript-language-server
vim.lsp.enable('ts_ls')

-- hide diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = function() end

-- prevent LSP from hijacking gq for wrapping comments
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    vim.bo[args.buf].formatexpr = nil;
  end,
})
