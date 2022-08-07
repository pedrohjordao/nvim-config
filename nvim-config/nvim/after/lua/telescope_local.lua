local M = {}

function M.setup()
	local wk = require("which-key")
	wk.register({
		['<leader>'] = {
			f = {
				name = '+Telescope',
				f = {[[<Cmd>lua require('telescope.builtin').find_files()<CR>]], 'Find File'},
				b = {[[<Cmd>lua require('telescope.builtin').buffers()<CR>]], 'Buffers'},
				h = {[[<Cmd>lua require('telescope.builtin').help_tags()<CR>]], 'Help Tags'},
				g = {[[<Cmd>lua require('telescope.builtin').live_grep()<CR>]], 'Grep'},
				c = {[[<Cmd>lua require('telescope.builtin').commands()<CR>]], 'Commands'},
				q = {[[<Cmd>lua require('telescope.builtin').quickfix()<CR>]], 'Quickfix'},
				l = {[[<Cmd>lua require('telescope.builtin').loclist()<CR>]], 'Loclist'},
				r = {[[<Cmd>lua require('telescope.builtin').registers()<CR>]], 'Registers'},
				k = {[[<Cmd>lua require('telescope.builtin').keymaps()<CR>]], 'Keymaps'},
			},
			g = {
					c = { [[<Cmd>lua require('telescope.builtin').git_commits()<CR>]], 'Commits' },
					B = { [[<Cmd>lua require('telescope.builtin').git_branches()<CR>]], "Branches" }
			}
		},
	})
end

return M
