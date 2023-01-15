-- DESCRIPTION: Mappings

vim.cmd('nnoremap <S-C-p> "0p')
-- Delete without yank

vim.cmd('nnoremap <leader>d "_d')
vim.cmd('nnoremap x "_x')

-- Increment/decrement

vim.cmd('nnoremap + <C-a>')
vim.cmd('nnoremap - <C-x>')

-- Delete a word backwards

vim.cmd('nnoremap dw vb"_di')

-- Select all

vim.cmd('nmap <C-a> gg<S-v>G')

-- Save with root permission

vim.cmd('command! W w !sudo tee > /dev/null %')

-- Search for selected text, forwards or backwards.

vim.cmd([[
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
]])

-- Tabs

-- Open current directory

vim.cmd('nmap te :tabedit')
vim.cmd('nmap <S-Tab> :bprev<Return>')
vim.cmd('nmap <Tab> :bnext<Return>')

-- Windows

-- Move window

vim.cmd('map s<left> <C-w>h')
vim.cmd('map s<up> <C-w>k')
vim.cmd('map s<down> <C-w>j')
vim.cmd('map s<right> <C-w>l')
vim.cmd('map sh <C-w>h')
vim.cmd('map sk <C-w>k')
vim.cmd('map sj <C-w>j')
vim.cmd('map sl <C-w>l')

-- Resize window

vim.cmd('nmap <C-w><left> <C-w><')
vim.cmd('nmap <C-w><right> <C-w>>')
vim.cmd('nmap <C-w><up> <C-w>+')
vim.cmd('nmap <C-w><down> <C-w>-')

-- Sneak

vim.cmd('map f <Plug>Sneak_s')
vim.cmd('map F <Plug>Sneak_S')
vim.cmd('let g:sneak#label = 1')

-- Vim wiki keybinding

vim.cmd('map sww :VimwikiIndex<CR>')

-- Disable highlight find text by press ESC

vim.cmd('map <esc> :noh<CR>')

-- Surround keybindings

vim.cmd('vmap s" c""<ESC>P')
vim.cmd("vmap s' c''<ESC>P")
vim.cmd('vmap s( c()<ESC>P')
vim.cmd('vmap s{ c{}<ESC>P')
vim.cmd('vmap s[ c[]<ESC>P')
vim.cmd('vmap s< c<><ESC>P')
vim.cmd('nmap s" ^v$<left>c""<ESC>P')
vim.cmd("nmap s' ^v$<left>c''<ESC>P")
vim.cmd('nmap s( ^v$<left>c()<ESC>P')
vim.cmd('nmap s{ ^v$<left>c{}<ESC>P')
vim.cmd('nmap s[ ^v$<left>c[]<ESC>P')
vim.cmd('nmap s< ^v$<left>c<><ESC>P')

-- Delete inside parents etc

vim.cmd('nmap dp ci)')
vim.cmd('nmap dq ci"')
vim.cmd("nmap dQ ci'")

-- Git keybindings

vim.cmd('nmap <Space>gd :GitDiff<CR>')
vim.cmd('nmap <Space>gg :LazyGit<CR>')
vim.cmd('nmap <Space>gc :GitConflictListQf<CR>')
vim.cmd('nmap <Space>gu :Gitsigns reset_hunk<CR>')
vim.cmd('nmap <Space>gp :Gitsigns preview_hunk<CR>')
vim.cmd('nmap <Space>gn :Gitsigns next_hunk<CR>')

-- Ease find and replace keybinding


vim.cmd('nnoremap sa :edit<CR>')

-- Add ending for lines in visual mode keybinding like ; in end of line

vim.cmd('vmap A :normal A')

-- Resize window keybindings

vim.cmd('nmap swl :vertical resize +10<CR>')
vim.cmd('nmap swh :vertical resize -10<CR>')
vim.cmd('nmap swk :resize +10<CR>')
vim.cmd('nmap swj :resize -10<CR>')

-- Remove and paste without copy to buffer

vim.cmd('vnoremap p "_dP')

-- Insert current date keybinding

vim.cmd('nmap sD i<C-R>=strftime("%Y-%m-%d %a %H:%M")<CR><Esc>')

-- Run python file

vim.cmd('nmap spP :!python3 %<CR>')

