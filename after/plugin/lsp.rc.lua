local lsp = require('lsp-zero')
local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.prettier.with({
            extra_args = function(params)
                return params.options
                    and params.options.tabSize
                    and {
                        "--tab-width",
                        4,
                    }
            end,
        }),
        null_ls.builtins.formatting.rustfmt,
        null_ls.builtins.completion.spell,
    },
})

lsp.preset('recommended')

lsp.skip_server_setup({'rust_analyzer'})


lsp.setup()

local rust_lsp = lsp.build_options('rust_analyzer', {
    checkOnSave = {
        command = "clippy"
    },
})

require('rust-tools').setup({
    tools = {
        autoSetHints = true,
        runnables = {
            use_telescope = true,
        },
        hover_actions = {
            auto_focus = false
        },
    },
    server = rust_lsp,
})

vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
local lspkind = require('lspkind')
lsp.setup_nvim_cmp({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        -- { name = 'luasnip' }, -- For luasnip users.
        { name = 'cmp_tabnine' },
        { name = 'crates' },
        { name = 'path' },
        { name = 'nvim_lsp_signature_help' }
    },
    formatting = {
        format = lspkind.cmp_format({ with_text = false, maxwidth = 50 })
    }
})

vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    update_in_insert = false,
    underline = true,
    severity_sort = false,
    float = false,
})


-- local cmp = require('cmp')
-- vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
--
-- local cmp_config = lsp.defaults.cmp_config({
--     snippet = {
--         expand = function(args)
--             require('luasnip').lsp_expand(args.body)
--         end,
--     },
--     mapping = cmp.mapping.preset.insert({
--         ['<C-d>'] = cmp.mapping.scroll_docs(-4),
--         ['<C-f>'] = cmp.mapping.scroll_docs(4),
--         ['<C-Space>'] = cmp.mapping.complete(),
--         ['<C-e>'] = cmp.mapping.close(),
--         ['<CR>'] = cmp.mapping.confirm({
--             behavior = cmp.ConfirmBehavior.Replace,
--             select = true
--         }),
--     }),
--     sources = cmp.config.sources({
--         { name = 'nvim_lsp' },
--         { name = 'buffer' },
--         { name = 'luasnip' }, -- For luasnip users.
--         { name = 'cmp_tabnine' },
--         { name = 'crates' },
--         { name = 'path' },
--         { name = 'nvim_lsp_signature_help' }
--     }
--     ),
--     formatting = {
--         format = lspkind.cmp_format({ with_text = false, maxwidth = 50 })
--     }
-- })
--
-- cmp.setup(cmp_config)
