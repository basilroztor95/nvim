local g   = vim.g
local o   = vim.o
local opt = vim.opt
local a   = vim.api

-- Neovide 
--g.neovide_transparency = 0.8
g.neovide_hide_mouse_when_typing = true
g.neovide_cursor_animation_length = 0
g.neovide_scroll_animation_length = 0
g.neovide_remember_window_size = true

-- Fullscreen feature is buggy
--g.neovide_fullscreen = true
g.neovide_no_idle = true
g.neovide_refresh_rate = 60

-- encoding
g.scriptencoding = 'utf-8'
o.encoding = 'utf-8'
o.fileencoding = 'utf-8'

opt.guifont = {'Fira Code', ':h14'}

o.termguicolors = true

-- Do not save when switching buffers
-- o.hidden = true

-- Decrease update time
o.timeoutlen = 500
o.updatetime = 200

-- Number of screen lines to keep above and below the cursor
--o.scrolloff = 8

-- Better editor UI
o.number = true
o.relativenumber = true
o.signcolumn = 'yes'
o.cursorline = true
o.laststatus = 3
o.colorcolumn = '80'

-- Better editing experience
o.expandtab = true
o.smarttab = true
o.cindent = true
o.autoindent = true
o.wrap = true
--o.textwidth = 300
o.tabstop = 2
o.shiftwidth = 2
o.softtabstop = -1 -- If negative, shiftwidth value is used

-- Case insensitive searching UNLESS /C or capital in search
o.ignorecase = true
o.smartcase = true

-- Mouse support
-- opt.mouse = 'a'

-- Undo and backup options
o.backup = false
o.writebackup = false
o.undofile = true
o.swapfile = false
-- o.backupdir = '/tmp/'
-- o.directory = '/tmp/'
-- o.undodir = '/tmp/'

-- Remember 50 items in commandline history
o.history = 50

-- Better buffer splitting
o.splitright = true
o.splitbelow = true

-- Highlight the region on yank
a.nvim_create_autocmd('TextYankPost', {
    group = num_au,
    callback = function()
        vim.highlight.on_yank({ higroup = 'Visual', timeout = 120 })
    end,
})

-------------------------------------------------
-- PLUGINS
-------------------------------------------------

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Treesitter --
  use {'nvim-treesitter/nvim-treesitter',
       config = function()
          require'nvim-treesitter.configs'.setup {
            highlight = {
               enable = true,
               },
            }
       end
  }

  -- LSP --
  use 'neovim/nvim-lspconfig'
  require'lspconfig'.tsserver.setup {}

  -- Colorschemes --
  use 'rebelot/kanagawa.nvim'
  require('kanagawa').load()
  
  -- Auto-pairs --
  use 'windwp/nvim-autopairs'
  require('nvim-autopairs').setup {}

end)
