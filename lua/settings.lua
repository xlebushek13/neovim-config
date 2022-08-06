vim.opt.number = true
vim.opt.undofile = true
vim.opt.undodir = "/Users/xlebushek/.vimundo"
vim.opt.syntax = "enable"
vim.opt.fileencodings = {"utf-8", "sjis", "euc-jp", "latin"}
vim.opt.encoding = "utf-8"
vim.opt.title = true
vim.opt.mouse = "a"
vim.opt.autoindent = true
vim.opt.background = "dark"
vim.opt.showcmd = true
vim.opt.swapfile = false
vim.opt.autoread = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 2
vim.opt.scrolloff = 10
vim.opt.binary = true
vim.opt.expandtab = true
vim.opt.shell = "zsh"
vim.opt.lazyredraw = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.wrap = false
vim.opt.cursorline = true

vim.g.gitgutter_async = 0
vim.g.gitgutter_max_signs = 2000
vim.g.XkbSwitchLib = '/usr/local/bin/libInputSourceSwitcher.dylib'
vim.g.XkbSwitchEnabled = 1
vim.g.indentLine_char = '|'

vim.cmd([[
autocmd!
set t_BE=
set nobackup
set backupskip=/tmp/*,/private/tmp/*
if has('nvim')
    set inccommand=split
    endif
    set nosc noru nosm
    set nosplitright
    set smarttab
    set nocompatible
    set si
    filetype plugin indent on
    set backspace=start,eol,indent
    set path+=**
    set wildignore+=*/node_modules/*
    set formatoptions+=r

    highlight Visual cterm=NONE ctermbg=236 ctermfg=NONE guibg=LightBlue
    highlight LineNr cterm=none ctermfg=240 guifg=#2b506e guibg=#000000

    augroup BgHighlight
    autocmd!
    autocmd WinEnter * set cul
    autocmd WinLeave * set nocul
    augroup END

    if &term =~ "screen"
        autocmd BufEnter * if bufname("") !~ "^?[A-Za-z0-9?]*://" | silent! exe '!echo -n "\ek[`hostname`:`basename $PWD`/`basename %`]\e\\"' | endif
        autocmd VimLeave * silent!  exe '!echo -n "\ek[`hostname`:`basename $PWD`]\e\\"'
        endif

        autocmd InsertLeave * set nopaste
        au BufNewFile,BufRead *.es6 setf javascript
        au BufNewFile,BufRead *.tsx setf typescriptreact
        au BufNewFile,BufRead *.md set filetype=markdown
        au BufNewFile,BufRead *.mdx set filetype=markdown
        au BufNewFile,BufRead *.flow set filetype=javascript
        au BufNewFile,BufRead *.fish set filetype=fish

        autocmd BufWritePost * GitGutter

        set suffixesadd=.js,.es,.jsx,.json,.css,.less,.sass,.styl,.php,.py,.md

        autocmd FileType coffee setlocal shiftwidth=2 tabstop=2
        autocmd FileType ruby setlocal shiftwidth=2 tabstop=2
        autocmd FileType yaml setlocal shiftwidth=2 tabstop=2


        au BufWinEnter *.json :IndentLinesToggle
        au BufWinEnter *.vue set shiftwidth=4 
        au BufWinEnter *.ts set shiftwidth=4 

        set termguicolors

        set exrc

        let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]

        cnoreabbrev g Git
        cnoreabbrev gopen GBrowse
        set clipboard+=unnamedplus
]])

require('lualine').setup {
    options = {
        theme = 'onedark'
    }
}

require('rust-tools').setup({
    tools = {
        autoSetHints = true,
        hover_with_actions = true,
        runnables = {
            use_telescope = true,
        },
        hover_actions = {
            auto_focus = false
        },
    },
    server = {
        cmd = { vim.fn.stdpath "data" .. "/lsp_servers/rust-tools/rust-analyzer" },
    },
})

require ('nvim-lastplace').setup()

require("colorizer").setup({ "*" }, {
    RGB = true, -- #RGB hex codes
    RRGGBB = true, -- #RRGGBB hex codes
    RRGGBBAA = true, -- #RRGGBBAA hex codes
    rgb_fn = true, -- CSS rgb() and rgba() functions
    hsl_fn = true, -- CSS hsl() and hsla() functions
    css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
    css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
})

vim.cmd [[packadd telescope.nvim]]

require('Comment').setup()

require("nvim-tree").setup({
    on_config_done = nil,
    disable_netrw = true,
    hijack_netrw = true,
    open_on_setup = false,
    open_on_setup_file = false,
    sort_by = "name",
    ignore_buffer_on_setup = false,
    ignore_ft_on_setup = {
        "startify",
        "dashboard",
        "alpha",
    },
    auto_reload_on_write = true,
    hijack_unnamed_buffer_when_opening = false,
    hijack_directories = {
        enable = true,
        auto_open = true,
    },
    open_on_tab = false,
    hijack_cursor = false,
    update_cwd = false,
    diagnostics = {
        enable = true,
        show_on_dirs = true,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        },
    },
    update_focused_file = {
        enable = true,
        update_cwd = true,
        ignore_list = {},
    },
    system_open = {
        cmd = nil,
        args = {},
    },
    git = {
        enable = true,
        ignore = false,
        timeout = 200,
    },
    renderer = {
        indent_markers = {
            enable = false,
            icons = {
                corner = "└ ",
                edge = "│ ",
                none = "  ",
            },
        },
    },
    view = {
        width = 30,
        height = 30,
        hide_root_folder = false,
        side = "left",
        preserve_window_proportions = false,
        mappings = {
            custom_only = false,
            list = {
                { key = "s", action = "" },
                { key = "O", action = "system_open" },
            },
        },
        number = false,
        relativenumber = false,
        signcolumn = "yes",
    },
    filters = {
        dotfiles = false,
        custom = { "node_modules", "\\.cache" },
        exclude = {},
    },
    trash = {
        cmd = "trash",
        require_confirm = true,
    },
    log = {
        enable = false,
        truncate = false,
        types = {
            all = false,
            config = false,
            copy_paste = false,
            diagnostics = false,
            git = false,
            profile = false,
        },
    },
    actions = {
        use_system_clipboard = true,
        change_dir = {
            enable = true,
            global = false,
            restrict_above_cwd = false,
        },
        open_file = {
            quit_on_open = false,
            resize_window = false,
            window_picker = {
                enable = true,
                chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
                exclude = {
                    filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
                    buftype = { "nofile", "terminal", "help" },
                },
            },
        },
    },
})

local wk = require("which-key")

wk.register({
    ["c"] = { ":bdelete %<CR>", "Close Buffer" },
    l = {
        name = "LSP",
        f = {"<cmd>lua vim.lsp.buf.formatting_seq_sync()<cr>", "Format"},
        a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
        d = { "<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<cr>", "Buffer Diagnostics" },
        w = { "<cmd>Telescope diagnostics<cr>", "Diagnostics" },
        i = { "<cmd>LspInfo<cr>", "Info" },
        I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
        j = {
            vim.diagnostic.goto_next,
            "Next Diagnostic",
        },
        k = {
            vim.diagnostic.goto_prev,
            "Prev Diagnostic",
        },
        l = { vim.lsp.codelens.run, "CodeLens Action" },
        q = { vim.diagnostic.setloclist, "Quickfix" },
        r = { vim.lsp.buf.rename, "Rename" },
        s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
        S = {
            "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
            "Workspace Symbols",
        },
        e = { "<cmd>Telescope quickfix<cr>", "Telescope Quickfix" },
    },
}, { prefix = "<Space>" })

require("bufferline").setup{
    keymap = {
        normal_mode = {},
    },
    highlights = {
        background = {
            gui = "italic",
        },
        buffer_selected = {
            gui = "bold",
        },
    },
    options = {
        numbers = "none", -- can be "none" | "ordinal" | "buffer_id" | "both" | function
        close_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
        right_mouse_command = "vert sbuffer %d", -- can be a string | function, see "Mouse actions"
        left_mouse_command = "buffer %d", -- can be a string | function, see "Mouse actions"
        middle_mouse_command = nil, -- can be a string | function, see "Mouse actions"
        -- NOTE: this plugin is designed with this icon in mind,
        -- and so changing this is NOT recommended, this is intended
        -- as an escape hatch for people who cannot bear it for whatever reason
        indicator_icon = "▎",
        buffer_close_icon = "",
        modified_icon = "●",
        close_icon = "",
        left_trunc_marker = "",
        right_trunc_marker = "",
        --- name_formatter can be used to change the buffer's label in the bufferline.
        --- Please note some names can/will break the
        --- bufferline so use this at your discretion knowing that it has
        --- some limitations that will *NOT* be fixed.
        name_formatter = function(buf) -- buf contains a "name", "path" and "bufnr"
            -- remove extension from markdown files for example
            if buf.name:match "%.md" then
                return vim.fn.fnamemodify(buf.name, ":t:r")
            end
        end,
        max_name_length = 18,
        max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
        tab_size = 18,
        diagnostics = "nvim_lsp",
        diagnostics_update_in_insert = false,
        diagnostics_indicator = diagnostics_indicator,
        -- NOTE: this will be called a lot so don't do any heavy processing here
        custom_filter = custom_filter,
        offsets = {
            {
                filetype = "undotree",
                text = "Undotree",
                highlight = "PanelHeading",
                padding = 1,
            },
            {
                filetype = "NvimTree",
                text = "Explorer",
                highlight = "PanelHeading",
                padding = 1,
            },
            {
                filetype = "DiffviewFiles",
                text = "Diff View",
                highlight = "PanelHeading",
                padding = 1,
            },
            {
                filetype = "flutterToolsOutline",
                text = "Flutter Outline",
                highlight = "PanelHeading",
            },
            {
                filetype = "packer",
                text = "Packer",
                highlight = "PanelHeading",
                padding = 1,
            },
        },
        show_close_icon = false,
        show_tab_indicators = true,
        persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
        -- can also be a table containing 2 custom separators
        -- [focused and unfocused]. eg: { '|', '|' }
        separator_style = "thin",
        enforce_regular_tabs = false,
        always_show_bufferline = false,
        sort_by = "id",
    },
}

require("nvim-autopairs").setup {}

local tabnine = require('cmp_tabnine.config')
tabnine:setup({
    max_num_results = 5;
        sort = true;
        run_on_every_keystroke = true;
        snippet_placeholder = '..';
        ignored_file_types = { -- default is not to ignore
        -- uncomment to ignore in lua:
        -- lua = true
    };
    show_prediction_strength = false;
})

require('crates').setup()

require("lsp-colors").setup({
    Error = "#db4b4b",
    Warning = "#e0af68",
    Information = "#0db9d7",
    Hint = "#10B981"
})

local status, autopairs = pcall(require, "nvim-autopairs")
if (not status) then return end

autopairs.setup({
    disable_filetype = { "TelescopePrompt" , "vim" },
})

local cmp = require'cmp'
local lspkind = require'lspkind'

cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true
        }),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    }, 
    {
        { name = 'buffer' },
    },
    {
        { name = 'crates' },
    },
    {
        { name = 'path' },
    },
    {
        { name = 'cmp_tabnine' },
    },
    {
        { name = 'nvim_lsp_signature_help' }
    }
    ),
    formatting = {
        format = lspkind.cmp_format({with_text = false, maxwidth = 50})
    }
})

vim.cmd [[highlight! default link CmpItemKind CmpItemMenuDefault]]

local status, lspkind = pcall(require, "lspkind")
if (not status) then return end

lspkind.init({
    -- enables text annotations
    --
    -- default: true
    mode = 'symbol',

    -- default symbol map
    -- can be either 'default' (requires nerd-fonts font) or
    -- 'codicons' for codicon preset (requires vscode-codicons font)
    --
    -- default: 'default'
    preset = 'codicons',

    -- override preset symbols
    --
    -- default: {}
    symbol_map = {
        Text = "",
        Method = "",
        Function = "",
        Constructor = "",
        Field = "ﰠ",
        Variable = "",
        Class = "ﴯ",
        Interface = "",
        Module = "",
        Property = "ﰠ",
        Unit = "塞",
        Value = "",
        Enum = "",
        Keyword = "",
        Snippet = "",
        Color = "",
        File = "",
        Reference = "",
        Folder = "",
        EnumMember = "",
        Constant = "",
        Struct = "פּ",
        Event = "",
        Operator = "",
        TypeParameter = ""
    },
})

local saga = require 'lspsaga'

saga.init_lsp_saga {
    error_sign = '',
    warn_sign = '',
    hint_sign = '',
    infor_sign = '',
    border_style = "round",
    code_action_prompt = {
        enable = false
    }
}

require('lualine').setup {
    options = {
        icons_enabled = true,
        -- theme = 'solarized_dark',
        section_separators = {left = '', right = ''},
        component_separators = {left = '', right = ''},
        disabled_filetypes = {}
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff'},
        lualine_c = {{
            'filename',
            file_status = true, -- displays file status (readonly status, modified status)
            path = 0 -- 0 = just filename, 1 = relative path, 2 = absolute path
        }},
        lualine_x = {
            { 'diagnostics', sources = {"nvim_diagnostic"}, symbols = {error = ' ', warn = ' ', info = ' ', hint = ' '} },
            'encoding',
            'filetype'
        },
        lualine_y = {'progress'},
        lualine_z = {'location'}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {{
            'filename',
            file_status = true, -- displays file status (readonly status, modified status)
            path = 1 -- 0 = just filename, 1 = relative path, 2 = absolute path
        }},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    extensions = {'fugitive'}
}


local telescope = require('telescope')
local actions = require('telescope.actions')

telescope.setup{
    defaults = {
        mappings = {
            n = {
                ["q"] = actions.close
            },
        },
    }
}

require'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true,
        disable = {},
    },
    indent = {
        enable = true,
        disable = {},
    },
    ensure_installed = {
        "tsx",
        "toml",
        "fish",
        "php",
        "json",
        "yaml",
        "swift",
        "rust",
        "html",
        "scss",
        "vue",
        "pug",
    },
    autotag = {
        enable = true,
    },
    rainbow = {
        enable = true,
        extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        max_file_lines = nil, -- Do not enable for files with more than n lines, int
        colors = {
            "#9ece6a",
            "#f7768e",
            "#7aa2f7",
            "#b4f9f8",
            "#9ece6a",
            "#f7768e",
            "#7aa2f7",
        },
        termcolors = {
            "green",
            "red",
            "blue",
            "lightblue",
            "green",
            "red",
            "blue",
        },
        disable = { "html", "php" },
    }
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }

require('onedark').setup {

    style = 'cool',
    term_colors = true,
    transparent = true,
    ending_tildes = false,
    code_style = {
        comments = 'italic',
        keywords = 'none',
        functions = 'italic',
        strings = 'none',
        variables = 'none'
    },
}

require('onedark').load()
