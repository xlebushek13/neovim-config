local status, switch = pcall(require, "xkbswitch")
if (not status) then return end

switch.setup({})
