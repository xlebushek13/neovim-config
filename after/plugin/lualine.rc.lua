local status, lualine = pcall(require, "lualine")
if (not status) then return end

lualine.setup {
    options = {
        icons_enabled = true,
        theme = 'catppuccin',
    },
    extensions = { 'fugitive' },
    sections = {
        lualine_c = {
            'lsp_progress'
        }
    }
}
