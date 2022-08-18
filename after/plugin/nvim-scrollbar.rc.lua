local status, nvim_scrollbar = pcall(require, "scrollbar")
if (not status) then return end

nvim_scrollbar.setup({})
