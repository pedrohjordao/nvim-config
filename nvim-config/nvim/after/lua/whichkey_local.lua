local M = {}

function M.setup()
	local whichkey = require('which-key')
	whichkey.setup({
		plugins = {
			spelling = {
				enabled = true
			}
		}
	})
end

return M
