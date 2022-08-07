local M = {}

function M.setup()
	require('trouble').setup {}
	local wk = require('which-key')
	wk.register({
		['<leader>'] = {
			name = '+Trouble',
			x = { "<cmd>Trouble<cr>", 'Trouble' },
			w = { "<cmd>Trouble workspace_diagnostics<cr>", 'Workspace Diagnostics'},
			d = { "<cmd>Trouble document_diagnostics<cr>", 'Document Diagnostics'},
			l = { "<cmd>Trouble loclist<cr>", "loclist"},
			q = { "<cmd>Trouble quickfix<cr>", "Quickfix"}
		}
	})

	vim.api.nvim_set_keymap("n", "gR", "<cmd>Trouble lsp_references<cr>",
	  {silent = true, noremap = true}
	)
end

return M
