return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use 'sainnhe/gruvbox-material'
	use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.0',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }
	use({'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'})
	use {'nvim-lualine/lualine.nvim',
  requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	 }
	 use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'}
	 use "lukas-reineke/indent-blankline.nvim"
	 use 'numToStr/Comment.nvim'
	 use {
      'lervag/vimtex' ,
      config = function() vim.g.tex_flavor = 'latex' end
    }
	use  'JuliaEditorSupport/julia-vim'
	use {
  'VonHeikemen/lsp-zero.nvim',
  requires = {
    -- LSP Support
    {'neovim/nvim-lspconfig'},
    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},

    -- Autocompletion
    {'hrsh7th/nvim-cmp'},
    {'hrsh7th/cmp-buffer'},
    {'hrsh7th/cmp-path'},
    {'saadparwaiz1/cmp_luasnip'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/cmp-nvim-lua'},

    -- Snippets
    {'L3MON4D3/LuaSnip'},
  }
}
 use {
  "startup-nvim/startup.nvim",
  requires = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"},
  config = function()
    require"startup".setup({theme = "dashboard"})
  end
}
 use { "ellisonleao/gruvbox.nvim" }
 use "savq/melange"
 use 'luisiacc/gruvbox-baby'
 use 'jpalardy/vim-slime' 
end)
