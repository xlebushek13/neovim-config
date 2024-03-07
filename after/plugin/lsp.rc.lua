local lsp = require('lsp-zero')
local mason = require('mason')
local null_ls = require("null-ls")

mason.setup()

null_ls.setup({
    sources = {
        null_ls.builtins.diagnostics.mypy,
        null_ls.builtins.diagnostics.ruff,
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
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.isort,
        null_ls.builtins.completion.spell,
    },
})

lsp.preset('recommended')

lsp.configure('lua_ls', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                library = {
                    [vim.fn.expand "$VIMRUNTIME/lua"] = true,
                    [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
                },
                maxPreload = 100000,
                preloadFileSize = 10000,
            },
        },
    },
})

lsp.configure('pylsp', {
    settings = {
        pylsp = {
            plugins = {
                black = { enabled = true },
                mypy = { enabled = true },
                isort = { enabled = true, profile = "black" },
                autopep8 = { enabled = false },
                yapf = { enabled = false }
            },
        },
    },
})

-- lsp.skip_server_setup({ 'rust_analyzer' })



local rust_lsp = lsp.build_options('rust_analyzer', {
    checkOnSave = {
        command = "cargo check"
    },
})

local extension_path = vim.env.HOME .. '/.vscode/extensions/vadimcn.vscode-lldb-1.8.1/'
local codelldb_path = extension_path .. 'adapter/codelldb'
local liblldb_path = extension_path .. 'lldb/lib/liblldb.dylib'

require('rust-tools').setup({
    tools = {
        autoSetHints = true,
        runnables = {
            use_telescope = true,
        },
        hover_actions = {
            auto_focus = false,
        },
    },
    dap = {
        adapter = require('rust-tools.dap').get_codelldb_adapter(
            codelldb_path, liblldb_path)
    },
    server = rust_lsp
})

lsp.setup()

vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }


local function border(hl_name)
    return {
        { "╭", hl_name },
        { "─", hl_name },
        { "╮", hl_name },
        { "│", hl_name },
        { "╯", hl_name },
        { "─", hl_name },
        { "╰", hl_name },
        { "│", hl_name },
    }
end

local lspkind = require('lspkind')
local cmp = require('cmp')


cmp.setup({

  mapping = cmp.mapping.preset.insert({
    ['<CR>'] = cmp.mapping.confirm({select = false}),
  }),
    window = {
        completion = {
            border = border "CmpBorder",
            winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
        },
        documentation = {
            border = border "CmpDocBorder",
        },
    },
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    sources = {
        { name = 'nvim_lsp', keyword_length = 1 },
        { name = 'buffer' },
        -- { name = 'luasnip' }, -- For luasnip users.
        -- { name = 'cmp_tabnine' },
        { name = 'crates' },
        { name = 'path' },
        -- { name = 'nvim_lsp_signature_help' }
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
