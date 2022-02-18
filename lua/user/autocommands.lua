vim.cmd([[
  " autocmd! * <buffer>
  " autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()

  augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]])
