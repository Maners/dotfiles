vim.api.nvim_create_autocmd('FileType', {
  pattern = 'php',
  callback = function() 
    vim.lsp.start({
       name = 'phpactor',
       cmd = {'phpactor', 'language-server'},
       root_dir = vim.fs.dirname(vim.fs.find({'composer.json', '.git'}, { upward = true })[1]),
    })
  end,
})

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client.server_capabilities.completionProvider then
      vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"
    end
    if client.server_capabilities.definitionProvider then
      vim.bo[bufnr].tagfunc = "v:lua.vim.lsp.tagfunc"
    end
  end,
})

require'nvim-treesitter.configs'.setup {
   -- Automatically install missing parsers when entering buffer
  auto_install = true,
  highlight = {
    enable = true,
  },
}
