local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup({
    function(use)
        use 'wbthomason/packer.nvim'
        use {
            'nvim-lualine/lualine.nvim',
            requires = { 'kyazdani42/nvim-web-devicons', opt = true }
        }
        use 'nvim-lua/plenary.nvim'
        use { "catppuccin/nvim", as = "catppuccin" }
        use 'onsails/lspkind-nvim'            -- vscode-like pictograms
        use 'jose-elias-alvarez/null-ls.nvim' -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
        use 'MunifTanjim/prettier.nvim'       -- Prettier plugin for Neovim's built-in LSP client
        use 'tami5/lspsaga.nvim'
        use {
            'nvim-treesitter/nvim-treesitter',
            run = ':TSUpdate'
        }
use { "nvim-neotest/nvim-nio" }
        use 'kyazdani42/nvim-web-devicons'
        use { 'NeogitOrg/neogit', requires = { 'nvim-lua/plenary.nvim', 'sindrets/diffview.nvim' } }
        use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }

        -- use 'WhoIsSethDaniel/lualine-lsp-progress.nvim'
        use 'arkav/lualine-lsp-progress'

        use({
            "nvim-telescope/telescope.nvim",
            requires = { { "nvim-lua/plenary.nvim" }, { "kdheepak/lazygit.nvim" } },
            config = function()
                require("telescope").load_extension("lazygit")
                require("telescope").load_extension("ui-select")
            end,
        })
        use "nvim-telescope/telescope-ui-select.nvim"
        use 'nvim-telescope/telescope-file-browser.nvim'
        use 'windwp/nvim-autopairs'
        use 'windwp/nvim-ts-autotag'
        use 'norcalli/nvim-colorizer.lua'
        use({
            "iamcco/markdown-preview.nvim",
            run = function() vim.fn["mkdp#util#install"]() end,
        })
        use {
            'romgrk/barbar.nvim',
            requires = { 'kyazdani42/nvim-web-devicons' }
        }
        use 'lewis6991/gitsigns.nvim'
        use 'dinhhuy258/git.nvim' -- For git blame & browse
        use 'kristijanhusak/defx-git'
        use 'kristijanhusak/defx-icons'
        use 'simrat39/rust-tools.nvim'
        use {
            "akinsho/toggleterm.nvim",
            tag = 'v2.*',
            config = function()
                require("toggleterm").setup {
                    direction = 'horizontal'
                }
            end
        }
        -- use({
        --     "Pocco81/auto-save.nvim",
        --     config = function()
        --         require("auto-save").setup {
        --             -- your config goes here
        --             -- or just leave it empty :)
        --         }
        --     end,
        -- })
        -- use 'vimwiki/vimwiki'
        use 'ethanholz/nvim-lastplace'
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
        use 'HiPhish/nvim-ts-rainbow2'
        use 'ivanesmantovich/xkbswitch.nvim'
        -- use 'lyokha/vim-xkbswitch'
        -- use 'Yggdroot/indentLine'
        -- use { "lukas-reineke/indent-blankline.nvim",
        --     config = function()
        --         require('ibl').setup(
        --             {
        --                 event = "BufReadPost",
        --                 scope = { enabled = true },
        --                 {
        --                     --     -- for example, context is off by default, use this to turn it on
        --                     show_current_context = true,
        --                     show_current_context_start = true,
        --                 }
        --             }
        --         )
        --     end
        -- }
        use {
            'lukas-reineke/indent-blankline.nvim',
            -- branch = 'v3',
            event = 'BufReadPre',
            config = function()
                local hl_name_list = {
                    'RainbowDelimiterRed',
                    'RainbowDelimiterYellow',
                    'RainbowDelimiterOrange',
                    'RainbowDelimiterGreen',
                    'RainbowDelimiterBlue',
                    'RainbowDelimiterCyan',
                    'RainbowDelimiterViolet',
                }
                require('ibl').setup({
                    scope = {
                        enabled = true,
                        show_start = false,
                        highlight = hl_name_list
                    }
                })
                local hooks = require "ibl.hooks"
                hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
            end,
        }

        use 'numToStr/Comment.nvim'
        use 'olimorris/onedarkpro.nvim'
        use { 'mfussenegger/nvim-dap' }
        use { 'mfussenegger/nvim-dap-python',
            config = function()
                local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
                require('dap-python').setup(path)
            end
        }
        use { 'rcarriga/nvim-dap-ui',
            config = function()
                local dap = require("dap")
                local dapui = require("dapui")
                dapui.setup()
                dap.listeners.after.event_initialized["dapui_config"] = function()
                    dapui.open()
                end
                dap.listeners.before.event_terminated["dapui_config"] = function()
                    dapui.close()
                end
                dap.listeners.before.event_exited["dapui_config"] = function()
                    dapui.close()
                end
            end

        }
        use 'othree/html5-syntax.vim'
        use { 'akinsho/git-conflict.nvim', tag = "*", config = function()
            require('git-conflict').setup()
        end }
        use 'petertriho/nvim-scrollbar'
        use 'andweeb/presence.nvim'
        use {
            'kyazdani42/nvim-tree.lua',
            requires = {
                'kyazdani42/nvim-web-devicons', -- optional, for file icons
            },
            -- tag = 'nightly'                     -- optional, updated every week. (see issue #1193)
        }

        use {
            'VonHeikemen/lsp-zero.nvim',
            requires = {
                -- LSP Support
                { 'neovim/nvim-lspconfig' },
                { 'williamboman/mason.nvim' },
                { 'williamboman/mason-lspconfig.nvim' },

                -- Autocompletion
                { 'hrsh7th/nvim-cmp' },
                { 'hrsh7th/cmp-buffer' },
                { 'hrsh7th/cmp-path' },
                { 'saadparwaiz1/cmp_luasnip' },
                { 'hrsh7th/cmp-nvim-lsp' },
                { 'hrsh7th/cmp-nvim-lua' },

                -- Snippets
                { 'L3MON4D3/LuaSnip' },
                { 'rafamadriz/friendly-snippets' },
            }
        }

        use { 'mbbill/undotree' }

        -- Automatically set up your configuration after cloning packer.nvim
        -- Put this at the end after all plugins
        if packer_bootstrap then
            require('packer').sync()
        end
    end,
    config = {
        display = {
            open_fn = require('packer.util').float,
        }
    }
})
