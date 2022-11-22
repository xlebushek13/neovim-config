local status, rust_tools = pcall(require, "rust-tools")
if (not status) then return end

rust_tools.setup({
    tools = {
        autoSetHints = true,
        runnables = {
            use_telescope = true,
        },
        hover_actions = {
            auto_focus = false
        },
    },
    server = {
        cmd = { vim.fn.stdpath "data" .. "/mason/packages/rust-analyzer/rust-analyzer" },

        ["rust-analyzer"] = {
            -- enable clippy on save
            checkOnSave = {
                command = "clippy"
            },
        }
    },
})
