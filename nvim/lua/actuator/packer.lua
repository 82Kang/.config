-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Simple plugins can be specified as strings
  use 'rstacruz/vim-closer'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.1',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }
  -- telescope file tree
  use { "nvim-telescope/telescope-file-browser.nvim" }
  use({
	  'rose-pine/neovim',
	  as = 'rose-pine',
	  config = function()
		  require("rose-pine").setup()
		  vim.cmd('colorscheme rose-pine')
	  end
  })
  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use('theprimeagen/harpoon')
  use('mbbill/undotree')
  use('tpope/vim-fugitive')
  use('nvim-lualine/lualine.nvim')
  use('windwp/nvim-autopairs')
  -- try omnisharp
  -- use('OmniSharp/omnisharp-vim')
  -- didn't work, mono not found, don't want to use mono
  use('neoclide/coc.nvim', {branch =  'release'})
  --
  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v1.x',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},             -- Required
		  {'williamboman/mason.nvim'},           -- Optional
		  {'williamboman/mason-lspconfig.nvim'}, -- Optional

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},         -- Required
		  {'hrsh7th/cmp-nvim-lsp'},     -- Required
      {'hrsh7th/cmp-nvim-lsp-signature-help'},
		  {'hrsh7th/cmp-buffer'},       -- Optional
		  {'hrsh7th/cmp-path'},         -- Optional
		  {'saadparwaiz1/cmp_luasnip'}, -- Optional
		  {'hrsh7th/cmp-nvim-lua'},     -- Optional

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},             -- Required
		  {'rafamadriz/friendly-snippets'}, -- Optional
	  }
  }
  use 'nvim-tree/nvim-web-devicons'
--use {'romgrk/barbar.nvim', requires = 'nvim-web-devicons'}

  -- file explorer
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-tree.lua',
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }
end)
