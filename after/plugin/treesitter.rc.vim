if !exists('g:loaded_nvim_treesitter')
  echom "Not loaded treesitter"
  finish
endif

lua <<EOF
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
EOF
