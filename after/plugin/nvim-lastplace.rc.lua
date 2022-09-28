local status, nvim_lastplace = pcall(require, "nvim-lastplace")
if (not status) then return end

nvim_lastplace.setup({})
