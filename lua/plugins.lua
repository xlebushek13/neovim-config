return require('packer').startup(
  function(use)
    use 'wbthomason/packer.nvim'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/nvim-cmp'
    use {'tzachar/cmp-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-cmp'}
    use 'hrsh7th/cmp-path'
    use 'saadparwaiz1/cmp_luasnip'
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use 'kristijanhusak/defx-git'
    use 'kristijanhusak/defx-icons'
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'
    use 'tami5/lspsaga.nvim'
    use 'folke/lsp-colors.nvim'
    use 'L3MON4D3/LuaSnip'
    use 'nvim-treesitter/nvim-treesitter'
    use 'simrat39/rust-tools.nvim'
    use 'kyazdani42/nvim-web-devicons'
    use 'onsails/lspkind-nvim'
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'
    use 'windwp/nvim-autopairs'
    use {
        "akinsho/toggleterm.nvim",
        tag = 'v2.*',
        config = function()
          require("toggleterm").setup{
            direction = 'horizontal'
          }
        end
    }
    use({
        "Pocco81/auto-save.nvim",
        config = function()
             require("auto-save").setup {
                -- your config goes here
                -- or just leave it empty :)
             }
        end,
    })
    use 'vimwiki/vimwiki'
    use 'ethanholz/nvim-lastplace'
    use 'kdheepak/lazygit.nvim'
    use 'folke/which-key.nvim'
    use {
        'saecki/crates.nvim',
        tag = 'v0.2.1',
        requires = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('crates').setup()
        end,
    }
    use 'hrsh7th/cmp-nvim-lsp-signature-help'
    use 'justinmk/vim-sneak'
    use 'folke/todo-comments.nvim'
    use 'simrat39/symbols-outline.nvim'
    use 'norcalli/nvim-colorizer.lua'
    use 'nvim-telescope/telescope-project.nvim'
    use 'p00f/nvim-ts-rainbow'
    use 'windwp/nvim-ts-autotag'
    use 'lyokha/vim-xkbswitch'
    use 'Yggdroot/indentLine'
    use 'kyazdani42/nvim-tree.lua'
    use 'numToStr/Comment.nvim'
    use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'}
    use 'airblade/vim-gitgutter'
    use {
      'navarasu/onedark.nvim',
      config = function ()
        require('onedark').setup {

          style = 'cool',
          transparent = true,
          code_style = {
              comments = 'italic',
              keywords = 'none',
              functions = 'italic',
              strings = 'none',
              variables = 'none'
          },
        }
      end
    }
    use 'mfussenegger/nvim-dap'
    use 'othree/html5-syntax.vim'
  end
)
