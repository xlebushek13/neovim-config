local status, onedark = pcall(require, "onedark")
if (not status) then return end

onedark.setup({
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
})

onedark.load()
