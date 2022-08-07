return require("packer").startup(function(use)
	-- My plugins here
	use({
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	})
end)
