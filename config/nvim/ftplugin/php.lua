vim.lsp.start({
   name = 'phpactor',
   cmd = {'phpactor', 'language-server'},
   root_dir = vim.fs.dirname(vim.fs.find({'composer.json', '.git'}, { upward = true })[1]),
})
