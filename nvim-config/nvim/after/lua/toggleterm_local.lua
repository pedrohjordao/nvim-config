local M = {}

function M.setup()
	require("toggleterm").setup()
	local wk = require("which-key")
	wk.register({
		["<leader>"] = {
			T = { ":ToggleTerm<CR>", "Terminal" },
		},
	}, { mode = "n" })
end

return M
