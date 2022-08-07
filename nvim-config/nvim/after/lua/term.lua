local cmd = vim.cmd
local g = vim.g

cmd('set listchars=tab:›\\ ,trail:•,extends:#,nbsp:.,space:-')
cmd('set matchpairs+=<:>')
cmd('set hls is')
cmd('set pumheight=10')

cmd('autocmd FileType gitcommit setlocal spell')
cmd('autocmd FileType markdown setlocal spell')
cmd('autocmd BufNewFile,BufRead Jenkinsfile set syntax=groovy')
cmd('au BufRead,BufNewFile *.sbt,*.sc set filetype=scala')
cmd('command ExecSh set splitright | vnew | set filetype=sh | read !sh #')
cmd('command ExecAmm set splitright | vnew | set filetype=sh | read !amm #')

-- highlights
cmd('hi LineNr guibg=NONE')
cmd('hi SignColumn guibg=NONE')
cmd('hi VertSplit guibg=NONE')
cmd('highlight DiffAdd guifg=#8ec07c guibg = none')
cmd('highlight DiffChange guifg =#81A1C1 guibg = none')
cmd('highlight DiffModified guifg = #83a698 guibg = none')
cmd('hi EndOfBuffer guifg=#282c34')

cmd('set shortmess-=F')

