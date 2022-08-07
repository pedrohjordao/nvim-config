set packpath^=/nix/store/x70k410gsj1dqjgz1gjs4x9wmrpa5wh3-vim-pack-dir
set runtimepath^=/nix/store/x70k410gsj1dqjgz1gjs4x9wmrpa5wh3-vim-pack-dir

" luasnip {{{
lua require('luasnips_local').setup()

" }}}
" octo.nvim {{{
lua require('octo').setup()

" }}}
" dressing.nvim {{{
lua require('dressing').setup()

" }}}
" gruvbox {{{
lua vim.cmd('colorscheme gruvbox')

" }}}
" nvim-notify {{{
lua require('notify_local').setup()

" }}}
" nvim-treesitter {{{
lua require('treesitter_local').setup()

" }}}
" nvim-tree.lua {{{
lua require('tree_local').setup()

" }}}
" nvim-cmp {{{
lua require('cmp_local').setup()

" }}}
" nvim-lspconfig {{{
lua require('lsp_local').setup()

" }}}
" gitsigns.nvim {{{
lua require('gitsigns_local').setup()

" }}}
" vim-fugitive {{{
lua require('fugitive_local').setup()

" }}}
" comment.nvim {{{
lua require('Comment').setup()

" }}}
" telescope.nvim {{{
lua require('telescope_local').setup()

" }}}
" trouble.nvim {{{
lua require('trouble_local').setup()

" }}}
" nvim-autopairs {{{
lua require('nvim-autopairs').setup()

" }}}
" nvim-lightbulb {{{
lua require('lightbulb_local').setup()

" }}}
" lsp_signature.nvim {{{
lua require('lsp_signature').setup()

" }}}
" wilder.nvim {{{
lua require('wilder_local').setup()

" }}}
" fidget.nvim {{{
lua require('fidget').setup()

" }}}
" toggleterm.nvim {{{
lua require('toggleterm_local').setup()

" }}}
" lualine.nvim {{{
lua require('lualine_local').setup()

" }}}
" null-ls.nvim {{{
lua require('null_local').setup()

" }}}
" indent-blankline.nvim {{{
lua require('blankline_local').setup()

" }}}
" auto-session {{{
lua require('auto-session').setup()

" }}}
" which-key.nvim {{{
lua require('whichkey_local').setup()

" }}}
" diffview.nvim {{{
lua require("diffview_local").setup()

" }}}
" vim-test {{{
lua require("test_local").setup()

" }}}
" nvim-dap {{{
lua require("dap_local").setup()

" }}}
" nvim-dap-virtual-text {{{
lua require("nvim-dap-virtual-text").setup()

" }}}
" packer.nvim {{{
augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end
lua require("plugins")

" }}}
" vim-tmux-navigator {{{
lua require("tmux_navigator_local").setup()

" }}}
" vim-visual-multi {{{
lua require("vim_multi_local").setup()

" }}}
lua require('setup').init()
lua vim.opt.termguicolors = true
