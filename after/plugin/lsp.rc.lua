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

lsp.skip_server_setup({ 'rust_analyzer' })


lsp.setup()

local rust_lsp = lsp.build_options('rust_analyzer', {
    checkOnSave = {
        command = "check"
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
lsp.setup_nvim_cmp({
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
