local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
    use 'wbthomason/packer.nvim'
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use 'nvim-lua/plenary.nvim'
    use 'onsails/lspkind-nvim' -- vscode-like pictograms
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/nvim-cmp'
    use {'tzachar/cmp-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-cmp'}
    use 'hrsh7th/cmp-path'
    use 'saadparwaiz1/cmp_luasnip'
    use 'neovim/nvim-lspconfig'
    use 'jose-elias-alvarez/null-ls.nvim' -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
    use 'MunifTanjim/prettier.nvim' -- Prettier plugin for Neovim's built-in LSP client
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'
    use 'tami5/lspsaga.nvim'
    use 'L3MON4D3/LuaSnip'
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use 'kyazdani42/nvim-web-devicons'
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-telescope/telescope-file-browser.nvim'
    use 'windwp/nvim-autopairs'
    use 'windwp/nvim-ts-autotag'
    use 'norcalli/nvim-colorizer.lua'
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })
    -- use 'akinsho/nvim-bufferline.lua'
    use {
        'romgrk/barbar.nvim',
        requires = {'kyazdani42/nvim-web-devicons'}
    }
    use 'lewis6991/gitsigns.nvim'
    use 'dinhhuy258/git.nvim' -- For git blame & browse
    use 'kristijanhusak/defx-git'
    use 'kristijanhusak/defx-icons'
    use 'williamboman/nvim-lsp-installer'
    use 'simrat39/rust-tools.nvim'
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
    use 'justinmk/vim-sneak'
    use 'folke/todo-comments.nvim'
    use 'simrat39/symbols-outline.nvim'
    use 'nvim-telescope/telescope-project.nvim'
    use 'p00f/nvim-ts-rainbow'
    use 'lyokha/vim-xkbswitch'
    -- use 'Yggdroot/indentLine'
    use "lukas-reineke/indent-blankline.nvim"
    use 'numToStr/Comment.nvim'
    use 'airblade/vim-gitgutter'
    use 'olimorris/onedarkpro.nvim'
    use 'mfussenegger/nvim-dap'
    use 'othree/html5-syntax.vim'
    use {'akinsho/git-conflict.nvim', tag = "*", config = function()
        require('git-conflict').setup()
    end}
    use 'petertriho/nvim-scrollbar'
    use 'andweeb/presence.nvim'
    use "rafamadriz/friendly-snippets"
    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        requires = { 
            "nvim-lua/plenary.nvim",
            "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        }
    }
  end
)
