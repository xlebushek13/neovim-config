local status, autopairs = pcall(require, "nvim-autopairs")
if (not status) then return end
local status, Rule = pcall(require, 'nvim-autopairs.rule')
if (not status) then return end

autopairs.setup({
    disable_filetype = { "TelescopePrompt", "vim" },
})
