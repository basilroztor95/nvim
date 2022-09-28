vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = 'yes'
vim.o.cursorline = true
vim.o.laststatus = 3
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.shiftwidth = 2
vim.o.completeopt = 'menuone,noinsert,noselect'
vim.o.expandtab = true
vim.o.smarttab = true
vim.o.cindent = true
vim.o.autoindent = true
vim.o.undofile = true
vim.o.splitright = true
vim.o.splitbelow = true

vim.api.nvim_create_autocmd('TextYankPost', {
    group = num_au,
    callback = function()
        vim.highlight.on_yank({ higroup = 'Visual', timeout = 120 })
    end,
})

require'nvim-treesitter.configs'.setup {
	highlight = {
		enable = true
	}
}

require'lspconfig'.tsserver.setup {
	on_attach = function(client, bufnr) 
		vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
	end
}

require'kanagawa'.load()
require'nvim-autopairs'.setup {}

return require'packer'.startup(function()
  use 'wbthomason/packer.nvim'
	use 'nvim-treesitter/nvim-treesitter'
  use 'neovim/nvim-lspconfig'
  use 'rebelot/kanagawa.nvim'
  use 'windwp/nvim-autopairs'
end)
