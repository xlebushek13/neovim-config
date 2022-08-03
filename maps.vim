" Description: Keymaps

nnoremap <S-C-p> "0p

" Delete without yank

nnoremap <leader>d "_d
nnoremap x "_x

" Increment/decrement

nnoremap + <C-a>
nnoremap - <C-x>

" Delete a word backwards

nnoremap dw vb"_di

" Select all

nmap <C-a> gg<S-v>G

" Save with root permission

command! W w !sudo tee > /dev/null %

" Search for selected text, forwards or backwards.

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

"""""""""""""""-
" Tabs

" Open current directory

nmap te :tabedit 
nmap <S-Tab> :bprev<Return>
nmap <Tab> :bnext<Return>

""""""""""""""""
" Windows

" Move window

map s<left> <C-w>h
map s<up> <C-w>k
map s<down> <C-w>j
map s<right> <C-w>l
map sh <C-w>h
map sk <C-w>k
map sj <C-w>j
map sl <C-w>l

" Resize window

nmap <C-w><left> <C-w><
nmap <C-w><right> <C-w>>
nmap <C-w><up> <C-w>+
nmap <C-w><down> <C-w>-

" Sneak 

map f <Plug>Sneak_s
map F <Plug>Sneak_S
let g:sneak#label = 1

" Vim wiki keybinding

map sww :VimwikiIndex<CR>

" Disable highlight find text by press ESC

map <esc> :noh<CR>

" Surround keybindings

vmap s" c""<ESC>P
vmap s' c''<ESC>P
vmap s( c()<ESC>P
vmap s{ c{}<ESC>P
vmap s[ c[]<ESC>P
vmap s< c<><ESC>P

nmap s" ^v$<left>c""<ESC>P
nmap s' ^v$<left>c''<ESC>P
nmap s( ^v$<left>c()<ESC>P
nmap s{ ^v$<left>c{}<ESC>P
nmap s[ ^v$<left>c[]<ESC>P
nmap s< ^v$<left>c<><ESC>P

" Delete inside parents etc

nmap dp ci)
nmap dq ci"
nmap dQ ci'

" Git keybindings

nmap <Space>gd :Git diff<CR>
nmap <Space>gg :LazyGit<CR>
nmap <Space>gu :GitGutterUndoHunk<CR>
nmap <Space>gp :GitGutterPreviewHunk<CR>
nmap <Space>gn :GitGutterNextHunk<CR>

" Ease find and replace keybinding

nnoremap sa viw:lua require'spectre'.open_file_search()<CR>

" Add ending for lines in visual mode keybinding like ; in end of line

vmap A :normal A

" Resize window keybindings

nmap swl :vertical resize +10<CR>
nmap swh :vertical resize -10<CR>

nmap swk :resize +10<CR>
nmap swj :resize -10<CR>

" Remove and paste without copy to buffer

vnoremap p "_dP

" Insert current date keybinding

nmap sD i<C-R>=strftime("%Y-%m-%d %a %H:%M")<CR><Esc>

" Run python file

nmap spP :!python3 %<CR>

" Terminal bindings

nmap <c-t> :ToggleTerm<CR>
tnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>

tnoremap <Esc> <C-\><C-n> 

" Rust keybindings

nmap srr <Cmd>execute v:count . "ToggleTerm"<CR> cargo run<CR>
nmap sru :CratesUp<CR>
nmap srb <Cmd>execute v:count . "ToggleTerm"<CR> cargo build<CR>
nmap srt <Cmd>execute v:count . "ToggleTerm"<CR> cargo test<CR>
nmap src <Cmd>execute v:count . "ToggleTerm"<CR> cargo check<CR>
nmap sd :RustHoverActions<CR>
nmap sR :RustRunnables<CR>
nmap sc :RustOpenCargo<CR>

" NvimTreeToggle keybinding

nmap <Space>e :NvimTreeToggle<CR>

" Search and replace keybinding

nmap sF :%s/

" Markdown preview keybindings

nmap smg :Glow<CR>
nmap smp :MarkdownPreview<CR>

" Buffers edit

nmap to :tabo<CR>
nmap te :tabedit 
nmap tp :bprev<CR> 
nmap tn :bnext<CR> 
nmap st :BufferLinePick<CR>

" Show todo list

nmap td :TodoLocList<CR>

" Split windows

nmap ss :split<Return><leader>w
nmap sv :vsplit<Return><leader>w

" Move windov

nmap <Space><C-w>w
map s<left> <C-w>h
map s<up> <C-w>k
map s<down> <C-w>j
map s<right> <C-w>l
map sh <C-w>h
map sk <C-w>k
map sj <C-w>j
map sl <C-w>l

" fzf find keybinding

noremap <silent>sff <Cmd>Telescope live_grep<CR>

" keybindig for view img in Terminal need imgact installed

nmap si :TermExec cmd="imgcat <cfile>"<CR>
vnoremap si y<Esc>:TermExec cmd="imgcat <C-R>""<CR>

" Sneak conf

map f <Plug>Sneak_s
map F <Plug>Sneak_S
let g:sneak#label = 1

" Folding

let g:indentLine_char = '│'

map sf zfit
map so za

" Select all

vmap <C-a> vgg<S-v>G

" Open projects

nmap spp :lua require'telescope'.extensions.project.project{}<CR>
