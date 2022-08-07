local M = {}

function M.setup()
	vim.cmd [[
		noremap <silent> <c-a>h :TmuxNavigateLeft<cr>
		noremap <silent> <c-a>j :TmuxNavigateDown<cr>
		noremap <silent> <c-a>k :TmuxNavigateUp<cr>
		noremap <silent> <c-a>l :TmuxNavigateRight<cr>
	]]
end

return M
