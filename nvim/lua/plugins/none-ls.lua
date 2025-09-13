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

		require("mason-null-ls").setup({
			ensure_installed = {
				"stylua",
				"eslint_d",
				"shfmt",
				"checkmake",
				"ruff",
				"prettierd",
				"prettier",
			},
			automatic_installation = true,
		})

		local sources = {
			diagnostics.checkmake,
			formatting.stylua,
			formatting.shfmt.with({ args = { "-i", "4" } }),
			formatting.terraform_fmt,
			require("none-ls.formatting.ruff").with({ extra_args = { "--extend-select", "I" } }),
			require("none-ls.formatting.ruff_format"),
			formatting.prettierd.with({
				filetypes = {
					"html",
					"json",
					"yaml",
					"markdown",
					"javascript",
					"typescript",
					"typescriptreact",
					"react",
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

		local augroup = vim.api.nvim_create_augroup("LspFormatting", { clear = true })

		null_ls.setup({
			debug = false, -- disable debug in regular usage
			sources = sources,
			on_attach = function(client, bufnr)
				if client:supports_method("textDocument/formatting") then
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
