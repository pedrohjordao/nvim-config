local M = {}

function M.setup()
	local wk = require("which-key")
	wk.register({
		["<leader>"] = {
			g = {
				name = "+git",
				h = {
					name = "+Hunk",
					s = { "Stage Hunk" },
					r = { "Reset Hunk" },
					S = { "Stage Buffer" },
					u = { "Undo Stage Hunk" },
					R = { "Reset Buffer" },
					p = { "Preview Hunk" },
					d = { "Toggle deleted" },
				},
				v = { ":GV<cr>", "Commit Browser" },
				g = { ":G<cr>", "Git Status" },
				P = { ":G push -u origin HEAD<cr>", "Git Push" },
				f = { ":G push --force<cr>", "Force Push" },
				p = { ":G pull<cr>", "Git Pull" },
				l = { ":Gclog<cr>", "Git Log" },
				r = { ":Gread<cr>", "Git Read File" },
				R = { ":Grebase ", "Git Rebase" },
				b = { ":Git blame<cr>", "Git Blame" },
				w = { ":Gwrite<cr>", "Git Write File" },
				m = { "Blame Current Line" },
				d = { ":DiffviewOpen<cr>", "Diff index" },
				D = { ":DiffviewOpen origin/master...HEAD<cr>", "Diff master" },
				H = { ":DiffviewFileHistory<cr>", "File History"}
			},
		},
	})
end

return M
