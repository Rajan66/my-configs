return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
		"jayp0521/mason-null-ls.nvim", -- ensure dependencies are installed
	},
	config = function()
		local null_ls = require("null-ls")
		local formatting = null_ls.builtins.formatting -- formatters
		local diagnostics = null_ls.builtins.diagnostics -- linters

		-- Ensure other formatters & linters are installed via Mason
		require("mason-null-ls").setup({
			ensure_installed = {
				"stylua", -- Lua formatter
				"eslint_d", -- TS/JS linter
				"shfmt", -- Shell script formatter
				"checkmake", -- Linter for Makefiles
				"ruff", -- Python linter and formatter
				"prettierd",
				"prettier",
			},
			automatic_installation = true,
		})

		local sources = {
			-- Linting
			diagnostics.checkmake,

			-- Formatting
			formatting.stylua,
			formatting.shfmt.with({ args = { "-i", "4" } }),
			formatting.terraform_fmt,
			require("none-ls.formatting.ruff").with({ extra_args = { "--extend-select", "I" } }),
			require("none-ls.formatting.ruff_format"),

			--Prettier Formatting
			formatting.prettierd.with({
				filetypes = {
					"html",
					"json",
					"yaml",
					"markdown",
					"javascript",
					"typescript",
					"typescriptreact", -- Explicitly add this
					"react", -- Added for good measure
					"css",
					"scss",
					"javascriptreact",
					"vue",
					"svelte",
				},
				extra_args = function(params)
					local local_prettier_config = vim.fn.findfile(".prettierrc", ".;")
					if local_prettier_config ~= "" then
						return { "--config", local_prettier_config }
					end
					return {}
				end,
			}),
		}

		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
		null_ls.setup({
			debug = true, -- Add debug mode for troubleshooting
			sources = sources,
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({
								async = false,
								filter = function(c)
									return c.name == "null-ls"
								end,
							})
						end,
					})
				end
			end,
		})
	end,
}
