return {
	-- Null-ls for formatting and linting
	{
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			require("null-ls").setup({
				sources = {
					-- Use Prettier for formatting
					require("null-ls").builtins.formatting.prettier,
				},
			})
		end,
	},
}
