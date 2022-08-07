local M = {}

function M.setup()
	local ls = require("luasnip")
	local types = require("luasnip.util.types")

	--ls.config.set_config({
	--	history = true,
	--	updateevents = "TextChanged,TextChangedI",
	--	enable_autosnippets = true,
	--	ext_opts = {
	--		[types.choiceNode] = {
	--			active = {
	--				virt_text = { { "←", "Error" } },
	--			},
	--		},
	--	},
	--})

	--vim.keymap.set({ "i", "s" }, "<c-k>", function()
	--	if ls.expand_or_jumpable() then
	--		ls.expand_or_jump()
	--	end
	--end, { silent = true })
	--vim.keymap.set({ "i", "s" }, "<c-l>", function()
	--	if ls.jumpable(-1) then
	--		ls.jump(-1)
	--	end
	--end, { silent = true })
	--vim.keymap.set({ "i", "s" }, "<c-;>", function()
	--	if ls.choice_active() then
	--		ls.change_choice(1)
	--	end
	--end, { silent = true })

	--vim.keymap.set("n", "<leader><leader>s", "<cmd>source ~/.config/nvim/after/lua/luasnip_samples.lua<CR>")
	--vim.cmd("source ~/.config/nvim/after/lua/luasnip_samples.lua")
end
return M
