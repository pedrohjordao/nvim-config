local M = {}

function M.setup()
	vim.cmd("call wilder#setup({'modes': [':', '/', '?'], 'next_key': '<C-n>', 'previous_key': '<C-p>'})")
	vim.cmd("call wilder#set_option('renderer', wilder#popupmenu_renderer({'highlighter': wilder#basic_highlighter(), 'reverse': 0, 'left': [' ', wilder#popupmenu_devicons(), ], 'right': [' ', wilder#popupmenu_scrollbar(),], }))")
end

return M
