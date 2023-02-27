return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim' -- Packer can manage itself

  -- Color Scheme
  use 'shaunsingh/nord.nvim'
  use 'folke/tokyonight.nvim'
  use 'glepnir/zephyr-nvim'
  use 'marko-cerovac/material.nvim'
  use 'ayu-theme/ayu-vim'
  use 'NLKNguyen/papercolor-theme'
  use 'NTBBloodbath/doom-one.nvim'
  use 'ishan9299/nvim-solarized-lua'

  use 'kyazdani42/nvim-web-devicons' -- Web Devicon

  use 'nvim-lualine/lualine.nvim' -- Lualine
  use 'akinsho/bufferline.nvim' -- Bufferline
  -- use 'j-hui/fidget.nvim' -- Fidget

  use 'kyazdani42/nvim-tree.lua' -- Nvim-tree

  use 'nvim-treesitter/nvim-treesitter' -- Tree-Sitter
  use 'windwp/nvim-ts-autotag'
  use 'p00f/nvim-ts-rainbow'
  use 'windwp/nvim-autopairs'

  use 'folke/which-key.nvim' -- Which-key

  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim' -- Telescope
  use 'lewis6991/gitsigns.nvim' -- Git Signs

  -- LSP & Completion
  -- use 'williamboman/nvim-lsp-installer'
  use "folke/neodev.nvim"
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  -- use 'hrsh7th/cmp-vsnip'
  -- use 'hrsh7th/vim-vsnip'
  use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
  use 'L3MON4D3/LuaSnip' -- Snippets plugin
  use "rafamadriz/friendly-snippets"
  use 'onsails/lspkind.nvim'
  use 'glepnir/lspsaga.nvim'

  use 'jose-elias-alvarez/null-ls.nvim'

  use 'norcalli/nvim-colorizer.lua' -- Colorizer

  use 'glepnir/dashboard-nvim' -- Dashboard

  use 'akinsho/toggleterm.nvim' -- Toggle Term

  use 'numToStr/Comment.nvim' -- Comment
  use 'Djancyp/better-comments.nvim'
  use 'folke/todo-comments.nvim'

  use 'folke/zen-mode.nvim' -- Zen mode
  use 'folke/twilight.nvim' -- Twilight

  use 'lervag/vimtex' -- Vimtex

  use 'kevinhwang91/nvim-hlslens' -- hlslens
  use 'petertriho/nvim-scrollbar' -- Nvim Scrollbar

  use({
    "iamcco/markdown-preview.nvim",
    run = function()
      vim.fn["mkdp#util#install"]()
    end
  })

  use "ixru/nvim-markdown"
end)
