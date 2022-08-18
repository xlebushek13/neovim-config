local status, luasnip = pcall(require, "luasnip.loaders.from_vscode")
if (not status) then return end

luasnip.lazy_load()
