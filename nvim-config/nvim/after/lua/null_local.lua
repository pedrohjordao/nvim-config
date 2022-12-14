local M = {}

function M.setup()
	local null_ls = require("null-ls")
	null_ls.setup({
		sources = {
			-- Shell
			null_ls.builtins.formatting.shfmt,
			null_ls.builtins.formatting.shellharden,
			null_ls.builtins.diagnostics.shellcheck,
			null_ls.builtins.code_actions.shellcheck,

			-- JS yaml html markdown
			null_ls.builtins.formatting.prettier,
			null_ls.builtins.diagnostics.yamllint,
			null_ls.builtins.diagnostics.markdownlint,

			-- C/C++
			null_ls.builtins.diagnostics.cppcheck,

			-- Lua
			null_ls.builtins.diagnostics.selene,
			null_ls.builtins.formatting.stylua,

			-- Spell checking
			null_ls.builtins.diagnostics.codespell.with({
				args = { "--builtin", "clear,rare,code", "-" },
			}),

			-- Nix
			null_ls.builtins.diagnostics.statix,
			null_ls.builtins.code_actions.statix,

			-- Git
			null_ls.builtins.code_actions.gitsigns,
		},
	})
end

return M
