-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- use 'rstacruz/vim-closer'
  use 'm4xshen/autoclose.nvim'

  use 'mbbill/undotree'

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use 'nvim-treesitter/nvim-treesitter'

  use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
  use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
  use 'L3MON4D3/LuaSnip' -- Snippets plugin

  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }

  use 'tpope/vim-fugitive'
  use 'lewis6991/gitsigns.nvim'
  use 'nvim-treesitter/nvim-treesitter-context'

  use 'stevearc/oil.nvim'

  use {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
    },
  }

  use {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    requires = { {"nvim-lua/plenary.nvim"} }
  }

  use 'voldikss/vim-floaterm'

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  use({
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  })

  -- use {
  --   "folke/which-key.nvim",
  --   config = function()
  --     vim.o.timeout = true
  --     vim.o.timeoutlen = 300
  --     require("which-key").setup {
  --       -- your configuration comes here
  --       -- or leave it empty to use the default settings
  --       -- refer to the configuration section below
  --     }
  --   end
  -- }

  use {'arcticicestudio/nord-vim', as = 'nord'}
  use {'dracula/vim', as = 'dracula'}
  use 'folke/tokyonight.nvim'
end)
