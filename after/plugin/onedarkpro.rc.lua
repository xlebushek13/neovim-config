local status, onedark = pcall(require, "onedarkpro")
if (not status) then return end

onedark.setup {
    colors = {
        onedark = {
            bg = "#1E222A" -- yellow
        },
    },
    -- The theme function can be overwritten with a string value for the theme
    plugins = { -- Override which plugins highlight groups are loaded
        -- NOTE: Plugins have been omitted for brevity - Please see the plugins section of the README
    },
    styles = { -- Choose from "bold,italic,underline"
        strings = "NONE", -- Style that is applied to strings.
        comments = "italic", -- Style that is applied to comments
        keywords = "NONE", -- Style that is applied to keywords
        functions = "NONE", -- Style that is applied to functions
        variables = "NONE", -- Style that is applied to variables
        virtual_text = "NONE", -- Style that is applied to virtual text
    },
    options = {
        bold = true, -- Use the themes opinionated bold styles?
        italic = true, -- Use the themes opinionated italic styles?
        underline = true, -- Use the themes opinionated underline styles?
        undercurl = true, -- Use the themes opinionated undercurl styles?
        cursorline = true, -- Use cursorline highlighting?
        transparency = false, -- Use a transparent background?
        terminal_colors = false, -- Use the theme's colors for Neovim's :terminal?
        window_unfocused_color = false, -- When the window is out of focus, change the normal background?
    }

}

vim.cmd("colorscheme catppuccin")
