local status, nvim_tree = pcall(require, "nvim-tree")
if (not status) then return end

local function my_on_attach(bufnr)
    local api = require "nvim-tree.api"

    local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    -- default mappings
    api.config.mappings.default_on_attach(bufnr)

    -- custom mappings
   vim.keymap.del('n', 's', { buffer = bufnr })
end


nvim_tree.setup({

    on_attach = my_on_attach,
    auto_reload_on_write = true,
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
        adaptive_size = true,
        signcolumn = "yes",
    },

    trash = {
        cmd = "trash",
        require_confirm = true,
    },
})
