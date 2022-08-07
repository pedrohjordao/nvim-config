local M = {}

function M.setup()
	local wk = require("which-key")
	wk.register({
		["<leader>"] = {
			t = {
				name = "+Tests",
				t = { ":TestNearest<CR>", "Test Nearest" },
				T = { ":TestFile<CR>", "Test File" },
				a = { ":TestSuite<CR>", "Test Suite" },
				l = { ":TestLast<CR>", "Test Last" },
				g = { ":TestVisit<CR>", "Test Visist" },
			},
		},
	})
end

return M
