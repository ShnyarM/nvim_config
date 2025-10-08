-- plugins to implement formatters and linters, these are wrapped into lsps to make it easy us
return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				-- all of these have to be manually installed through :Mason
				null_ls.builtins.formatting.stylua, -- formatter for lua

				null_ls.builtins.formatting.prettier, -- formatter for javascript
				null_ls.builtins.diagnostics.eslint_d, -- linter for javascript

				null_ls.builtins.formatting.black, -- formatter for python
				null_ls.builtins.formatting.isort, -- formatter for python, sorts imports alphabetically
			},
		})

		vim.keymap.set("n", "<leader>GF", vim.lsp.buf.format, {}) -- <leader>GF (shift) to use formatter
	end,
}
