" Fundamentals "{{{
" ---------------------------------------------------------------------

" init autocmd
autocmd!
" set script encoding
scriptencoding utf-8
" stop loading config if it's on tiny or small
if !1 | finish | endif

" let mapleader="\<Space>"
set nosplitright
set nocompatible
set number
set undofile
set undodir=/Users/xlebushek/.vimundo
syntax enable
set fileencodings=utf-8,sjis,euc-jp,latin
set encoding=utf-8
set title
set mouse=a
set autoindent
set background=dark
set nobackup
set hlsearch
set showcmd
set cmdheight=1
set laststatus=2
set scrolloff=10
set noeol
set binary
" set fileformats+=dos
set expandtab
"let loaded_matchparen = 1
set shell=zsh
set backupskip=/tmp/*,/private/tmp/*

" incremental substitution (neovim)
if has('nvim')
    set inccommand=split
endif

" Suppress appending <PasteStart> and <PasteEnd> when pasting
set t_BE=

set nosc noru nosm
" Don't redraw while executing macros (good performance config)
set lazyredraw
"set showmatch
" How many tenths of a second to blink when matching brackets
"set mat=2
" Ignore case when searching
set ignorecase
" Be smart when using tabs ;)
set smarttab
" indents
filetype plugin indent on
set shiftwidth=4
set tabstop=4 
set ai "Auto indent
set si "Smart indent
set nowrap "No Wrap lines
set backspace=start,eol,indent
" Finding files - Search down into subfolders
set path+=**
set wildignore+=*/node_modules/*

" Turn off paste mode when leaving insert
autocmd InsertLeave * set nopaste

" Add asterisks in block comments
set formatoptions+=r

"}}}

" Highlights "{{{
" ---------------------------------------------------------------------
set cursorline
"set cursorcolumn

" Set cursor line color on visual mode
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

"}}}

" File types "{{{
" ---------------------------------------------------------------------
" JavaScript
au BufNewFile,BufRead *.es6 setf javascript
" TypeScript
au BufNewFile,BufRead *.tsx setf typescriptreact
" Markdown
au BufNewFile,BufRead *.md set filetype=markdown
au BufNewFile,BufRead *.mdx set filetype=markdown
" Flow
au BufNewFile,BufRead *.flow set filetype=javascript
" Fish
au BufNewFile,BufRead *.fish set filetype=fish

autocmd BufWritePost * GitGutter

set suffixesadd=.js,.es,.jsx,.json,.css,.less,.sass,.styl,.php,.py,.md

autocmd FileType coffee setlocal shiftwidth=2 tabstop=2
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2


au BufWinEnter *.json :IndentLinesToggle
" au BufWinEnter Cargo.toml :CratesToggle
au BufWinEnter *.vue set shiftwidth=4 
au BufWinEnter *.ts set shiftwidth=4 
"}}}

" Imports "{{{
" ---------------------------------------------------------------------
runtime ./plug.vim
if has("unix")
    let s:uname = system("uname -s")
    " Do Mac stuff
    if s:uname == "Darwin\n"
        runtime ./macos.vim
    endif
endif
if has('win32')
    runtime ./windows.vim
endif

runtime ./maps.vim
"}}}

" Syntax theme "{{{
" ---------------------------------------------------------------------

" true color
if exists("&termguicolors") && exists("&winblend")
    syntax enable
    set termguicolors
    set winblend=0
    set wildoptions=pum
    set pumblend=5
    set background=dark
endif


"}}}

" Extras "{{{
" ---------------------------------------------------------------------
set exrc
"}}}

" Git gutter settings

let g:gitgutter_async=0
let g:gitgutter_max_signs = 2000

" vim: set foldmethod=marker foldlevel=0:

let g:XkbSwitchLib = '/usr/local/bin/libInputSourceSwitcher.dylib'
let g:XkbSwitchEnabled = 1

let g:indentLine_char = '│'

set signcolumn=yes

let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]

" Confing for ToggleTerm

lua << EOF

require("toggleterm").setup {
    direction = 'float'
}

EOF

" Config for onedark theme

lua << EOF

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

require('onedark').load()

EOF

" Config for lualine

lua << EOF

require('lualine').setup {
  options = {
    theme = 'onedark'
  }
}

EOF

" Config for rust-tools and rust lsp server

lua << EOF

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

EOF

" Init Autosave

lua << EOF

require("autosave").setup()

EOF

" Init Lastplace plugin => His save the last place of your cursor

lua << EOF

require ('nvim-lastplace').setup()

EOF

" Init todo highlight plugin: Example TODO:

lua << EOF

require("todo-comments").setup()

EOF

" Config colorizer plugin => His highlight colors like rgb(255, 255 ,255)

lua << EOF

require("colorizer").setup({ "*" }, {
    RGB = true, -- #RGB hex codes
    RRGGBB = true, -- #RRGGBB hex codes
    RRGGBBAA = true, -- #RRGGBBAA hex codes
    rgb_fn = true, -- CSS rgb() and rgba() functions
    hsl_fn = true, -- CSS hsl() and hsla() functions
    css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
    css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
})

EOF

" Use Telescope plugin

lua << EOF

vim.cmd [[packadd telescope.nvim]]

EOF

" Init Plugin for Comemnts

lua << EOF

require('Comment').setup()

EOF

" Nvim tree config

lua << EOF

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

EOF

" Which key config

lua << EOF

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
EOF

lua << EOF
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

EOF

" Init Autopairs plugin

lua << EOF

require("nvim-autopairs").setup {}

EOF

" Init Tabnine plugin for cmp

lua << EOF

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

EOF

" Init Plugin for rust crates

lua << EOF

require('crates').setup()

EOF