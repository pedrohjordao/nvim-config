local M = {}

function M.setup()
	local ts_config = require('nvim-treesitter.configs')
	ts_config.setup {
		highlight = {
			enable = true,
			use_languagetree = true
		},
		ident = {
			enable = true
		}
	}
	local install = require('nvim-treesitter.install')
	install.compilers = { 'clang' }
end

return M
