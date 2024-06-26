vim.cmd("autocmd!")
vim.opt.updatetime = 300
vim.opt.undofile = true
-- vim.opt.undodir = "/home/kitsune/.vimundo"
vim.opt.syntax = "enable"
vim.opt.mouse = "a"
vim.opt.smartindent = true
vim.opt.swapfile = false
vim.opt.autoread = true
vim.opt.binary = true
vim.opt.lazyredraw = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.title = true
vim.opt.autoindent = true
vim.opt.hlsearch = true
vim.opt.backup = false
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 2
vim.opt.expandtab = true
vim.opt.scrolloff = 10
vim.opt.shell = 'zsh'
vim.opt.backupskip = { '/tmp/*', '/private/tmp/*' }
vim.opt.inccommand = 'split'
vim.opt.ignorecase = true -- Case insensitive searching UNLESS /C or capital in search
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.wrap = false         -- No Wrap lines
vim.opt.backspace = { 'start', 'eol', 'indent' }
vim.opt.path:append { '**' } -- Finding files - Search down into subfolders
vim.opt.wildignore:append { '*/node_modules/*' }
vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

-- vim.wo.number = true
vim.wo.relativenumber = true

vim.g.XkbSwitchLib = '/usr/lib/libxkbswitch.so'
vim.g.XkbSwitchEnabled = 1
vim.g.indentLine_setColors = 0
-- vim.g.indentLine_char = '|'

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])
-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
    pattern = '*',
    command = "set nopaste"
})
-- Add asterisks in block comments
vim.opt.formatoptions:append { 'r' }
vim.opt.clipboard:append { 'unnamedplus' }

-- if vim.g.neovide then
-- end
vim.o.guifont = "MesloLGS NF:h8"
vim.g.neovide_scale_factor = 1.0
vim.g.neovide_no_idle = true
vim.g.neovide_remember_window_size = false
vim.g.neovide_input_use_logo = false
vim.g.neovide_cursor_animation_length = 0
vim.deprecate = function() end

vim.cmd([[
autocmd!
set t_BE=
set nobackup
set backupskip=/tmp/*,/private/tmp/*
if has('nvim')
    set inccommand=split
    endif
    set nosc noru nosm
    set nosplitright
    set smarttab
    set nocompatible
    set si
    set autoread
    filetype plugin indent on
    set backspace=start,eol,indent
    set path+=**
    set wildignore+=*/node_modules/*
    set formatoptions+=r

    highlight Visual cterm=NONE ctermbg=236 ctermfg=NONE guibg=LightBlue
    highlight LineNr cterm=none ctermfg=240 guifg=#2b506e guibg=#000000
    set t_Co=256

    augroup BgHighlight
    autocmd!
    autocmd WinEnter * set cul
    autocmd WinLeave * set nocul
    augroup END

    if &term =~ "screen"
        autocmd BufEnter * if bufname("") !~ "^?[A-Za-z0-9?]*://" | silent! exe '!echo -n "\ek[`hostname`:`basename $PWD`/`basename %`]\e\\"' | endif
        autocmd VimLeave * silent!  exe '!echo -n "\ek[`hostname`:`basename $PWD`]\e\\"'
        endif


au InsertLeave * let lastLangIndex=system('swaymsg -t get_inputs | grep -m1 "xkb_active_layout_index" | grep -oP "\d+"') | call jobstart('swaymsg input "* xkb_switch_layout 0"')
au InsertEnter * :if exists("lastLangIndex") | call jobstart('swaymsg input "* xkb_switch_layout ' . lastLangIndex . '"') | endif

        autocmd InsertLeave * set nopaste
        au BufNewFile,BufRead *.es6 setf javascript
        au BufNewFile,BufRead *.tsx setf typescriptreact
        au BufNewFile,BufRead *.md set filetype=markdown
        au BufNewFile,BufRead *.mdx set filetype=markdown
        au BufNewFile,BufRead *.flow set filetype=javascript
        au BufNewFile,BufRead *.fish set filetype=fish

        set suffixesadd=.js,.es,.jsx,.json,.css,.less,.sass,.styl,.php,.py,.md

        autocmd FileType yaml setlocal shiftwidth=4 tabstop=4


        au BufWinEnter *.vue set shiftwidth=2
        au BufWinEnter *.ts set shiftwidth=4
        au BufWinEnter *.tsx set shiftwidth=4

        set exrc

        let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]

        cnoreabbrev g Git
        cnoreabbrev gopen GBrowse
        set clipboard+=unnamedplus

        set updatetime=300
        autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])
