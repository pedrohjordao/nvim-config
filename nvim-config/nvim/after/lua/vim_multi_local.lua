local M = {}

function M.setup()
	vim.cmd("let g:VM_leader = '<leader><leader>'")
	vim.cmd("let g:VM_default_mapping = 1")
end

return M
