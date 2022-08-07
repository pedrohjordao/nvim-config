local M = {}

function M.setup()
	require'nvim-tree'.setup {
		renderer = {
			group_empty = true
		}
	}
	local wk = require('which-key')
	wk.register({
		['<leader>'] = {
			n = { ':NvimTreeToggle<CR>', 'Toggle File Browser' }
		}
	})
end

return M
