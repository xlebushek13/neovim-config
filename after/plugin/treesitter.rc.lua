local status, ts = pcall(require, "nvim-treesitter.configs")
local rainbow = require('ts-rainbow')
if (not status) then return end

ts.setup {
    highlight = {
        enable = true,
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
        "typescript"
    },
    autotag = {
        enable = true,
    },
    rainbow = {
        enable = true,
        extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        max_file_lines = nil, -- Do not enable for files with more than n lines, int
        query = {
            'rainbow-parens'
        },
        strategy = rainbow.strategy.global,
        colors = {
            "#9ece6a",
            "#f7768e",
            "#7aa2f7",
            "#b4f9f8",
            "#9ece6a",
            "#f7768e",
            "#7aa2f7",
        },

        hlgroups = {
            'TSRainbowGrey',
            'TSRainbowCyan',
            'TSRainbowYellow',
            'TSRainbowBlue',
            'TSRainbowOrange',
            'TSRainbowGreen',
            'TSRainbowViolet',
        },
        disable = { "html", "php" },
    }
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