-- Terminal bindings

vim.cmd('nmap <c-t> :ToggleTerm<CR>')
vim.cmd('tnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>')
vim.cmd('tnoremap <Esc> <C-\\><C-n> ')

-- Rust keybindings

vim.cmd('nmap srr <Cmd>execute v:count . "ToggleTerm"<CR> cargo run<CR>')
vim.cmd('nmap sru :CratesUp<CR>')
vim.cmd('nmap srb <Cmd>execute v:count . "ToggleTerm"<CR> cargo build<CR>')
vim.cmd('nmap srt <Cmd>execute v:count . "ToggleTerm"<CR> cargo test<CR>')
vim.cmd('nmap src <Cmd>execute v:count . "ToggleTerm"<CR> cargo check<CR>')
vim.cmd('nmap sd :RustHoverActions<CR>')
vim.cmd('nmap sR :RustRunnables<CR>')
vim.cmd('nmap sc :RustOpenCargo<CR>')

vim.cmd('nmap <Space>u :UndotreeToggle<CR>')
-- NvimTreeToggle keybinding

vim.cmd('nmap <Space>e :NvimTreeToggle<CR>')

-- Search and replace keybinding

vim.cmd('nmap sF :%s/')

-- Markdown preview keybindings

vim.cmd('nmap smg :Glow<CR>')
vim.cmd('nmap smp :MarkdownPreview<CR>')

-- Buffers edit

vim.cmd('nmap to :tabo<CR>')
vim.cmd('nmap te :tabedit ')
vim.cmd('nmap tp :bprev<CR> ')
vim.cmd('nmap tn :bnext<CR> ')
vim.cmd('nmap st :BufferLinePick<CR>')

-- Show todo list

vim.cmd('nmap td :TodoLocList<CR>')

-- Split windows

vim.cmd('nmap ss :split<Return><leader>w')
vim.cmd('nmap sv :vsplit<Return><leader>w')

-- Move windov

vim.cmd('nmap <Space><C-w>w')
vim.cmd('map s<left> <C-w>h')
vim.cmd('map s<up> <C-w>k')
vim.cmd('map s<down> <C-w>j')
vim.cmd('map s<right> <C-w>l')
vim.cmd('map sh <C-w>h')
vim.cmd('map sk <C-w>k')
vim.cmd('map sj <C-w>j')
vim.cmd('map sl <C-w>l')

-- Dont Leave from visual after indent
vim.cmd("vnoremap > >gv")
vim.cmd("vnoremap < <gv")

-- fzf find keybinding

vim.cmd('noremap <silent>sff <Cmd>Telescope live_grep<CR>')

-- keybindig for view img in Terminal need imgact installed

vim.cmd('nmap si :TermExec cmd="imgcat <cfile>"<CR>')
vim.cmd('vnoremap si y<Esc>:TermExec cmd="imgcat <C-R>""<CR>')

-- Sneak conf

vim.cmd('map f <Plug>Sneak_s')
vim.cmd('map F <Plug>Sneak_S')
vim.cmd('let g:sneak#label = 1')

-- Folding

vim.cmd('map <Space>f zfit')
vim.cmd('map so za')

-- Select all

vim.cmd('vmap <C-a> vgg<S-v>G')

-- Open projects

vim.cmd("nmap spp :lua require'telescope'.extensions.project.project{}<CR>")

-- Lspaga mappings like go to definition

vim.cmd('nnoremap <silent> <C-j> <Cmd>Lspsaga diagnostic_jump_next<CR>')
vim.cmd('nnoremap <silent>K <Cmd>Lspsaga hover_doc<CR>')
vim.cmd('inoremap <silent> <C-k> <Cmd>Lspsaga signature_help<CR>')
vim.cmd('nnoremap <silent> gd <Cmd>lua vim.lsp.buf.definition()<CR>')
vim.cmd('nnoremap <silent> gp <Cmd>Lspsaga preview_definition<CR>')
vim.cmd('nnoremap <silent> gR <Cmd>Lspsaga rename<CR>')
vim.cmd('nnoremap <silent> gr <Cmd>lua vim.lsp.buf.references()<CR>')

-- Buffer next for vimwiki files (because <TAB> not working in they)

vim.cmd('nmap sb :bnext<CR>')
