local M = {}

function M.setup()
	local gs = require("gitsigns")
	local wk = require("which-key")

	local next_hunk = function()
		if vim.wo.diff then
			return "]c"
		end
		vim.schedule(function()
			gs.next_hunk()
		end)
		return "<Ignore>"
	end
	local previous_hunk = function()
		if vim.wo.diff then
			return "[c"
		end
		vim.schedule(function()
			gs.prev_hunk()
		end)
		return "<Ignore>"
	end

	gs.setup()

	local function map(mode, l, r, opts)
		opts = opts or {}
		vim.keymap.set(mode, l, r, opts)
	end

	-- Navigation
	map("n", "]c", next_hunk, { expr = true })

	map("n", "[c", previous_hunk, { expr = true })

	-- Actions
	map({ "n", "v" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>")
	map({ "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>")
	map("n", "<leader>ghS", gs.stage_buffer)
	map("n", "<leader>ghu", gs.undo_stage_hunk)
	map("n", "<leader>ghR", gs.reset_buffer)
	map("n", "<leader>ghp", gs.preview_hunk)
	map("n", "<leader>gm", gs.toggle_current_line_blame)
	map("n", "<leader>ghd", gs.toggle_deleted)

	wk.register({
		["]c"] = { "Next Hunk" },
		["[c"] = { "Previous Hunk" },
	})

end

return M
