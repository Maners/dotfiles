require'nvim-treesitter.configs'.setup {
   -- Automatically install missing parsers when entering buffer
  auto_install = true,
  highlight = {
    enable = true,
  },
}

local home = vim.fn.expand("$HOME")
require('chatgpt').setup({
    api_key_cmd = "cat " .. home .. "/.oai.key"
})
