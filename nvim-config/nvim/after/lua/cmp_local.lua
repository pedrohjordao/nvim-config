local M = {}

function M.setup()
	local luasnip = require 'luasnip'
	local lspkind = require 'lspkind'
	local cmp = require 'cmp'
	cmp.setup {
	  formatting = {
	    format = lspkind.cmp_format({
	      mode = 'symbol_text',
	      menu = {
		      buffer = "[buf]",
		      nvim_lsp = "[LSP]",
		      nvim_lua = "[api]",
		      path = "[path]",
		      luasnip = "[snip]",
	      }
	    })
	  },
	  snippet = {
	    expand = function(args)
	      luasnip.lsp_expand(args.body)
	    end,
	  },
	  mapping = {
	    ['<C-p>'] = cmp.mapping.select_prev_item(),
	    ['<C-n>'] = cmp.mapping.select_next_item(),
	    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
	    ['<C-f>'] = cmp.mapping.scroll_docs(4),
	    ['<C-Space>'] = cmp.mapping.complete(),
	    ['<C-e>'] = cmp.mapping.close(),
	    ['<CR>'] = cmp.mapping.confirm {
	      behavior = cmp.ConfirmBehavior.Insert,
	      select = true,
	    },
	    ['<Tab>'] = function(fallback)
	      if cmp.visible() then
		cmp.select_next_item()
	      elseif luasnip.expand_or_jumpable() then
		luasnip.expand_or_jump()
	      else
		fallback()
	      end
	    end,
	    ['<S-Tab>'] = function(fallback)
	      if cmp.visible() then
		cmp.select_prev_item()
	      elseif luasnip.jumpable(-1) then
		luasnip.jump(-1)
	      else
		fallback()
	      end
	    end,
	  },
	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'nvim_lua' },
		{ name = 'path' },
		{ name = 'luasnip' },
		{ name = 'buffer', keyword_length = 5 },
       },
       experimental = {
	       ghost_text = true
       }
    }
end

return M
