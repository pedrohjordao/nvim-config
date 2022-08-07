local M = {}

function M.setup()
	local wk = require("which-key")
	local lspconfig = require("lspconfig")
	wk.register({
		g = {
			D = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "Go to Declaration" },
			d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Go to Definition" },
			i = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "Go to Implementation" },
			r = { "<cmd>lua vim.lsp.buf.references()<CR>", "Go to references" },
		},
		K = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Documentation" },
		["<leader>"] = {
			w = {
				name = "+Worspace",
				a = { "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", "Add Workspace Folder" },
				r = { "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", "Remove Worspace Folder" },
				l = {
					"<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
					"List Workspace Folders",
				},
			},
			c = {
				name = "+Code Actions",
				a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code Action" },
			},
			s = {
				name = "+Symbols",
				o = { [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]], "Symbols" },
				r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename Symbol" },
				D = { "<cmd>lua vim.lsp.buf.type_definition()<CR>", "Type Definition" },
			},
			F = { ":Format<CR>", "Format" },
		},
		["C-k"] = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature Help" },
	})
	vim.cmd([[ command! Format execute 'lua vim.lsp.buf.format { async = true }' ]])

	-- nvim-cmp supports additional completion capabilities
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

	-- Enable the following language servers
	local servers = {
	    'clangd',
	    'bashls',
	    'cmake',
	    'dockerls',
	    'gopls',
	    'jdtls',
	    'jsonls',
	    'pyright',
	    'rust-analyzer',
	    'taplo',
	    'yamlls',
	    'zls',
	    'rnix',
	    'tsserver',
	    'pyright'
	}
	--local servers = { "pyright", "tsserver", "rnix", "rust-tools" }
	for _, lsp in ipairs(servers) do
		lspconfig[lsp].setup({
			capabilities = capabilities,
		})
	end

	-- lsps that need manual setup
	-- Scala
	vim.cmd([[augroup lsp]])
	vim.cmd([[au!]])
	vim.cmd([[au FileType java,scala,sbt lua require('metals').initialize_or_attach({})]])
	vim.cmd([[augroup end]])

	--other language tools
	require("clangd_extensions").setup()
	require("rust-tools").setup()

	-- Lua
	local runtime_path = vim.split(package.path, ";")
	table.insert(runtime_path, "lua/?.lua")
	table.insert(runtime_path, "lua/?/init.lua")

	lspconfig.sumneko_lua.setup({
		settings = {
			Lua = {
				runtime = {
					-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
					version = "LuaJIT",
					-- Setup your lua path
					path = runtime_path,
				},
				diagnostics = {
					-- Get the language server to recognize the `vim` global
					globals = { "vim" },
				},
				workspace = {
					-- Make the server aware of Neovim runtime files
					library = vim.api.nvim_get_runtime_file("", true),
				},
				-- Do not send telemetry data containing a randomized but unique identifier
				telemetry = {
					enable = false,
				},
			},
		},
	})
end

return M
