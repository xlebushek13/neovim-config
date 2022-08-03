if has("nvim")
  let g:plug_home = stdpath('data') . '/plugged'
endif

call plug#begin()

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

if has("nvim")
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' }
  Plug 'hrsh7th/cmp-path'
  Plug 'saadparwaiz1/cmp_luasnip'
  Plug 'hoob3rt/lualine.nvim'
  Plug 'kristijanhusak/defx-git'
  Plug 'kristijanhusak/defx-icons'
  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'neovim/nvim-lspconfig'
  Plug 'williamboman/nvim-lsp-installer'
  Plug 'tami5/lspsaga.nvim'
  Plug 'folke/lsp-colors.nvim'
  Plug 'L3MON4D3/LuaSnip'
  Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
  Plug 'simrat39/rust-tools.nvim'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'onsails/lspkind-nvim'
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'windwp/nvim-autopairs'
  Plug 'windwp/nvim-ts-autotag'
  Plug 'Pocco81/AutoSave.nvim'
  Plug 'vimwiki/vimwiki'
  Plug 'ethanholz/nvim-lastplace'
  Plug 'kdheepak/lazygit.nvim'
  Plug 'folke/which-key.nvim'
  Plug 'saecki/crates.nvim', { 'tag': 'v0.2.1' }
  Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
  Plug 'justinmk/vim-sneak'
  Plug 'folke/todo-comments.nvim'
  Plug 'simrat39/symbols-outline.nvim'
  Plug 'norcalli/nvim-colorizer.lua'
  Plug 'nvim-telescope/telescope-project.nvim'
  Plug 'p00f/nvim-ts-rainbow'
  Plug 'windwp/nvim-ts-autotag'
  Plug 'lyokha/vim-xkbswitch'
  Plug 'Yggdroot/indentLine'
  Plug 'kyazdani42/nvim-tree.lua'
  Plug 'numToStr/Comment.nvim'
  Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }
  Plug 'airblade/vim-gitgutter'
  Plug 'navarasu/onedark.nvim'
  Plug 'mfussenegger/nvim-dap'
  Plug 'othree/html5-syntax.vim'
endif

Plug 'groenewege/vim-less', { 'for': 'less' }
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }

call plug#end()

